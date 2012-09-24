# encoding: utf-8

require 'thor'
require 'thor/actions'

require 'enpoop/ui/shell'

module Enpoop #:nodoc:
  class CLI < Thor
    include Thor::Actions

    class_option 'no-colors', :type => :boolean, :default => false, :aliases => '-p'
    class_option 'verbose', :type => :boolean, :default => false, :aliases => '-v'

    default_task :banner

    def initialize(*)
      super

      # the_shell = options['no-colors'] ? Thor::Shell::Basic.new : shell
      # @shell = UI::Shell.new(the_shell)
      # @shell.debug! if options['verbose']
    end

    desc 'banner', 'Show banner and quit'
    def banner
      banner = <<-D
~~~~~~
ENPOOP
~~~~~~
      D

      @shell.say(banner)
    end

    desc 'help [TASK]', 'Describe available tasks or one specific task'
    def help(task = nil, subcommand = false)
      super
    end
  end
end