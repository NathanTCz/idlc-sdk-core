module Idlc
  module Helpers
    module_function

    #
    # Runs given commands using mixlib-shellout
    #
    def system_command(*command_args)
      cmd = Mixlib::ShellOut.new(*command_args)
      cmd.run_command
      cmd
    end

    def err(message)
      stderr.print("#{message}\n")
    end

    def msg(message)
      stdout.print("#{message}\n")
      stdout.flush
    end

    def debug(message)
      stdout.print("#{message}\n") if ENV['DEBUG']
      stdout.flush
    end

    def stdout
      $stdout
    end

    def stderr
      $stderr
    end
  end
end
