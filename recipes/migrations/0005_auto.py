# -*- coding: utf-8 -*-
from south.utils import datetime_utils as datetime
from south.db import db
from south.v2 import SchemaMigration
from django.db import models


class Migration(SchemaMigration):

    def forwards(self, orm):
        # Removing M2M table for field ingridients on 'Recipe'
        db.delete_table(db.shorten_name(u'recipes_recipe_ingridients'))


    def backwards(self, orm):
        # Adding M2M table for field ingridients on 'Recipe'
        m2m_table_name = db.shorten_name(u'recipes_recipe_ingridients')
        db.create_table(m2m_table_name, (
            ('id', models.AutoField(verbose_name='ID', primary_key=True, auto_created=True)),
            ('recipe', models.ForeignKey(orm[u'recipes.recipe'], null=False)),
            ('ingridient', models.ForeignKey(orm[u'recipes.ingridient'], null=False))
        ))
        db.create_unique(m2m_table_name, ['recipe_id', 'ingridient_id'])


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
            'photo1': ('django.db.models.fields.files.ImageField', [], {'max_length': '100'}),
            'photo2': ('django.db.models.fields.files.ImageField', [], {'max_length': '100'}),
            'photo3': ('django.db.models.fields.files.ImageField', [], {'max_length': '100'}),
            'title': ('django.db.models.fields.CharField', [], {'max_length': '250'}),
            'visability': ('django.db.models.fields.CharField', [], {'default': "'1'", 'max_length': '1'})
        }
    }

    complete_apps = ['recipes']