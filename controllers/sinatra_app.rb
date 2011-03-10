class SinatraApp < Sinatra::Base
  # use Rack::Auth::Basic do |username, password|
  #   username == 'filip' && password == 'pass'
  # end
  
  enable :sessions, :logging
  set :environment, :development
  set :method_override, true
  
end