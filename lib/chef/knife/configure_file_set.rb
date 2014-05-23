require 'chef/knife'
require 'chef/knife/manage_base'

class Chef
  class Knife
    class ConfigureFileSet < Chef::Knife
      include Knife::ManageBase

      banner 'knife configure file set [CONFIG] (options)'

      option :force,
        :long => '--force',
        :boolean => true,
        :default => false,
        :description => 'Force overwrite knife.rb if it is not a symlink (default: false)'

      def run
        set_default
      end

      def verify_args
        if name_args.count < 1
          ui.error 'You must supply a configuration file as an argument'
          exit 1
        end

        if default_file.exist? && !default_file.symlink? && !config[:force]
          ui.error 'The default file is not a symlink.  Use --force to overwrite it.'
          exit 1
        end
      end

      def set_default
        verify_args
        new_config = name_args[0]
        new_file = knife_files.select { |f| f.basename.to_s.include?(new_config) }.first
        if !new_file
          ui.error "Could not find a #{new_config} configuration file."
          exit 1
        end

        if default_file.symlink?
          default_file.unlink
        elsif default_file.exist?
          default_file.rename("#{config_dir}/knife.rb.bak")
        end

        default_file.make_symlink(new_file)
        show_knife(default_file.realpath.basename.to_s)
      end
    end
  end
end
