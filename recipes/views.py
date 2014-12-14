from django.shortcuts import render, redirect, get_object_or_404
from django.contrib.auth.decorators import login_required
from django.http import HttpResponse

from recipes.models import Measurement, Product, ProductMeasurement, Fridge, Recipe, Ingridient, Menu
from recipes.forms import MeasurmentForm, ProductForm, FridgeForm, RecipeForm, IngredientFormSet
from recipes.search import get_query

def index(request):
    return render(request, "base.html")


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

        print "success"

    form = RecipeForm()
    formset = IngredientFormSet(instance=Recipe())

    return render(request, "recipes/add_recipe.html", {"form": form, "formset": formset})


def recipe(request, slug):
    recipe = get_object_or_404(Recipe, slug=slug)

    return render(request, "recipes/recipe.html", {"recipe": recipe})


def recipes(request):
    if 'query' in request.GET and request.GET['query'].strip():
        query = get_query(request.GET['query'], ['title'])
        recipes = Recipe.objects.filter(query)
    else:
        recipes = Recipe.objects.all()

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
            # create product measurement
            pm = ProductMeasurement()
            pm.product = form.cleaned_data["product"]
            pm.value = form.cleaned_data["amount"]
            pm.measurement = form.cleaned_data["measurement"]
            pm.save()

            # check if user already has fridge
            # TODO: create fridge upon user creation
            fridge = Fridge.objects.get(user=request.user)  # TODO: check if product already exists in fridge

            # add product measurement to fridge
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
    if request.method == "POST" and request.is_ajax():
        try:
            data = request.POST
            recipe = get_object_or_404(Recipe, id=data["recipe_id"])
            menu = Menu.objects.get(user=request.user)
            menu.recipes.add(recipe)

            return HttpResponse(200)
        except:
            return HttpResponse(500)

    return HttpResponse(500)


def menu(request):
    menu = Menu.objects.get(user=request.user)
    fridge = Fridge.objects.get(user=request.user)

    recipes = dict()
    for r in menu.recipes.all():
        recipes[r] = r.match_with_fridge(fridge)

    print recipes

    return render(request, "recipes/menu.html", {"recipes": recipes})


def fridge(request):
    fridge = Fridge.objects.get(user=request.user)
    products = fridge.products.all()

    return render(request, "recipes/fridge.html", {"products": products})