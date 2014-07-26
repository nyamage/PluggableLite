require 'spec_helper'

describe PluggableLite do
  it 'should have a version number' do
    PluggableLite::VERSION.should_not be_nil
  end

  it 'should load plugin and execute code implemented in plugin module' do

  	class SamplePlugin1
  		extend PluggableLite::Plugin

  		def execute
  			raise RuntimeError.new('please override [execute] method')
  		end
  	end

  	class Sample1PluginManager 
  		extend PluggableLite::PluginManager
  		register SamplePlugin1
  	end

  	Sample1PluginManager.load("spec/sample1_plugins")
  	Sample1PluginManager.plugins.length.should eq 1

  	Sample1PluginManager.plugins.each do |plugin_class|
  		plugin = plugin_class.new
  		plugin.execute.should eq("hello world")
  	end
  end

  it 'should load more than one plugin and execute code implemented in each plugin modules' do

  	class SamplePlugin2
  		extend PluggableLite::Plugin

  		def execute2
  			raise RuntimeError.new('please override [execute] method')
  		end
  	end

  	class Sample2PluginManager 
  		extend PluggableLite::PluginManager
  		register SamplePlugin2
  	end

  	Sample2PluginManager.load("spec/sample2_plugins")
  	Sample2PluginManager.plugins.length.should eq 2

  	Sample2PluginManager.plugins.each do |plugin_class|
  		plugin = plugin_class.new
  		plugin.execute2.should eq("hello world")
  	end
  end

   it 'should coexist several kind of plugins and does not imact any to other kind of plugins' do

  	class SamplePlugin1
  		extend PluggableLite::Plugin

  		def execute
  			raise RuntimeError.new('please override [execute] method')
  		end
  	end

  	class Sample1PluginManager 
  		extend PluggableLite::PluginManager
  		register SamplePlugin1
  	end

  	class SamplePlugin2
  		extend PluggableLite::Plugin

  		def execute2
  			raise RuntimeError.new('please override [execute] method')
  		end
  	end

  	class Sample2PluginManager 
  		extend PluggableLite::PluginManager
  		register SamplePlugin2
  	end

  	Sample1PluginManager.load("spec/sample1_plugins")
  	Sample1PluginManager.plugins.length.should eq 1

  	Sample1PluginManager.plugins.each do |plugin_class|
  		plugin = plugin_class.new
  		plugin.execute.should eq("hello world")
  	end

  	Sample2PluginManager.load("spec/sample2_plugins")
  	Sample2PluginManager.plugins.length.should eq 2

  	Sample2PluginManager.plugins.each do |plugin_class|
  		plugin = plugin_class.new
  		plugin.execute2.should eq("hello world")
  	end
  end   
end
