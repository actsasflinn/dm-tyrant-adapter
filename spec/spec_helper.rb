require 'pathname'
require 'rubygems'

gem 'rspec', '~>1.1.11'
require 'spec'

require Pathname(__FILE__).dirname.expand_path.parent + 'lib/tyrant_adapter'

DataMapper.setup(:default, "tyrant://some/uri/here")

