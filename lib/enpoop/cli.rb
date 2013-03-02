# encoding: utf-8

require 'thor'
require 'thor/actions'

require 'enpoop/ui/shell'

module Enpoop #:nodoc:
  class CLI < Thor
    include Thor::Actions

    class_option 'no-colors' => false, aliases: '-p'
    class_option 'verbose' => false, aliases: '-v'

    default_task :smell

    def initialize(*)
      super

      the_shell = options['no-colors'] ? Thor::Shell::Basic.new : shell
      @shell = UI::Shell.new(the_shell)
      @shell.debug! if options['verbose']
    end

    desc 'smell [FILE]', 'Check file for invalid characters'
    method_options :destination_encoding => 'ISO-8859-15'
    method_options :source_encoding => 'UTF-8'
    def smell(file)
      begin
        file = File.expand_path(file)

        if File.exist?(file)
          current_line = nil
          line_number = 0

          File.open(file) do |f|
            f.each_line do |line|
              current_line = line
              line_number += 1
              line.encode(options[:destination_encoding], options[:source_encoding])
            end
          end
          @shell.say("“#{file}” smells good.", :green)
        else
          @shell.error("“#{file}” not found.")
        end
      rescue Encoding::UndefinedConversionError => e
        error_char = e.error_char
        position = current_line.index(error_char)

        if position
          surroundings = current_line[position - 10..position + 10]
        end

        if surroundings
          @shell.error("“#{file}” smells not good on line “#{line_number}”: “#{error_char}” (#{surroundings}) looks funny.")
        else
          @shell.error("“#{file}” smells not good on line “#{line_number}”: “#{error_char}” looks funny.")
        end
      end
    end

    desc 'replace [FILE] [POOP] [NON-POOP]', 'Replace “poop” with “non-poop”'
    def replace(file, poop, non_poop)
      begin
        file = File.expand_path(file)

        if File.exist?(file)
          text = File.read(file)
          text.gsub!(poop, non_poop)

          File.open(file, 'w') do |f|
            f.write(text)
          end
        else
          @shell.error("“#{file}” not found.")
        end
      rescue => e
        @shell.error("Uppppsss, something went wrong: “#{e.message}”.")
      end
    end

    desc 'help [TASK]', 'Describe available tasks or one specific task'
    def help(task = nil, subcommand = false)
      super
    end
  end
end