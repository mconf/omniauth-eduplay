require File.expand_path('../lib/omniauth-eduplay/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = "Lucas Fialho Zawacki"
  gem.email         = "lfzawacki@gmail.com"
  gem.description   = %q{OmniAuth strategy for Eduplay Authentication}
  gem.summary       = %q{OmniAuth strategy for Eduplay Authentication}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split("\n")
  gem.name          = "omniauth-eduplay"
  gem.require_paths = ["lib"]
  gem.version       = OmniAuth::Eduplay::VERSION

  gem.add_dependency 'omniauth', '~> 1.0'
  gem.add_dependency 'omniauth-oauth2', '~> 1.0'
end
