# -*- encoding: utf-8 -*-
# stub: tux 0.3.0 ruby lib

Gem::Specification.new do |s|
  s.name = "tux"
  s.version = "0.3.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 1.3.6") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Gabriel Horner"]
  s.date = "2011-04-10"
  s.description = "Tux dresses up sinatra in a shell. Use it to interact with your helpers, view rendering and your app's response objects. Tux also gives you commands to view your app's routes and settings."
  s.email = "gabriel.horner@gmail.com"
  s.executables = ["tux"]
  s.extra_rdoc_files = ["README.rdoc", "LICENSE.txt"]
  s.files = ["LICENSE.txt", "README.rdoc", "bin/tux"]
  s.homepage = "http://github.com/cldwalker/tux"
  s.licenses = ["MIT"]
  s.rubyforge_project = "tagaholic"
  s.rubygems_version = "2.4.3"
  s.summary = "Sinatra dressed for interactive ruby - a sinatra shell"

  s.installed_by_version = "2.4.3" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<ripl>, [">= 0.3.5"])
      s.add_runtime_dependency(%q<ripl-rack>, [">= 0.2.0"])
      s.add_runtime_dependency(%q<ripl-multi_line>, [">= 0.2.4"])
      s.add_runtime_dependency(%q<sinatra>, [">= 1.2.1"])
      s.add_development_dependency(%q<bacon>, [">= 1.1.0"])
      s.add_development_dependency(%q<bacon-bits>, [">= 0.1.0"])
    else
      s.add_dependency(%q<ripl>, [">= 0.3.5"])
      s.add_dependency(%q<ripl-rack>, [">= 0.2.0"])
      s.add_dependency(%q<ripl-multi_line>, [">= 0.2.4"])
      s.add_dependency(%q<sinatra>, [">= 1.2.1"])
      s.add_dependency(%q<bacon>, [">= 1.1.0"])
      s.add_dependency(%q<bacon-bits>, [">= 0.1.0"])
    end
  else
    s.add_dependency(%q<ripl>, [">= 0.3.5"])
    s.add_dependency(%q<ripl-rack>, [">= 0.2.0"])
    s.add_dependency(%q<ripl-multi_line>, [">= 0.2.4"])
    s.add_dependency(%q<sinatra>, [">= 1.2.1"])
    s.add_dependency(%q<bacon>, [">= 1.1.0"])
    s.add_dependency(%q<bacon-bits>, [">= 0.1.0"])
  end
end
