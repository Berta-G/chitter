env = ENV['RACK_ENV'] || 'development'

# DataMapper.setup(:default, "postgres://localhost/chitter_#{env}")
DataMapper.setup(:default, DATABASE_URL)

Dir.glob(File.join(File.dirname(__FILE__), 'models', '*.rb'), &method(:require))

DataMapper.auto_upgrade!
DataMapper.finalize