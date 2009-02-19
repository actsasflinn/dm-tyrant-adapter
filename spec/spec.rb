require 'rubygems'
require 'bacon'
require 'pathname'
require 'dm-core'
require 'rufus/tokyo/tyrant'
require 'lib/tyrant_adapter'

# DataMapper.setup(:default, "tyrant://some/uri/here")

DataMapper::Logger.new(nil, :debug)

Pathname.glob(Pathname(__FILE__).dirname.join("**/*_spec.rb"))
