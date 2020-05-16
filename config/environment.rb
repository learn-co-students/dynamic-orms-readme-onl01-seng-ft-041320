require 'sqlite3'


DB = {:conn => SQLite3::Database.new("db/songs.db")}
DB[:conn].execute("DROP TABLE IF EXISTS songs")

sql = <<-SQL
  CREATE TABLE IF NOT EXISTS songs (
  id INTEGER PRIMARY KEY,
  name TEXT,
  album TEXT
  )
SQL

DB[:conn].execute(sql)
DB[:conn].results_as_hash = true

### Here we are doing :
  ### 1. Creating the database
  ### 2. Drop ~songs~ to avoid an error
  ### 3. Creating the ~songs~ table

## Use the ~#results_as_has~ metho, from SQLite3-Ruby gem.
## This method says when a ~SELECT~ statement is executed don't return a database row
## as an array, return it as a hash with the column names as keyes.