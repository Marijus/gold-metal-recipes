from django.shortcuts import render

from recipes.models import Measurement
from recipes.forms import MeasurmentForm

def index(request):
    return render(request, "base.html")


def add_recipe(request):
    return render(request, "recipes/add_recipe.html")


def add_measurement(request):
    if request.method == "POST":
        form = MeasurmentForm(request.POST)
        new_measurement = form.save()

        return render(request, "recipes/add_measurment.html", {"form": MeasurmentForm(),
                                                               "success": True})

    form = MeasurmentForm()

    return render(request, "recipes/add_measurment.html", {"form": form})