# -*- coding: utf-8 -*-
from south.utils import datetime_utils as datetime
from south.db import db
from south.v2 import SchemaMigration
from django.db import models


class Migration(SchemaMigration):

    def forwards(self, orm):
        # Adding model 'Category'
        db.create_table(u'recipes_category', (
            (u'id', self.gf('django.db.models.fields.AutoField')(primary_key=True)),
            ('title', self.gf('django.db.models.fields.CharField')(max_length=250)),
        ))
        db.send_create_signal(u'recipes', ['Category'])

        # Adding model 'Recipe'
        db.create_table(u'recipes_recipe', (
            (u'id', self.gf('django.db.models.fields.AutoField')(primary_key=True)),
            ('category', self.gf('django.db.models.fields.related.ForeignKey')(to=orm['recipes.Category'])),
            ('title', self.gf('django.db.models.fields.CharField')(max_length=250)),
            ('ingridients', self.gf('django.db.models.fields.TextField')()),
            ('description', self.gf('django.db.models.fields.TextField')()),
            ('visability', self.gf('django.db.models.fields.CharField')(default='1', max_length=1)),
            ('photo1', self.gf('django.db.models.fields.files.ImageField')(max_length=100)),
            ('photo2', self.gf('django.db.models.fields.files.ImageField')(max_length=100)),
            ('photo3', self.gf('django.db.models.fields.files.ImageField')(max_length=100)),
        ))
        db.send_create_signal(u'recipes', ['Recipe'])


    def backwards(self, orm):
        # Deleting model 'Category'
        db.delete_table(u'recipes_category')

        # Deleting model 'Recipe'
        db.delete_table(u'recipes_recipe')


    models = {
        u'recipes.category': {
            'Meta': {'object_name': 'Category'},
            u'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'title': ('django.db.models.fields.CharField', [], {'max_length': '250'})
        },
        u'recipes.recipe': {
            'Meta': {'object_name': 'Recipe'},
            'category': ('django.db.models.fields.related.ForeignKey', [], {'to': u"orm['recipes.Category']"}),
            'description': ('django.db.models.fields.TextField', [], {}),
            u'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'ingridients': ('django.db.models.fields.TextField', [], {}),
            'photo1': ('django.db.models.fields.files.ImageField', [], {'max_length': '100'}),
            'photo2': ('django.db.models.fields.files.ImageField', [], {'max_length': '100'}),
            'photo3': ('django.db.models.fields.files.ImageField', [], {'max_length': '100'}),
            'title': ('django.db.models.fields.CharField', [], {'max_length': '250'}),
            'visability': ('django.db.models.fields.CharField', [], {'default': "'1'", 'max_length': '1'})
        }
    }

    complete_apps = ['recipes']