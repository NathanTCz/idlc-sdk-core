require 'spec_helper'

module Idlc
  describe Workspace do

    it 'creates parent directory of source' do
      wp = Workspace.new
      wp.add('spec/test')
      expect(File.directory?("#{wp.tmp_dir}/spec/test")).to be true
      expect(File.directory?("#{wp.tmp_dir}/spec/test/nested")).to be true
    end

    it 'flattens directories' do
      wp = Workspace.new
      wp.flatten('spec', 'tf')
      expect(File.exist?("#{wp.tmp_dir}/spec-test-nested-placeholder.tf")).to be true
      wp.cleanup
    end

    it 'zips directories' do
      wp = Workspace.new
      Workspace.zip_folder('spec', "#{wp.tmp_dir}/spec.zip")
      expect(File.exist?("#{wp.tmp_dir}/spec.zip")).to be true
    end

  end
end
