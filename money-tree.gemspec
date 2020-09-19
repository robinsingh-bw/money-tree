# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'money-tree/version'

Gem::Specification.new do |spec|
  spec.name          = "money-tree"
  spec.version       = MoneyTree::VERSION
  spec.authors       = ["Micah Winkelspecht"]
  spec.email         = ["winkelspecht@gmail.com"]
  spec.description   = %q{A Ruby Gem implementation of Bitcoin HD Wallets}
  spec.summary       = %q{Bitcoin Hierarchical Deterministic Wallets in Ruby! (Bitcoin standard BIP0032)}
  spec.homepage      = "https://github.com/gemhq/money-tree"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]
  
  # used with gem install ... -P HighSecurity
  spec.cert_chain  = ["certs/mattatgemco.pem"]
  # Sign gem when evaluating spec with `gem` command
  #  unless ENV has set a SKIP_GEM_SIGNING
  if ($0 =~ /gem\z/) and not ENV.include?("SKIP_GEM_SIGNING")
    spec.signing_key = File.join(Gem.user_home, ".ssh", "gem-private_key.pem")
  end
 
  spec.add_dependency "ffi"
  spec.add_dependency "blake"

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "simplecov"
  spec.add_development_dependency "coveralls"
  spec.add_development_dependency "pry"
end
