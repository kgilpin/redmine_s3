# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run the gemspec command
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{redmine_s3}
  s.version = "0.0.3"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Christopher Dell"]
  s.date = %q{2010-01-04}
  s.description = %q{Plugin to have Redmine store uploads on S3}
  s.email = %q{edavis@littlestreamsoftware.com}
  s.extra_rdoc_files = [
    "README.rdoc"
  ]
  s.files = [
    "README.rdoc",
     "Rakefile",
     "VERSION",
     "config/locales/en.yml",
     "config/s3.yml.example",
     "init.rb",
     "lang/en.yml",
     "lib/S3.rb",
     "lib/redmine_s3/attachment_patch.rb",
     "lib/redmine_s3/attachments_controller_patch.rb",
     "lib/redmine_s3/connection.rb",
     "lib/s3_helper.rb",
     "test/test_helper.rb"
  ]
  s.homepage = %q{http://projects.tigrish.com/projects/redmine-s3}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{TODO}
  s.rubygems_version = %q{1.3.5}
  s.summary = %q{Plugin to have Redmine store uploads on S3}
  s.test_files = [
    "test/test_helper.rb"
  ]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end

