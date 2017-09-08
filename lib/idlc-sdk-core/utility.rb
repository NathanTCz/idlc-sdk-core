module Idlc
  module Utility
    include Helpers

    class MissingCredentials < StandardError; end
    class MissingVersionFile < StandardError; end

    class << self
      def check_for_creds
        creds_fmt = {
          'AWS_ACCESS_ID' => 'AWS_ACCESS_KEY_ID',
          'AWS_SECRET_KEY' => 'AWS_SECRET_ACCESS_KEY'
        }
        creds_fmt.each do |old_fmt, new_fmt|
          if ENV.include? new_fmt
            next
          elsif ENV.include?(old_fmt) && !ENV.include?(new_fmt)
            ENV[new_fmt] = ENV[old_fmt]
          elsif !ENV.include?(old_fmt) || !ENV.include?(new_fmt)
            raise MissingCredentials, "#{new_fmt} is not set."
          end
        end
      end

      def set_global_version(filename)
        filename = ENV['VERSION_FILE'] if ENV.include? 'VERSION_FILE'
        Idlc::Helpers.debug('WARNING: Not using a global version file') unless File.exist? filename
        YAML.load_file(filename)['version'] if File.exist? filename
      end

      def major_minor_patch(version)
        # Strip build number from version number. The migration scripts only include
        # major.minor.patch
        version.split('.')[0..2].join('.')
      end

      def major_minor(version)
        # Strip build number from version number. The migration scripts only include
        # major.minor.patch
        version.split('.')[0..1].join('.')
      end
    end
  end
end
