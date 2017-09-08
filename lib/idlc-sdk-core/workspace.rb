module Idlc
  class Workspace
    include Helpers

    class << self
      def zip_folder(src, out)
        zf = ZipFileGenerator.new(src, out)
        zf.write
      end
    end

    attr_accessor :tmp_dir

    def initialize
      @tmp_dir = Dir.mktmpdir('ws-temp')
    end

    def empty?
      !Dir.exist? @tmp_dir
    end

    def cleanup
      debug("keeping directory: #{@tmp_dir} for dubugging")
      return if ENV['DEBUG']

      FileUtils.rm_rf(@tmp_dir)
    end

    def flatten(base_path, file_ext)
      Dir["#{base_path}/**/*.#{file_ext}"].each do |file|
        # get the filename and parent dir
        filename = file.tr('/', '-')

        # copy the files to a single temp directory.
        debug("copying #{file} to #{@tmp_dir}/#{filename} ...")
        FileUtils.cp(file, "#{@tmp_dir}/#{filename}")
      end
    end

    def add(path)
      parent_dir = path.split('/')[0..-2].join('/')
      FileUtils.mkdir_p("#{@tmp_dir}/#{parent_dir}")
      FileUtils.cp_r(path, "#{@tmp_dir}/#{path}")
    end
  end
end
