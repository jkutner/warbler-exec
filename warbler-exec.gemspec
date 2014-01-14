# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)

Gem::Specification.new do |s|
  s.name        = "warbler-exec"
  s.version     = "0.1.2"
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Joe Kutner"]
  s.email       = ["jpkutner@gmail.com"]
  s.homepage    = "https://github.com/jkutner/warbler-exec"
  s.summary     = %q{Allows execution of commands from a Warbler WAR file}
  s.description = %q{This utility allows you to execute commands with the context of a Warbler WAR file}

  s.rubyforge_project = "warbler-exec"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_runtime_dependency(%q<rubyzip>, [">= 1.0.0"])
end
