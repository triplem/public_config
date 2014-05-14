#!/usr/bin/env ruby
require 'rubygems'
require 'gollum/app'

gollum_path = File.expand_path(File.dirname(__FILE__)) # CHANGE THIS TO POINT TO YOUR OWN WIKI REPO
Precious::App.set(:gollum_path, gollum_path)
Precious::App.set(:default_markup, :markdown) # set your favorite markup language
Precious::App.set(:wiki_options, {
	:universal_toc => false,
	:live_preview => false,
	:show_all => true
})

# usually just run Precious::App, but we are using a base_path ;-)

map '/wiki/public' do
    run Precious::App
end
