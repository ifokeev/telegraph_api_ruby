require_relative 'lib/telegraph_api_ruby'

Gem::Specification.new do |s|
  s.name        = 'telegraph_api_ruby'
  s.version     = TelegraphApi::VERSION
  s.date        = Date.today.to_s
  s.summary     = 'Fully working http client for https://telegra.ph/api supporting DomToNode processing'
  s.authors     = ['Ivan Fokeev']
  s.email       = 'vanya@vanya.cc'
  s.files       = Dir['Rakefile', '{bin,lib,man,test,spec}/**/*', 'README*']
  s.homepage    = 'http://github.com/ifokeev/telegraph_api_ruby'
  s.license     = 'MIT'

  s.add_development_dependency('minitest', '~> 5.1', '>= 5.11.3')
  s.add_development_dependency('minitest-reporters', '~> 1.3', '>= 1.3.4')
  s.add_development_dependency('rake', '~> 12.3', '>= 12.3.1')

  s.add_dependency('activesupport', '~> 5.0', '>= 5.0.0')
  s.add_dependency('dry-struct', '~> 0.5')
  s.add_dependency('dry-types', '~> 0.12')
  s.add_dependency('oga', '~> 2.15', '>= 2.15')
  s.add_dependency('typhoeus', '~> 1.3', '>= 1.3.0')
end
