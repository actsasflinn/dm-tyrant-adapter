require 'pathname'
require 'rubygems'
require 'hoe'

ROOT    = Pathname(__FILE__).dirname.expand_path
JRUBY   = RUBY_PLATFORM =~ /java/
WINDOWS = Gem.win_platform?
SUDO    = (WINDOWS || JRUBY) ? '' : ('sudo' unless ENV['SUDOLESS'])

require ROOT + 'lib/tyrant_adapter/version'

# define some constants to help with task files
GEM_NAME    = 'dm-tyrant-adapter'
GEM_VERSION = DataMapper::TyrantAdapter::VERSION

Hoe.new(GEM_NAME, GEM_VERSION) do |p|
  p.developer('John Doe', 'john [a] doe [d] com')

  p.description = 'A DataMapper Adapter for ...'
  p.summary = 'A DataMapper Adapter for ...'
  p.url = 'http://github.com/USERNAME/dm-tyrant-adapter'

  p.clean_globs |= %w[ log pkg coverage ]
  p.spec_extras = { :has_rdoc => true, :extra_rdoc_files => %w[ README.txt LICENSE TODO History.txt ] }

  p.extra_deps << [['dm-core', "~> 0.9.10"]]

end

Pathname.glob(ROOT.join('tasks/**/*.rb').to_s).each { |f| require f }
