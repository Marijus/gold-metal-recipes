# -*- coding: utf-8 -*-
from south.utils import datetime_utils as datetime
from south.db import db
from south.v2 import SchemaMigration
from django.db import models


class Migration(SchemaMigration):

    def forwards(self, orm):
        # Adding model 'Measurment'
        db.create_table(u'recipes_measurment', (
            (u'id', self.gf('django.db.models.fields.AutoField')(primary_key=True)),
            ('title', self.gf('django.db.models.fields.CharField')(max_length=250)),
            ('short_title', self.gf('django.db.models.fields.CharField')(max_length=10)),
        ))
        db.send_create_signal(u'recipes', ['Measurment'])

        # Adding model 'IngridientMeasurement'
        db.create_table(u'recipes_ingridientmeasurement', (
            (u'id', self.gf('django.db.models.fields.AutoField')(primary_key=True)),
            ('ingridient', self.gf('django.db.models.fields.related.ForeignKey')(to=orm['recipes.Ingridient'])),
            ('measurment', self.gf('django.db.models.fields.related.ForeignKey')(to=orm['recipes.Measurment'])),
            ('value', self.gf('django.db.models.fields.FloatField')()),
        ))
        db.send_create_signal(u'recipes', ['IngridientMeasurement'])


    def backwards(self, orm):
        # Deleting model 'Measurment'
        db.delete_table(u'recipes_measurment')

        # Deleting model 'IngridientMeasurement'
        db.delete_table(u'recipes_ingridientmeasurement')


    models = {
        u'recipes.category': {
            'Meta': {'object_name': 'Category'},
            u'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'title': ('django.db.models.fields.CharField', [], {'max_length': '250'})
        },
        u'recipes.ingridient': {
            'Meta': {'object_name': 'Ingridient'},
            u'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'title': ('django.db.models.fields.CharField', [], {'max_length': '250'})
        },
        u'recipes.ingridientmeasurement': {
            'Meta': {'object_name': 'IngridientMeasurement'},
            u'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'ingridient': ('django.db.models.fields.related.ForeignKey', [], {'to': u"orm['recipes.Ingridient']"}),
            'measurment': ('django.db.models.fields.related.ForeignKey', [], {'to': u"orm['recipes.Measurment']"}),
            'value': ('django.db.models.fields.FloatField', [], {})
        },
        u'recipes.measurment': {
            'Meta': {'object_name': 'Measurment'},
            u'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'short_title': ('django.db.models.fields.CharField', [], {'max_length': '10'}),
            'title': ('django.db.models.fields.CharField', [], {'max_length': '250'})
        },
        u'recipes.recipe': {
            'Meta': {'object_name': 'Recipe'},
            'category': ('django.db.models.fields.related.ForeignKey', [], {'to': u"orm['recipes.Category']"}),
            'description': ('django.db.models.fields.TextField', [], {}),
            u'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'ingridients': ('django.db.models.fields.related.ManyToManyField', [], {'to': u"orm['recipes.Ingridient']", 'symmetrical': 'False'}),
            'photo1': ('django.db.models.fields.files.ImageField', [], {'max_length': '100'}),
            'photo2': ('django.db.models.fields.files.ImageField', [], {'max_length': '100'}),
            'photo3': ('django.db.models.fields.files.ImageField', [], {'max_length': '100'}),
            'title': ('django.db.models.fields.CharField', [], {'max_length': '250'}),
            'visability': ('django.db.models.fields.CharField', [], {'default': "'1'", 'max_length': '1'})
        }
    }

    complete_apps = ['recipes']