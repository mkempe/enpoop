# encoding: utf-8

module Enpoop #:nodoc:
  module UI #:nodoc:
    class Shell
      def initialize(shell)
        @shell = shell
        @quiet = false
        @debug = ENV['DEBUG']
      end

      def say(message, color, newline = nil)
        tell_me(message, color, newline) if !@quiet
      end

      def info(message, newline = nil)
        tell_me(message, nil, newline) if !@quiet
      end

      def confirm(message, newline = nil)
        tell_me(message, :green, newline) if !@quiet
      end

      def warn(message, newline = nil)
        tell_me(message, :yellow, newline)
      end

      def error(message, newline = nil)
        tell_me(message, :red, newline)
      end

      def debug(message, newline = nil)
        tell_me(message, nil, newline) if debug?
      end

      def quiet?
        @quiet
      end

      def be_quiet!
        @quiet = true
      end

      def debug?
        !!@debug && !@quiet # Needs to be false instead of nil to be newline parameter to other methods
      end

      def debug!
        @debug = true
      end

      def print_table(array, options = {})
        @shell.print_table(array, options)
      end

      private

      def tell_me(message, color = nil, newline = nil)
        newline.nil? ? @shell.say(message, color) : @shell.say(message, color, newline)
      end
    end
  end
end