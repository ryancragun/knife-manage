require 'chef/knife'
require 'chef/knife/manage_base'

class Chef
  class Knife
    class ConfigureFileShow < Chef::Knife
      include Knife::ManageBase

      banner 'knife configure file show (options)'

      def run
        show_default
      end

      def show_default
        show_knife(default_file.realpath.basename.to_s)
      end
    end
  end
end
