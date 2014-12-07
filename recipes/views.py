from django.shortcuts import render

from recipes.models import Measurement, Product
from recipes.forms import MeasurmentForm, ProductForm

def index(request):
    return render(request, "base.html")


def add_recipe(request):
    return render(request, "recipes/add_recipe.html")


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
    products = Product.objects.all()

    return render(request, "recipes/products.html", {"products": products})