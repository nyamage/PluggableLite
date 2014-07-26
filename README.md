# PluggableLite

PluggableLite help you to create pluggable architecture in your ruby application.
In only 3 steps, you can make your ruby app pluggable.

- Include Pluggable::Plugin to your plugin base class
- Include Pluggable::PluginManager to your class which holds loaded plugins
- Register your plugin base class to your plugin manager

That's it!.

## Installation

Add this line to your application's Gemfile:

    gem 'pluggable_lite'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install pluggable_lite

# Usage

Create your own plugin base class and extend it with PluggableLite::Plugin.
In addition, you can define default implementation in your plugin base class(not mandatory).

```ruby
#feature1_plugin.rb
require './Plugin.rb'
class Feature1Plugin
	extend PluggableLite::Plugin

	def execute
		raise RuntimeError.new('please override [execute] method')
	end
end
```

Create you own plugin manager class and extend it with PluggableLite::PluginManager.
You need to use "register" class method to indicate which plugin base class it holds.

```ruby
#feature1_plugin.rb
class Feature1PluginManager 
	extend PluggableLite::PluginManager
	register Feature1Plugin
end
```

Create your plugin class and inherit your plugin base class and implement methods.

```ruby
#feature1_plugins/helloworld
class HelloWorldPlugin < Feature1Plugin
  def execute
    puts "Hello world!!!"
  end
end
```

Specify directory you want to load plugins by using "load" method.
After calling load methods, you can get plugin class objects through plugins method in your plugin manager.

```ruby
#app.rb

require './feature1_plugin'
#Specify directory where plugins locates
Feature1PluginManager.load("feature1_plugins")

#Now Feature1PluginManager.plugins hold class objects
Feature1PluginManager.plugins.each do |plugin_class|
  plugin = plugin_class.new
  plugin.execute
end
```

## Contributing

1. Fork it ( http://github.com/<my-github-username>/pluggable_lite/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
