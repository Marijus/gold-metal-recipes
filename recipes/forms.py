from recipes.models import Measurement, Product, Fridge

from django import forms


class MeasurmentForm(forms.ModelForm):
    class Meta:
        model = Measurement


class ProductForm(forms.ModelForm):
    class Meta:
        model = Product


class FridgeForm(forms.Form):
    product = forms.ModelChoiceField(queryset=None, widget=forms.Select(attrs={'class': 'form-control'}))
    amount = forms.DecimalField(decimal_places=2, widget=forms.NumberInput(attrs={'class': 'form-control'}))
    measurement = forms.ModelChoiceField(queryset=None, widget=forms.Select(attrs={'class': 'form-control'}))

    def __init__(self, *args, **kwargs):
        super(FridgeForm, self).__init__(*args, **kwargs)
        self.fields['product'].queryset = Product.objects.all()
        self.fields['measurement'].queryset = Measurement.objects.all()