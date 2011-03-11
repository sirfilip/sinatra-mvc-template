require 'rubygems'
require 'bundler/setup'

SINATRA_ROOT = File.dirname(__FILE__)

Bundler.require(:default)

class String
  def underscore_to_camelcase
    words = split('_').map!{|w| w.capitalize}
    words.join
  end
end

# initialize autoloaders
autoload_folders = %w[lib controllers models]

autoload_folders.each do |folder|
  files = Dir.entries(File.join(SINATRA_ROOT, folder)).reject! {|file| file.start_with?('.') }
  files.each do |f|
    basename = File.basename(File.join(SINATRA_ROOT, folder, f), '.rb')
    Object.autoload basename.underscore_to_camelcase.to_sym, File.join(SINATRA_ROOT, folder, f)
  end
end

# autolad the helpers
files = Dir.entries(File.join(SINATRA_ROOT, 'helpers')).reject! {|file| file.start_with?('.') }
files.each do |f|
  basename = File.basename(File.join(SINATRA_ROOT, 'helpers', f), '.rb')
  Sinatra.autoload basename.underscore_to_camelcase.to_sym, File.join(SINATRA_ROOT, 'helpers', f)
end

# load the initializers
initializers = Dir.entries(File.join(SINATRA_ROOT, 'initializers')).reject {|file| file.start_with?('.')}
initializers.each do |f|
	basename = File.basename(File.join(SINATRA_ROOT, 'initializers', f), '.rb')
	require File.join(SINATRA_ROOT, 'initializers', basename)
end