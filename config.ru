require './bootloader'

DataMapper.setup(:default, "sqlite3://#{Dir.pwd}/development.db")

map "/public" do
  run Rack::Directory.new("./public")
end

# map sinatr apps here
# map '/posts' do
#   run PostsApp.new
# end
