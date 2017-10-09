# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "google_api_utils/version"

Gem::Specification.new do |spec|
  spec.name          = "google_api_utils"
  spec.version       = GoogleApiUtils::VERSION
  spec.authors       = ["fukumame"]

  spec.summary       = "An utility module to use google api client."
  spec.description   = "An utility module to use google api client."
  spec.homepage      = "https://github.com/fukumame/google_api_utils"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata["allowed_push_host"] = "Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency 'google-api-client'

  spec.add_development_dependency "bundler", "~> 1.15"
  spec.add_development_dependency "rake"
end
