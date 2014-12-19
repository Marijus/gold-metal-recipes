import json

from django.shortcuts import render, redirect, get_object_or_404
from django.contrib.auth.decorators import login_required
from django.http import HttpResponse

from recipes.models import Measurement, Product, ProductMeasurement, Fridge, Recipe, Ingridient, Menu, Rating, MenuItem
from recipes.forms import MeasurmentForm, ProductForm, FridgeForm, RecipeForm, IngredientFormSet, MenuForm
from recipes.search import get_query


def index(request):
    return render(request, "recipes/index.html")


@login_required
def add_recipe(request):
    if request.method == "POST":
        form = RecipeForm(request.POST, request.FILES)
        if form.is_valid():
            new_recipe = form.save(commit=False)
            new_recipe.user = request.user
            formset = IngredientFormSet(request.POST, instance=new_recipe)

            if formset.is_valid():
                new_recipe.save()
                formset.save()
                print "hi"

            return redirect('recipes.views.recipe', slug=new_recipe.slug)
    else:
        form = RecipeForm()

    formset = IngredientFormSet(instance=Recipe())

    return render(request, "recipes/add_recipe.html", {"form": form, "formset": formset})


def recipe(request, slug):
    context = dict()
    recipe = get_object_or_404(Recipe, slug=slug)

    if request.user.is_authenticated():
        fridge = Fridge.objects.get(user=request.user)
    else:
        fridge = None

    if "portions" in request.GET:
        matches = recipe.match_with_fridge(fridge, int(request.GET["portions"]))
        context["portions"] = int(request.GET["portions"])
    else:
        matches = recipe.match_with_fridge(fridge)
        context["portions"] = 1

    context["matches"] = matches
    context["recipe"] = recipe

    return render(request, "recipes/recipe.html", context)


@login_required
def can_make_recipe(request, id):
    if request.is_ajax():
        try:
            response_dict = {
                "can_make": Recipe.objects.get(id=id).can_make_from_fridge(Fridge.objects.get(user=request.user),
                                                                           int(request.POST["portions"]))}

            return HttpResponse(json.dumps(response_dict), mimetype='application/json')
        except Exception, err:
            return HttpResponse(500)
    else:
        return HttpResponse(500)


@login_required
def rate_recipe(request, id):
    if request.is_ajax() and request.method == "POST" and "rating" in request.POST:
        try:
            recipe = Recipe.objects.get(id=id)
            fridge = Fridge.objects.get(user=request.user)

            # Create rating
            if Rating.objects.filter(user=request.user, recipe=recipe).exists():
                rating = Rating.objects.get(user=request.user, recipe=recipe)
                rating.rating = request.POST["rating"]
                rating.save()
            else:
                rating = Rating()
                rating.recipe = recipe
                rating.user = request.user
                rating.rating = request.POST["rating"]
                rating.save()

            # Remove recipes' ingridients from fridge
            portions = int(request.POST["portions"])

            for ingridient in Ingridient.objects.filter(recipe=recipe):
                for item in fridge.products.all():
                    if item.product == ingridient.product:
                        if ingridient.value * portions < item.value:
                            item.value -= ingridient.value
                            item.save()
                        else:
                            item.delete()
                        break

            response_dict = {"new_rating": recipe.get_overall_rating()}
            return HttpResponse(json.dumps(response_dict), mimetype='application/json')
        except Exception, err:
            return HttpResponse(500)

    return HttpResponse(500)


def recipes(request):
    recipes = Recipe.objects.filter()

    if 'query' in request.GET and request.GET['query'].strip():
        query = get_query(request.GET['query'], ['title'])
        recipes = recipes.filter(query)
    if 'can_make' in request.GET:
        fridge = Fridge.objects.get(user=request.user)
        recipes = [recipe for recipe in recipes if recipe.can_make_from_fridge(fridge)]
    if "orderby" in request.GET:
        selected_option = request.GET["orderby"]
        if selected_option == "rating":
            recipes = recipes.order_by('-rating')
        elif selected_option == "date":
            recipes = recipes.order_by('-date')

    return render(request, "recipes/recipes.html", {"recipes": recipes})


@login_required
def add_measurement(request):
    if request.method == "POST":
        form = MeasurmentForm(request.POST)
        new_measurement = form.save()

        return render(request, "recipes/add_measurement.html", {"form": MeasurmentForm(),
                                                                "success": True})

    form = MeasurmentForm()

    return render(request, "recipes/add_measurement.html", {"form": form})


@login_required
def add_product(request):
    context = {"form": ProductForm}

    if request.method == "POST":
        form = ProductForm(request.POST, request.FILES)
        new_product = form.save()
        context["success"] = True

    return render(request, "recipes/add_product.html", context)


def products(request):
    if 'query' in request.GET and request.GET['query'].strip():
        query = get_query(request.GET['query'], ['title'])
        products = Product.objects.filter(query)
    else:
        products = Product.objects.all()

    return render(request, "recipes/products.html", {"products": products})


def measurements(request):
    measurements = Measurement.objects.all()

    return render(request, "recipes/measurements.html", {"measurements": measurements})


@login_required
def add_to_fridge(request):
    if request.method == "POST":
        form = FridgeForm(request.POST)

        if form.is_valid():
            fridge = Fridge.objects.get(user=request.user)

            if ProductMeasurement.objects.filter(fridge=fridge, product=form.cleaned_data["product"],
                                                 measurement=form.cleaned_data["measurement"]).exists():
                pm = ProductMeasurement.objects.get(fridge=fridge, product=form.cleaned_data["product"],
                                                    measurement=form.cleaned_data["measurement"])
                pm.value += form.cleaned_data["amount"]
                pm.save()
            else:
                pm = ProductMeasurement()
                pm.product = form.cleaned_data["product"]
                pm.value = form.cleaned_data["amount"]
                pm.measurement = form.cleaned_data["measurement"]
                pm.save()
                fridge.products.add(pm)
                fridge.save()

            return redirect('recipes.views.products')
    else:
        if "product" in request.GET:
            form = FridgeForm(initial={'product': Product.objects.get(id=request.GET.get("product"))})
        else:
            form = FridgeForm()

        return render(request, "recipes/add_to_fridge.html", {"form": form})


@login_required
def add_to_menu(request):
    if request.method == "POST":
        form = MenuForm(request.POST)
        if form.is_valid():
            menu = Menu.objects.get(user=request.user)

            # create menu item
            menu_item = MenuItem()
            menu_item.recipe = form.cleaned_data["recipe"]
            menu_item.date = form.cleaned_data["date"]
            menu_item.portions = form.cleaned_data["portions"]
            menu_item.menu = menu
            menu_item.save()

            return redirect('recipes.views.menu')
    else:
        if "recipe" in request.GET:
            form = MenuForm(initial={"recipe": Recipe.objects.get(id=request.GET["recipe"]),
                                     "portions": 1})
        else:
            form = MenuForm

        return render(request, "recipes/add_to_menu.html", {"form": form})


@login_required
def remove_from_fridge(request, id):
    product_measurement = get_object_or_404(ProductMeasurement, id=id)
    product_measurement.delete()

    return redirect('recipes.views.fridge')


@login_required
def remove_from_menu(request, id):
    MenuItem.objects.get(id=id).delete()

    return redirect('recipes.views.menu')


# @login_required
# def add_to_menu(request):
# if request.method == "POST" and request.is_ajax():
# try:
#             data = request.POST
#             recipe = get_object_or_404(Recipe, id=data["recipe_id"])
#             menu = Menu.objects.get(user=request.user)
#             menu.recipes.add(recipe)
#
#             return HttpResponse(200)
#         except:
#             return HttpResponse(500)
#
#     return HttpResponse(500)


@login_required
def menu(request):
    menu = Menu.objects.get(user=request.user)
    fridge = Fridge.objects.get(user=request.user)

    recipes = dict()
    for r in MenuItem.objects.filter(menu=menu):
        recipes[r] = r.match_with_fridge(fridge, r.portions)

    return render(request, "recipes/menu.html", {"recipes": recipes})


@login_required
def fridge(request):
    fridge = Fridge.objects.get(user=request.user)
    products = fridge.products.all()

    return render(request, "recipes/fridge.html", {"products": products})


@login_required
def shopping_list(request):
    menu = get_object_or_404(Menu, user=request.user)
    fridge = get_object_or_404(Fridge, user=request.user)
    menu_items = [recipe.recipe.match_with_fridge(fridge, recipe.portions) for recipe in
                  MenuItem.objects.filter(menu=menu)]

    missing_ingridients = list()

    for menu_item in menu_items:
        for item in menu_item:
            # create new item in shopping list
            new_item_created = True
            missing_ingridient = {"missing_value": 0}

            # check if the same item is already in the shopping list
            for ingridient in missing_ingridients:
                if ingridient["product"] == item["ingridient"].product and ingridient["measurement"] == item[
                    "ingridient"].measurement:
                    missing_ingridient = ingridient
                    new_item_created = False
                    break

            # if item is not in the fridge or it is in the fridge but some amount is missing
            if not item["in_fridge"] or item["missing"]:
                missing_ingridient["product"] = item["ingridient"].product
                missing_ingridient["measurement"] = item["ingridient"].measurement

                if "missing_value" in item:
                    missing_ingridient["missing_value"] += item["missing_value"]
                else:
                    missing_ingridient["missing_value"] += item["ingridient_value"]

                if new_item_created:
                    missing_ingridients.append(missing_ingridient)

    return render(request, "recipes/shopping_list.html", {"missing_ingridients": missing_ingridients})