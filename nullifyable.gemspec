
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "nullifyable/version"

Gem::Specification.new do |spec|
  spec.name          = "nullifyable"
  spec.version       = Nullifyable::VERSION
  spec.authors       = ["Lastimoso"]
  spec.email         = ["gerardoraiden@gmail.com"]

  spec.summary       = %q{Tiny simple gem to nullify blank attributes before saving with ActiveRecord.}
  spec.description   = %q{Tiny simple gem to nullify blank attributes before saving with ActiveRecord.}
  spec.homepage      = "https://github.com/Lastimoso/nullifyable"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "activerecord", ">= 4.0"

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 13.0"
  spec.add_development_dependency "minitest", "~> 5.0"
  spec.add_development_dependency 'minitest-reporters', '~> 1.3'
  spec.add_development_dependency 'sqlite3', '~> 1.3'
end
