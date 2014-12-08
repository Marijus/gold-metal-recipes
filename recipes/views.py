from django.shortcuts import render

from recipes.models import Measurement, Product
from recipes.forms import MeasurmentForm, ProductForm
from recipes.search import get_query

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
    if 'query' in request.GET and request.GET['query'].strip():
        query = get_query(request.GET['query'], ['title'])
        products = Product.objects.filter(query)
    else:
        products = Product.objects.all()

    return render(request, "recipes/products.html", {"products": products})


def measurements(request):
    measurements = Measurement.objects.all()

    return render(request, "recipes/measurements.html", {"measurements": measurements})