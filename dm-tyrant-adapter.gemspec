
$gemspec = Gem::Specification.new do |s|

  s.name     = 'dm-tyrant-adapter'
  s.summary  = 'dm adapter for accessing a Tokyo Tyrant/Cabinet store'
  s.version  = '0.0.1'

  s.authors  = ['Justin Reagor']
  s.email    = 'justinwr@gmail.com'
  s.homepage = 'http://cheapRoc.github.org/'
  s.date     = '2009-12-02'

  s.require_path      = 'lib'
  s.test_file         = 'spec/spec.rb'
  s.has_rdoc          = true
  s.extra_rdoc_files  = %w(README.md History.txt)
  s.rubyforge_project = 'dm-tyrant-adapter'

  s.files = Dir['lib/**/*.rb'] + Dir['*.txt'] + Dir['spec/**/*.rb']

  s.platform = Gem::Platform::RUBY

  s.add_runtime_dependency( %q_dm-core_,     ["~> 0.9.10"] )
  s.add_runtime_dependency( %q_rufus-tokyo_, ["~> 0.1.5"] )

end
