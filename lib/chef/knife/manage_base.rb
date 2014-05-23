require 'chef/knife'

class Chef
  class Knife
    module ManageBase

      def self.included(klass)
        klass.class_eval do

          deps do
            require 'pathname'
          end

          option :file_dir,
            :long => '--file-dir DIRECTORY',
            :description => 'Path to knife.rb configuration files directory (default: ~/.chef)'
        end
      end

      def config_dir
        @dir ||= config[:file_dir] || "#{ENV['HOME']}/.chef"
        if !::File.directory?(@dir)
          ui.error "Could not locate configuration files because #{@dir} doesn't exist.  Use --file-dir to specify where your knife files live"
          exit 1
        end
        @dir
      end

      def knife_files
        @files ||= Pathname.new(config_dir).children.select do |file|
          file.basename.to_s =~ /^(knife)(?:_?|-?)(\w+)?.rb$/
        end
      end

      def default_file
        @default ||= Pathname.new("#{config_dir}/knife.rb")
      end

      def show_knife(basename)
        basename =~ /^(knife)(?:_?|-?)(\w+)?.rb$/
        if $2
          puts "#{$2}\n"
        elsif $1
          puts "default\n"
        end
      end
    end
  end
end
