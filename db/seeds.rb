Dir[File.expand_path('./db/seeds' << '/*.rb')].each do |file|
  require file
end