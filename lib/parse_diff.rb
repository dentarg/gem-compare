# frozen_string_literal: true

class ParseDiff
  def self.parse(input)
    versions    = Hash.new { |hash, key| hash[key] = [] }
    versions_re = %r{\A(-|\+)    (?<gem>((\w|-))+) \((?<version>(\.|\d)+)(-(?<platform>.*))*\)\z}

    input.each_line do |line|
      $stderr.puts "line=#{line.inspect}" if ENV.key?("DEBUG")

      if m = line.chomp.match(versions_re)
        gem_name = m.match(:gem)
        version  = m.match(:version)

        versions[gem_name] << version
      end
    end

    versions.select do |_gem_name, versions|
      versions.uniq!

      versions.size == 2
    end
  end
end
