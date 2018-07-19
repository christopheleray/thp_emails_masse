#require 'bundler'
#Bundler.require
$: << File.join(File.dirname(__FILE__), "/lib/views")
load 'index.rb'
load 'done.rb'

Index.new
