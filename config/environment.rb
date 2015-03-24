# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
Rails.application.initialize!

FlickRaw.api_key=ENV['FLICKR_KEY']
FlickRaw.shared_secret=ENV['FLICKR_SECRET']
