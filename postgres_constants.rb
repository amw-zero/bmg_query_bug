def check_env_var(v)
  puts "Environment variable #{v} must be set and was not found." unless ENV[v]
end

['PGUSER', 'PGHOST', 'PGPORT'].each { |env_var| check_env_var(env_var) }

PGUSER = ENV['PGUSER']
PGHOST = ENV['PGHOST']
PGPORT = ENV['PGPORT']

BUG_DB = 'tags_query_bug'

DB_URL = "postgres://#{PGUSER}@#{PGHOST}:#{PGPORT}/#{BUG_DB}"