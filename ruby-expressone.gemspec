require_relative 'lib/ruby-expressone/version'

Gem::Specification.new do |spec|
  spec.name          = 'ruby-expressone'
  spec.version       = RubyExpressOne::VERSION
  spec.authors       = ['Adem Dinarevic']
  spec.email         = ['ademdinarevic@gmail.com']
  spec.homepage      = 'https://github.com/ademdc/ruby-expressone'
  spec.license       = 'MIT'
  spec.summary       = "Ruby client for ExpressOne API"
  spec.description   = "Ruby client for ExpressOne API"
  spec.require_paths = ['lib']
  spec.files         = Dir.glob("{lib}/**/*", File::FNM_DOTMATCH).reject {|f| File.directory?(f) }

  spec.required_ruby_version = '>= 2.3'

  spec.add_runtime_dependency 'rest-client', '~> 2.1.0'

  spec.add_development_dependency 'rspec', '~> 3.0'
end