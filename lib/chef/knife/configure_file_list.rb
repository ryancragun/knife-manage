require 'chef/knife'
require 'chef/knife/manage_base'

class Chef
  class Knife
    class ConfigureFileList < Chef::Knife
      include Knife::ManageBase

      banner 'knife configure file list (options)'

      def run
        list_files
      end

      def list_files
        knife_files.each do |file|
          show_knife(file.basename.to_s) unless file.symlink? && file.basename.to_s == 'knife.rb'
        end
      end
    end
  end
end
