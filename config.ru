#!/usr/bin/env ruby
require 'rubygems'
require 'gollum/app'

gollum_path = File.expand_path(File.dirname(__FILE__))
template_path = File.expand_path('_templates')
base_path = 'en/'

Precious::App.set(:gollum_path, gollum_path)
Precious::App.set(:default_markup, :github)

wiki_options = {
    :css => true,
    :universal_toc => false,
    :template_dir => template_path,
    :allow_editing => false,
    :live_preview => false,
    :mathjax => true,
    :h1_title => true
}
Precious::App.set(:wiki_options, wiki_options)


require 'rack'

class MapGollum
    def initialize base_path
    @mg = Rack::Builder.new do
        map '/' do
        run Proc.new { [302, { 'Location' => "/#{base_path}" }, []] }
        end

        map "/#{base_path}" do
        run Precious::App
        end
    end
    end

    def call(env)
    @mg.call(env)
    end
end

Rack::Server.new(:app => MapGollum.new(base_path)).start
