Gem::Specification.new do |spec|
  spec.name          = "lita-turbot-internet-points"
  spec.version       = "0.1.0"
  spec.authors       = ["Tyler Johnston", "Jason L Perry"]
  spec.email         = ["tylerjohnst@gmail.com", "jasper@ambethia.com"]
  spec.description   = "Imaginary Internet Points"
  spec.summary       = "Karma"
  spec.homepage      = "http://www.suncoast.io/"
  spec.license       = "MIT"
  spec.metadata      = { "lita_plugin_type" => "handler" }

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "lita", ">= 4.3"

  spec.add_development_dependency "bundler", "> 1.3"
  spec.add_development_dependency "pry-byebug"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rack-test"
  spec.add_development_dependency "rspec", ">= 3.0.0"
  spec.add_development_dependency "simplecov"
  spec.add_development_dependency "coveralls"
end
