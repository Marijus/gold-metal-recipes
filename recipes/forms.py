from recipes.models import Measurement, Product

from django import forms


class MeasurmentForm(forms.ModelForm):
    class Meta:
        model = Measurement


class ProductForm(forms.ModelForm):
    class Meta:
        model = Product
