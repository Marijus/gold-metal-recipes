from recipes.models import Measurement, Product, Recipe, Ingridient

from django import forms
from django.forms.models import inlineformset_factory

attributes = {'class': 'form-control'}

class MeasurmentForm(forms.ModelForm):
    class Meta:
        model = Measurement


class ProductForm(forms.ModelForm):
    class Meta:
        model = Product


class FridgeForm(forms.Form):
    product = forms.ModelChoiceField(queryset=None, widget=forms.Select(attrs={'class': 'form-control'}))
    amount = forms.FloatField(widget=forms.NumberInput(attrs={'class': 'form-control'}))
    measurement = forms.ModelChoiceField(queryset=None, widget=forms.Select(attrs={'class': 'form-control'}))

    def __init__(self, *args, **kwargs):
        super(FridgeForm, self).__init__(*args, **kwargs)
        self.fields['product'].queryset = Product.objects.all()
        self.fields['measurement'].queryset = Measurement.objects.all()


class RecipeForm(forms.ModelForm):
    title = forms.CharField(widget=forms.TextInput(attrs=attributes))
    description = forms.CharField(widget=forms.Textarea(attrs=attributes))

    class Meta:
        model = Recipe
        exclude = ('slug', 'overall_rating',)

    def __init__(self, *args, **kwargs):
        super(RecipeForm, self).__init__(*args, **kwargs)
        self.fields['photo2'].required = False
        self.fields['photo3'].required = False


class IngridientForm(forms.ModelForm):
    product = forms.ModelChoiceField(queryset=None, widget=forms.Select(attrs={'class': 'form-control'}))
    value = forms.DecimalField(decimal_places=2, widget=forms.NumberInput(attrs={'class': 'form-control', 'placeholder': 'Kiekis'}))
    measurement = forms.ModelChoiceField(queryset=None, widget=forms.Select(attrs={'class': 'form-control'}))

    def __init__(self, *args, **kwargs):
        super(IngridientForm, self).__init__(*args, **kwargs)
        self.fields['product'].queryset = Product.objects.all()
        self.fields['measurement'].queryset = Measurement.objects.all()


IngredientFormSet = inlineformset_factory(Recipe, Ingridient, form=IngridientForm)