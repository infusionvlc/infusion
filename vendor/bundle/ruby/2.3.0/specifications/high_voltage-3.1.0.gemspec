# -*- encoding: utf-8 -*-
# stub: high_voltage 3.1.0 ruby lib

Gem::Specification.new do |s|
  s.name = "high_voltage".freeze
  s.version = "3.1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Matt Jankowski".freeze, "Dan Croak".freeze, "Nick Quaranto".freeze, "Chad Pytel".freeze, "Joe Ferris".freeze, "J. Edward Dewyea".freeze, "Tammer Saleh".freeze, "Mike Burns".freeze, "Tristan Dunn".freeze]
  s.date = "2018-05-04"
  s.description = "Fire in the disco. Fire in the ... taco bell.".freeze
  s.email = ["support@thoughtbot.com".freeze]
  s.homepage = "http://github.com/thoughtbot/high_voltage".freeze
  s.licenses = ["MIT".freeze]
  s.rubygems_version = "2.7.7".freeze
  s.summary = "Simple static page rendering controller".freeze

  s.installed_by_version = "2.7.7" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<activesupport>.freeze, [">= 3.1.0"])
      s.add_development_dependency(%q<appraisal>.freeze, [">= 0"])
      s.add_development_dependency(%q<capybara>.freeze, [">= 0"])
      s.add_development_dependency(%q<pry>.freeze, [">= 0"])
      s.add_development_dependency(%q<rails-controller-testing>.freeze, [">= 0"])
      s.add_development_dependency(%q<rspec-rails>.freeze, ["~> 3.5"])
    else
      s.add_dependency(%q<activesupport>.freeze, [">= 3.1.0"])
      s.add_dependency(%q<appraisal>.freeze, [">= 0"])
      s.add_dependency(%q<capybara>.freeze, [">= 0"])
      s.add_dependency(%q<pry>.freeze, [">= 0"])
      s.add_dependency(%q<rails-controller-testing>.freeze, [">= 0"])
      s.add_dependency(%q<rspec-rails>.freeze, ["~> 3.5"])
    end
  else
    s.add_dependency(%q<activesupport>.freeze, [">= 3.1.0"])
    s.add_dependency(%q<appraisal>.freeze, [">= 0"])
    s.add_dependency(%q<capybara>.freeze, [">= 0"])
    s.add_dependency(%q<pry>.freeze, [">= 0"])
    s.add_dependency(%q<rails-controller-testing>.freeze, [">= 0"])
    s.add_dependency(%q<rspec-rails>.freeze, ["~> 3.5"])
  end
end
