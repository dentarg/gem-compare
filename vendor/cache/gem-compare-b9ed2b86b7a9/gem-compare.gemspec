# -*- encoding: utf-8 -*-
# stub: gem-compare 1.1.0 ruby lib

Gem::Specification.new do |s|
  s.name = "gem-compare".freeze
  s.version = "1.1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 3.0.0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Josef Stribny".freeze]
  s.date = "2022-07-06"
  s.description = "                    gem-compare is a RubyGems plugin that helps to compare versions of the given gem.\n                    It searches for differences in metadata as well as in files.\n".freeze
  s.email = "strzibny@strzibny.name".freeze
  s.files = ["LICENSE".freeze, "README.md".freeze, "Rakefile".freeze, "lib/rubygems/commands/compare_command.rb".freeze, "lib/rubygems/comparator.rb".freeze, "lib/rubygems/comparator/base.rb".freeze, "lib/rubygems/comparator/dependency_comparator.rb".freeze, "lib/rubygems/comparator/dir_utils.rb".freeze, "lib/rubygems/comparator/file_list_comparator.rb".freeze, "lib/rubygems/comparator/gemfile_comparator.rb".freeze, "lib/rubygems/comparator/monitor.rb".freeze, "lib/rubygems/comparator/report.rb".freeze, "lib/rubygems/comparator/report/entry.rb".freeze, "lib/rubygems/comparator/spec_comparator.rb".freeze, "lib/rubygems/comparator/utils.rb".freeze, "lib/rubygems/comparator/version.rb".freeze, "lib/rubygems_plugin.rb".freeze, "test/gemfiles/lorem-0.0.1".freeze, "test/gemfiles/lorem-0.0.1.gem".freeze, "test/gemfiles/lorem-0.0.1/Gemfile".freeze, "test/gemfiles/lorem-0.0.1/LICENSE.txt".freeze, "test/gemfiles/lorem-0.0.1/README.md".freeze, "test/gemfiles/lorem-0.0.1/Rakefile".freeze, "test/gemfiles/lorem-0.0.1/lib".freeze, "test/gemfiles/lorem-0.0.1/lib/lorem".freeze, "test/gemfiles/lorem-0.0.1/lib/lorem.rb".freeze, "test/gemfiles/lorem-0.0.1/lib/lorem/version.rb".freeze, "test/gemfiles/lorem-0.0.1/lorem.gemspec".freeze, "test/gemfiles/lorem-0.0.2".freeze, "test/gemfiles/lorem-0.0.2.gem".freeze, "test/gemfiles/lorem-0.0.2/CHANGELOG.md".freeze, "test/gemfiles/lorem-0.0.2/Gemfile".freeze, "test/gemfiles/lorem-0.0.2/LICENSE.txt".freeze, "test/gemfiles/lorem-0.0.2/README.md".freeze, "test/gemfiles/lorem-0.0.2/Rakefile".freeze, "test/gemfiles/lorem-0.0.2/lib".freeze, "test/gemfiles/lorem-0.0.2/lib/lorem".freeze, "test/gemfiles/lorem-0.0.2/lib/lorem.rb".freeze, "test/gemfiles/lorem-0.0.2/lib/lorem/version.rb".freeze, "test/gemfiles/lorem-0.0.2/lorem.gemspec".freeze, "test/gemfiles/lorem-0.0.3".freeze, "test/gemfiles/lorem-0.0.3.gem".freeze, "test/gemfiles/lorem-0.0.3/CHANGELOG.md".freeze, "test/gemfiles/lorem-0.0.3/Gemfile".freeze, "test/gemfiles/lorem-0.0.3/LICENSE.txt".freeze, "test/gemfiles/lorem-0.0.3/README.md".freeze, "test/gemfiles/lorem-0.0.3/Rakefile".freeze, "test/gemfiles/lorem-0.0.3/bin".freeze, "test/gemfiles/lorem-0.0.3/bin/lorem".freeze, "test/gemfiles/lorem-0.0.3/lib".freeze, "test/gemfiles/lorem-0.0.3/lib/lorem".freeze, "test/gemfiles/lorem-0.0.3/lib/lorem.rb".freeze, "test/gemfiles/lorem-0.0.3/lib/lorem/utils.rb".freeze, "test/gemfiles/lorem-0.0.3/lib/lorem/version.rb".freeze, "test/gemfiles/lorem-0.0.3/lorem.gemspec".freeze, "test/gemfiles/lorem-0.0.4".freeze, "test/gemfiles/lorem-0.0.4.gem".freeze, "test/gemfiles/lorem-0.0.4/CHANGELOG.md".freeze, "test/gemfiles/lorem-0.0.4/Gemfile".freeze, "test/gemfiles/lorem-0.0.4/LICENSE.txt".freeze, "test/gemfiles/lorem-0.0.4/README.md".freeze, "test/gemfiles/lorem-0.0.4/Rakefile".freeze, "test/gemfiles/lorem-0.0.4/bin".freeze, "test/gemfiles/lorem-0.0.4/bin/lorem".freeze, "test/gemfiles/lorem-0.0.4/lib".freeze, "test/gemfiles/lorem-0.0.4/lib/lorem".freeze, "test/gemfiles/lorem-0.0.4/lib/lorem.rb".freeze, "test/gemfiles/lorem-0.0.4/lib/lorem/utils.rb".freeze, "test/gemfiles/lorem-0.0.4/lib/lorem/version.rb".freeze, "test/gemfiles/lorem-0.0.4/lorem.gemspec".freeze, "test/rubygems/comparator/test_dependency_comparator.rb".freeze, "test/rubygems/comparator/test_dir_utils.rb".freeze, "test/rubygems/comparator/test_file_list_comparator.rb".freeze, "test/rubygems/comparator/test_gemfile_comparator.rb".freeze, "test/rubygems/comparator/test_monitor.rb".freeze, "test/rubygems/comparator/test_report.rb".freeze, "test/rubygems/comparator/test_spec_comparator.rb".freeze, "test/rubygems/comparator/test_utils.rb".freeze, "test/rubygems/test_gem_commands_compare_command.rb".freeze, "test/test_helper.rb".freeze]
  s.homepage = "http://github.com/fedora-ruby/gem-compare".freeze
  s.licenses = ["MIT".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 3.0.0".freeze)
  s.rubygems_version = "3.3.11".freeze
  s.summary = "RubyGems plugin for comparing gem versions".freeze

  s.installed_by_version = "3.3.11" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4
  end

  if s.respond_to? :add_runtime_dependency then
    s.add_runtime_dependency(%q<json>.freeze, [">= 0"])
    s.add_runtime_dependency(%q<diffy>.freeze, [">= 0"])
    s.add_runtime_dependency(%q<rainbow>.freeze, [">= 0"])
    s.add_runtime_dependency(%q<gemnasium-parser>.freeze, [">= 0"])
  else
    s.add_dependency(%q<json>.freeze, [">= 0"])
    s.add_dependency(%q<diffy>.freeze, [">= 0"])
    s.add_dependency(%q<rainbow>.freeze, [">= 0"])
    s.add_dependency(%q<gemnasium-parser>.freeze, [">= 0"])
  end
end
