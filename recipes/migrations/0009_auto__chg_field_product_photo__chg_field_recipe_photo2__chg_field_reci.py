# -*- coding: utf-8 -*-
from south.utils import datetime_utils as datetime
from south.db import db
from south.v2 import SchemaMigration
from django.db import models


class Migration(SchemaMigration):

    def forwards(self, orm):

        # Changing field 'Product.photo'
        db.alter_column(u'recipes_product', 'photo', self.gf('sorl.thumbnail.fields.ImageField')(max_length=100, null=True))

        # Changing field 'Recipe.photo2'
        db.alter_column(u'recipes_recipe', 'photo2', self.gf('sorl.thumbnail.fields.ImageField')(max_length=100))

        # Changing field 'Recipe.photo3'
        db.alter_column(u'recipes_recipe', 'photo3', self.gf('sorl.thumbnail.fields.ImageField')(max_length=100))

        # Changing field 'Recipe.photo1'
        db.alter_column(u'recipes_recipe', 'photo1', self.gf('sorl.thumbnail.fields.ImageField')(max_length=100))

    def backwards(self, orm):

        # Changing field 'Product.photo'
        db.alter_column(u'recipes_product', 'photo', self.gf('django.db.models.fields.files.ImageField')(max_length=100, null=True))

        # Changing field 'Recipe.photo2'
        db.alter_column(u'recipes_recipe', 'photo2', self.gf('django.db.models.fields.files.ImageField')(max_length=100))

        # Changing field 'Recipe.photo3'
        db.alter_column(u'recipes_recipe', 'photo3', self.gf('django.db.models.fields.files.ImageField')(max_length=100))

        # Changing field 'Recipe.photo1'
        db.alter_column(u'recipes_recipe', 'photo1', self.gf('django.db.models.fields.files.ImageField')(max_length=100))

    models = {
        u'recipes.category': {
            'Meta': {'object_name': 'Category'},
            u'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'title': ('django.db.models.fields.CharField', [], {'max_length': '250'})
        },
        u'recipes.measurement': {
            'Meta': {'object_name': 'Measurement'},
            u'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'short_title': ('django.db.models.fields.CharField', [], {'max_length': '10'}),
            'title': ('django.db.models.fields.CharField', [], {'max_length': '250'})
        },
        u'recipes.product': {
            'Meta': {'object_name': 'Product'},
            'description': ('django.db.models.fields.TextField', [], {'null': 'True', 'blank': 'True'}),
            u'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'photo': ('sorl.thumbnail.fields.ImageField', [], {'max_length': '100', 'null': 'True', 'blank': 'True'}),
            'title': ('django.db.models.fields.CharField', [], {'max_length': '250'})
        },
        u'recipes.productmeasurement': {
            'Meta': {'object_name': 'ProductMeasurement'},
            u'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'measurement': ('django.db.models.fields.related.ForeignKey', [], {'to': u"orm['recipes.Measurement']"}),
            'product': ('django.db.models.fields.related.ForeignKey', [], {'to': u"orm['recipes.Product']"}),
            'value': ('django.db.models.fields.FloatField', [], {})
        },
        u'recipes.recipe': {
            'Meta': {'object_name': 'Recipe'},
            'category': ('django.db.models.fields.related.ForeignKey', [], {'to': u"orm['recipes.Category']"}),
            'description': ('django.db.models.fields.TextField', [], {}),
            u'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'photo1': ('sorl.thumbnail.fields.ImageField', [], {'max_length': '100'}),
            'photo2': ('sorl.thumbnail.fields.ImageField', [], {'max_length': '100'}),
            'photo3': ('sorl.thumbnail.fields.ImageField', [], {'max_length': '100'}),
            'products': ('django.db.models.fields.related.ManyToManyField', [], {'to': u"orm['recipes.ProductMeasurement']", 'symmetrical': 'False'}),
            'title': ('django.db.models.fields.CharField', [], {'max_length': '250'}),
            'visability': ('django.db.models.fields.CharField', [], {'default': "'1'", 'max_length': '1'})
        }
    }

    complete_apps = ['recipes']