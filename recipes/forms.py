from recipes.models import Measurement, Product

from django import forms


class MeasurmentForm(forms.ModelForm):
    class Meta:
        model = Measurement


class IngridientForm(forms.Form):
    class Meta:
        model = Product
