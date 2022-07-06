require 'rubygems/comparator/base'

class Gem::Comparator

  ##
  # Gem::Comparator::DependencyComparator can
  # compare dependencies between gem's versions
  # based on the given Gem::Specification objects

  class DependencyComparator < Gem::Comparator::Base

    ##
    # Compare dependencies in given +specs+ and
    # write the changes to the +report+
    #
    # If +options[:param]+ is set, it compares only
    # those dependencies

    def compare(specs, report, options = {})
      info 'Checking dependencies...'

      filter_params(DEPENDENCY_PARAMS, options[:param]).each do |param|
        all_same = true
        type = param.gsub('_dependency', '').to_sym
        specs.each_with_index do |s, index|
          next if index == 0

          prev_deps = specs[index-1].dependencies.select { |d| d.type == type }
          curr_deps = specs[index].dependencies.select { |d| d.type == type }
          added, deleted, updated = resolve_dependencies(prev_deps, curr_deps)

          if (!deleted.empty? || !added.empty? || !updated.empty?)
            all_same = false
          end

          ver = "#{specs[index-1].version}->#{specs[index].version}"

          report[param][ver].section do
            set_header "#{Rainbow(specs[index-1].version).cyan}->#{Rainbow(s.version).cyan}:"

            nest('deleted').section do
              set_header '* Deleted:'
              puts deleted.map { |x| "#{x.name} #{x.requirements_list} (#{x.type})" } unless deleted.empty?
            end

            nest('added').section do
              set_header '* Added:'
              puts added.map { |x| "#{x.name} #{x.requirements_list} (#{x.type})" } unless added.empty?
            end

            nest('updated').section do
              set_header '* Updated:'
              puts updated unless updated.empty?
            end
          end
        end
        if all_same && options[:log_all]
          report[param].set_header "#{same} #{type} dependencies:" if options[:log_all]
          deps = specs[0].dependencies.select{ |d| d.type == type }.map{ |d| "#{d.name}: #{d.requirements_list}" }
          deps = '[]' if deps.empty?
          report[param] << deps
        elsif !all_same
          report[param].set_header "#{different} #{type} dependencies:"
        end
      end

      report
    end

    private

      ##
      # Find dependencies between +prev_deps+ and +curr_deps+
      #
      # Return [added, deleted, updated] deps

      def resolve_dependencies(prev_deps, curr_deps)
        added = curr_deps - prev_deps
        deleted = prev_deps - curr_deps
        split_dependencies(added, deleted)
      end

      ##
      # Find updated dependencies between +added+ and
      # +deleted+ deps and move them out to +updated+.
      #
      # Return [added, deleted, updated] deps

      def split_dependencies(added, deleted)
        updated = []
        added.dup.each do |ad|
          deleted.dup.each do |dd|
            if ad.name == dd.name
              unless ad.requirements_list == dd.requirements_list
                updated << "#{ad.name} " +
                           "from: #{dd.requirements_list} " +
                           "to: #{ad.requirements_list}"
              end
              added.delete ad
              deleted.delete dd
            end
          end
        end
        [added, deleted, updated]
      end

  end
end
