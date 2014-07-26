
require "pluggable_lite/version"

module PluggableLite
  module PluginManager
    def self.extended(kclass)
      kclass.class_eval <<-EOS
        def self.plugins
          @@_plugins ||= []
        end
      EOS
    end

    def load(path)
      Dir.glob(File.join(path, "*.rb")).each do |plugin|
        require File.join ".", "#{plugin}"
      end
    end

    def register(kclass)
      kclass.class_eval <<-EOS
        def self.plugin_manager
          #{self}
        end
      EOS
    end
  end

  module Plugin
    def self.extended(kclass)
      kclass.class_eval <<-EOS
        def self.inherited(concrete_plugin_class)
          plugin_manager.plugins << concrete_plugin_class
        end
      EOS
    end
  end
end
