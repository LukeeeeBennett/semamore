Gem::Specification.new do |s|
  s.name        = 'semamore'
  s.version     = '0.0.1'
  s.date        = '2019-07-25'
  s.summary     = 'Run commands depending on changed files'
  s.description = 'Run commands conditionally depending on github PR changed files'
  s.authors     = ['Luke Bennett']
  s.email       = 'contact@luke.run'
  s.files       = ['lib/semamore.rb', 'lib/semamore_octo_client.rb']
  s.executables << 'semamore'
  s.homepage    = 'https://gitlab.com/LukeeeeBennett/semamore'
  s.license     = 'MIT'
end
