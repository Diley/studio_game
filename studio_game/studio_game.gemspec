Gem::Specification.new do |s|
  s.name        = "mfp_studio_game"
  s.version     = "1.0.0"
  s.author      = "Marcos Parreiras"
  s.email       = "marcosfparreiras@gmail.com"
  s.homepage    = ""
  s.summary     = "game application as a learning ruby program"
  s.description = File.read(File.join(File.dirname(__FILE__), 'README'))
  s.licenses    = ['MIT']
  
  s.files       = Dir["{bin,lib,spec}/**/*"] + %w(LICENSE README)
  s.test_files  = Dir["spec/**/*"]
  s.executables = [ 'studio_game' ]
  
  s.required_ruby_version = '>=1.9'
  s.add_development_dependency 'rspec'
end