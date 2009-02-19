require 'pathname'
require 'rubygems'
require 'rake'
require 'rake/clean'
require 'rake/packagetask'
require 'rake/gempackagetask'
require 'bacon'

ROOT = Pathname.pwd
#require ROOT.join(*%w(ext dm-core lib dm-core))
require "dm-core"
require ROOT.join(*%w(lib tyrant_adapter version))

WINDOWS = (PLATFORM =~ /win32|cygwin/ ? true : false) rescue false
SUDO = WINDOWS ? '' : 'sudo'

GEM_NAME    = 'dm-tyrant-adapter'
GEM_VERSION = DataMapper::TyrantAdapter::VERSION

desc "run the bacon specs"
task :default => :spec
task :spec do
  load ROOT.join(*%w(spec spec.rb))
end

load 'dm-tyrant-adapter.gemspec'
Rake::GemPackageTask.new($gemspec) do |pkg|
  pkg.gem_spec = $gemspec
  pkg.need_zip = true
  pkg.need_tar = true
end

ROOT.class.glob(ROOT.join(*%w(tasks ** *.rb)).to_s).each { |f| require f }
