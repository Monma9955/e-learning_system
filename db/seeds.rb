if User.count == 0
  require './db/seeds/user.rb'
  require './db/seeds/category.rb'
end