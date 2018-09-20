# -*- encoding: utf-8 -*-
# stub: cocoon 1.2.11 ruby lib

Gem::Specification.new do |s|
  s.name = "cocoon".freeze
  s.version = "1.2.11"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Nathan Van der Auwera".freeze]
  s.date = "2017-10-26"
  s.description = "Unobtrusive nested forms handling, using jQuery. Use this and discover cocoon-heaven.".freeze
  s.email = "nathan@dixis.com".freeze
  s.extra_rdoc_files = ["README.markdown".freeze]
  s.files = ["README.markdown".freeze]
  s.homepage = "http://github.com/nathanvda/cocoon".freeze
  s.licenses = ["MIT".freeze]
  s.rubygems_version = "2.7.7".freeze
  s.summary = "gem that enables easier nested forms with standard forms, formtastic and simple-form".freeze

  s.installed_by_version = "2.7.7" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<rails>.freeze, [">= 4.0.0"])
      s.add_development_dependency(%q<sqlite3>.freeze, ["= 1.3.13"])
      s.add_development_dependency(%q<json_pure>.freeze, [">= 0"])
      s.add_development_dependency(%q<jeweler>.freeze, ["~> 2.3"])
      s.add_development_dependency(%q<rspec-rails>.freeze, ["~> 3.0.0"])
      s.add_development_dependency(%q<rspec>.freeze, ["~> 3.0.0"])
      s.add_development_dependency(%q<actionpack>.freeze, [">= 4.0.0"])
      s.add_development_dependency(%q<simplecov>.freeze, [">= 0"])
      s.add_development_dependency(%q<rake>.freeze, ["~> 10.1"])
      s.add_development_dependency(%q<nokogiri>.freeze, [">= 0"])
      s.add_development_dependency(%q<generator_spec>.freeze, [">= 0"])
      s.add_development_dependency(%q<rubysl>.freeze, [">= 0"])
      s.add_development_dependency(%q<rubysl-test-unit>.freeze, [">= 0"])
      s.add_development_dependency(%q<psych>.freeze, ["~> 2.2"])
      s.add_development_dependency(%q<racc>.freeze, [">= 0"])
      s.add_development_dependency(%q<rubinius-developer_tools>.freeze, [">= 0"])
    else
      s.add_dependency(%q<rails>.freeze, [">= 4.0.0"])
      s.add_dependency(%q<sqlite3>.freeze, ["= 1.3.13"])
      s.add_dependency(%q<json_pure>.freeze, [">= 0"])
      s.add_dependency(%q<jeweler>.freeze, ["~> 2.3"])
      s.add_dependency(%q<rspec-rails>.freeze, ["~> 3.0.0"])
      s.add_dependency(%q<rspec>.freeze, ["~> 3.0.0"])
      s.add_dependency(%q<actionpack>.freeze, [">= 4.0.0"])
      s.add_dependency(%q<simplecov>.freeze, [">= 0"])
      s.add_dependency(%q<rake>.freeze, ["~> 10.1"])
      s.add_dependency(%q<nokogiri>.freeze, [">= 0"])
      s.add_dependency(%q<generator_spec>.freeze, [">= 0"])
      s.add_dependency(%q<rubysl>.freeze, [">= 0"])
      s.add_dependency(%q<rubysl-test-unit>.freeze, [">= 0"])
      s.add_dependency(%q<psych>.freeze, ["~> 2.2"])
      s.add_dependency(%q<racc>.freeze, [">= 0"])
      s.add_dependency(%q<rubinius-developer_tools>.freeze, [">= 0"])
    end
  else
    s.add_dependency(%q<rails>.freeze, [">= 4.0.0"])
    s.add_dependency(%q<sqlite3>.freeze, ["= 1.3.13"])
    s.add_dependency(%q<json_pure>.freeze, [">= 0"])
    s.add_dependency(%q<jeweler>.freeze, ["~> 2.3"])
    s.add_dependency(%q<rspec-rails>.freeze, ["~> 3.0.0"])
    s.add_dependency(%q<rspec>.freeze, ["~> 3.0.0"])
    s.add_dependency(%q<actionpack>.freeze, [">= 4.0.0"])
    s.add_dependency(%q<simplecov>.freeze, [">= 0"])
    s.add_dependency(%q<rake>.freeze, ["~> 10.1"])
    s.add_dependency(%q<nokogiri>.freeze, [">= 0"])
    s.add_dependency(%q<generator_spec>.freeze, [">= 0"])
    s.add_dependency(%q<rubysl>.freeze, [">= 0"])
    s.add_dependency(%q<rubysl-test-unit>.freeze, [">= 0"])
    s.add_dependency(%q<psych>.freeze, ["~> 2.2"])
    s.add_dependency(%q<racc>.freeze, [">= 0"])
    s.add_dependency(%q<rubinius-developer_tools>.freeze, [">= 0"])
  end
end
