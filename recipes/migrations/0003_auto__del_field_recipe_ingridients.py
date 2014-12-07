# -*- coding: utf-8 -*-
from south.utils import datetime_utils as datetime
from south.db import db
from south.v2 import SchemaMigration
from django.db import models


class Migration(SchemaMigration):

    def forwards(self, orm):
        # Deleting field 'Recipe.ingridients'
        db.delete_column(u'recipes_recipe', 'ingridients')

        # Adding M2M table for field ingridients on 'Recipe'
        m2m_table_name = db.shorten_name(u'recipes_recipe_ingridients')
        db.create_table(m2m_table_name, (
            ('id', models.AutoField(verbose_name='ID', primary_key=True, auto_created=True)),
            ('recipe', models.ForeignKey(orm[u'recipes.recipe'], null=False)),
            ('ingridient', models.ForeignKey(orm[u'recipes.ingridient'], null=False))
        ))
        db.create_unique(m2m_table_name, ['recipe_id', 'ingridient_id'])


    def backwards(self, orm):

        # User chose to not deal with backwards NULL issues for 'Recipe.ingridients'
        raise RuntimeError("Cannot reverse this migration. 'Recipe.ingridients' and its values cannot be restored.")
        
        # The following code is provided here to aid in writing a correct migration        # Adding field 'Recipe.ingridients'
        db.add_column(u'recipes_recipe', 'ingridients',
                      self.gf('django.db.models.fields.TextField')(),
                      keep_default=False)

        # Removing M2M table for field ingridients on 'Recipe'
        db.delete_table(db.shorten_name(u'recipes_recipe_ingridients'))


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