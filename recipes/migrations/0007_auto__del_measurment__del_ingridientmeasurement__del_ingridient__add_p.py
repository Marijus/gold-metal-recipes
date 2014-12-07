# -*- coding: utf-8 -*-
from south.utils import datetime_utils as datetime
from south.db import db
from south.v2 import SchemaMigration
from django.db import models


class Migration(SchemaMigration):

    def forwards(self, orm):
        # Deleting model 'Measurment'
        db.delete_table(u'recipes_measurment')

        # Deleting model 'IngridientMeasurement'
        db.delete_table(u'recipes_ingridientmeasurement')

        # Deleting model 'Ingridient'
        db.delete_table(u'recipes_ingridient')

        # Adding model 'ProductMeasurement'
        db.create_table(u'recipes_productmeasurement', (
            (u'id', self.gf('django.db.models.fields.AutoField')(primary_key=True)),
            ('product', self.gf('django.db.models.fields.related.ForeignKey')(to=orm['recipes.Product'])),
            ('measurement', self.gf('django.db.models.fields.related.ForeignKey')(to=orm['recipes.Measurement'])),
            ('value', self.gf('django.db.models.fields.FloatField')()),
        ))
        db.send_create_signal(u'recipes', ['ProductMeasurement'])

        # Adding model 'Product'
        db.create_table(u'recipes_product', (
            (u'id', self.gf('django.db.models.fields.AutoField')(primary_key=True)),
            ('title', self.gf('django.db.models.fields.CharField')(max_length=250)),
        ))
        db.send_create_signal(u'recipes', ['Product'])

        # Adding model 'Measurement'
        db.create_table(u'recipes_measurement', (
            (u'id', self.gf('django.db.models.fields.AutoField')(primary_key=True)),
            ('title', self.gf('django.db.models.fields.CharField')(max_length=250)),
            ('short_title', self.gf('django.db.models.fields.CharField')(max_length=10)),
        ))
        db.send_create_signal(u'recipes', ['Measurement'])

        # Removing M2M table for field ingridients on 'Recipe'
        db.delete_table(db.shorten_name(u'recipes_recipe_ingridients'))

        # Adding M2M table for field products on 'Recipe'
        m2m_table_name = db.shorten_name(u'recipes_recipe_products')
        db.create_table(m2m_table_name, (
            ('id', models.AutoField(verbose_name='ID', primary_key=True, auto_created=True)),
            ('recipe', models.ForeignKey(orm[u'recipes.recipe'], null=False)),
            ('productmeasurement', models.ForeignKey(orm[u'recipes.productmeasurement'], null=False))
        ))
        db.create_unique(m2m_table_name, ['recipe_id', 'productmeasurement_id'])


    def backwards(self, orm):
        # Adding model 'Measurment'
        db.create_table(u'recipes_measurment', (
            (u'id', self.gf('django.db.models.fields.AutoField')(primary_key=True)),
            ('short_title', self.gf('django.db.models.fields.CharField')(max_length=10)),
            ('title', self.gf('django.db.models.fields.CharField')(max_length=250)),
        ))
        db.send_create_signal(u'recipes', ['Measurment'])

        # Adding model 'IngridientMeasurement'
        db.create_table(u'recipes_ingridientmeasurement', (
            ('ingridient', self.gf('django.db.models.fields.related.ForeignKey')(to=orm['recipes.Ingridient'])),
            (u'id', self.gf('django.db.models.fields.AutoField')(primary_key=True)),
            ('value', self.gf('django.db.models.fields.FloatField')()),
            ('measurment', self.gf('django.db.models.fields.related.ForeignKey')(to=orm['recipes.Measurment'])),
        ))
        db.send_create_signal(u'recipes', ['IngridientMeasurement'])

        # Adding model 'Ingridient'
        db.create_table(u'recipes_ingridient', (
            (u'id', self.gf('django.db.models.fields.AutoField')(primary_key=True)),
            ('title', self.gf('django.db.models.fields.CharField')(max_length=250)),
        ))
        db.send_create_signal(u'recipes', ['Ingridient'])

        # Deleting model 'ProductMeasurement'
        db.delete_table(u'recipes_productmeasurement')

        # Deleting model 'Product'
        db.delete_table(u'recipes_product')

        # Deleting model 'Measurement'
        db.delete_table(u'recipes_measurement')

        # Adding M2M table for field ingridients on 'Recipe'
        m2m_table_name = db.shorten_name(u'recipes_recipe_ingridients')
        db.create_table(m2m_table_name, (
            ('id', models.AutoField(verbose_name='ID', primary_key=True, auto_created=True)),
            ('recipe', models.ForeignKey(orm[u'recipes.recipe'], null=False)),
            ('ingridientmeasurement', models.ForeignKey(orm[u'recipes.ingridientmeasurement'], null=False))
        ))
        db.create_unique(m2m_table_name, ['recipe_id', 'ingridientmeasurement_id'])

        # Removing M2M table for field products on 'Recipe'
        db.delete_table(db.shorten_name(u'recipes_recipe_products'))


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
            u'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
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
            'photo1': ('django.db.models.fields.files.ImageField', [], {'max_length': '100'}),
            'photo2': ('django.db.models.fields.files.ImageField', [], {'max_length': '100'}),
            'photo3': ('django.db.models.fields.files.ImageField', [], {'max_length': '100'}),
            'products': ('django.db.models.fields.related.ManyToManyField', [], {'to': u"orm['recipes.ProductMeasurement']", 'symmetrical': 'False'}),
            'title': ('django.db.models.fields.CharField', [], {'max_length': '250'}),
            'visability': ('django.db.models.fields.CharField', [], {'default': "'1'", 'max_length': '1'})
        }
    }

    complete_apps = ['recipes']