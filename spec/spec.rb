require 'rubygems'
require 'bacon'
require 'pathname'

# DataMapper.setup(:default, "tyrant://some/uri/here")

DataMapper::Logger.new(nil, :debug)

Pathname.glob(Pathname(__FILE__).dirname.join("**/*_spec.rb"))
