#!/usr/bin/env ruby
require 'rubygems'
require 'gollum/app'

gollum_path = File.expand_path(File.dirname(__FILE__))
template_path = File.expand_path('_templates')

Precious::App.set(:gollum_path, gollum_path)
Precious::App.set(:default_markup, :markdown)

wiki_options = {
    :css => true,
    :universal_toc => true,
    :template_dir => template_path,
    :allow_editing => false,
    :live_preview => false,
    :mathjax => true,
    :h1_title => true
}
Precious::App.set(:wiki_options, wiki_options)

run Precious::App
