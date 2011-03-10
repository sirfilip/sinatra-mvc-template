require './bootloader'
 
namespace :db do
  task :seed do
    require 'faker'
    require 'dm-core'
    
    DataMapper.setup(:default, "sqlite3://#{Dir.pwd}/development.db")
        
    10000.times do 
      Post.create({:name => Faker::Lorem.sentence, :content => Faker::Lorem.paragraphs.join})
    end
  end
end
