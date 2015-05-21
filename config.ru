#!/usr/bin/env ruby
require 'rubygems'
require 'gollum/app'

gollum_path = File.expand_path(File.dirname(__FILE__))
Precious::App.set(:gollum_path, gollum_path)
Precious::App.set(:default_markup, :markdown)
wiki_options = {
    :css => true,
    :universal_toc => true,
#    :template_dir => gollum_path,
    :allow_editing => false,
    :mathjax => true
}
Precious::App.set(:wiki_options, wiki_options)
run Precious::App
