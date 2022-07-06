require 'rubygems/command'
require 'rubygems/version_option'
require 'rubygems/comparator'

class Gem::Commands::CompareCommand < Gem::Command
  include Gem::VersionOption

  def initialize
    super 'compare', 'Compare gem\'s versions and generate a report of changes',
      :output => Dir.pwd

    add_option('-a', '--all', 'Show every comparison') do
      options[:log_all] = true
    end

    add_option('-k', '--keep-all', 'Keep downloaded and extracted gem files') do
      options[:keep_all] = true
    end

    add_option('-n', '--no-color', 'Do not colorize output') do
      options[:no_color] = true
    end

    # Speficy the platform using --platform=PLATFORM
    add_platform_option

    add_option('-pPARAM', '--param PARAM', 'Compare only a given paramater') do |param, options|
      options[:param] = param
    end

    add_option('-r', '--runtime', 'Compare only runtime dependencies') do
      options[:param] = 'runtime_dependency'
    end

    add_option('-d', '--development', 'Compare only development dependencies') do
      options[:param] = 'development_dependency'
    end

    add_option('-f', '--files', 'Compare only files for runtime') do
      options[:param] = 'files'
    end

    add_option('-F', '--diff', 'Diff file contents') do
      options[:diff] = true
      options[:param] = 'files'
    end

    add_option('-g', '--gemfiles', 'Compare only Gemfiles') do
      options[:param] = 'gemfiles'
    end

    add_option('-b', '--brief', 'Include only important changes in the report') do
      options[:log_all] = false
      options[:brief] = true
    end

    add_option('-sSOURCES', '--sources SOURCES', 'Use different source URIs for gems (separated by comma)') do |sources, options|
      options[:sources] = sources.split ','
    end

  end

  def arguments # :nodoc:
    args = <<-EOF
          GEMNAME               gem name
          VERSION [VERSION ...] list of versions to compare
    EOF
    return args.gsub(/^\s+/, '')
  end

  def description # :nodoc:
    desc = <<-EOF
           gem-compare is a RubyGems plugin that compares versions of the given gem.
           It searches for differences in metadata as well as in files.
    EOF
    return desc.gsub(/^\s+/, '')
  end

  def usage # :nodoc:
    "#{program_name} GEMNAME VERSION [VERSION ...]"
  end

  def execute
    gem_name = options[:args].shift
    versions = options[:args]

    # No gem specified
    unless gem_name
      raise Gem::CommandLineError,
        "Please specify a gem (e.g. gem compare foo VERSION [VERSION ...])"
    end

    # No versions specified
    if versions.empty?
      raise Gem::CommandLineError,
        "Please specify versions you want to compare (e.g. gem compare foo 0.1.0 0.2.0)"
    end

    comparator = Gem::Comparator.new(options)
    comparator.compare_versions(gem_name, versions)
    comparator.print_results
  end
end
