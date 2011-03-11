class SinatraApp < Sinatra::Base
  # use Rack::Auth::Basic do |username, password|
  #   username == 'filip' && password == 'pass'
  # end
  use Rack::Reloader
  
  enable :sessions, :logging
  set :environment, :development
  set :method_override, true
  
end