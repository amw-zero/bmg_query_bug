#!/usr/bin/env ruby

require 'bmg'
require 'bmg/sequel'
require_relative 'postgres_constants'
require_relative 'data'

db = Sequel.connect(DB_URL)

transactions_sql = Bmg.sequel(:transactions, db)
tags_sql = Bmg.sequel(:tags, db)

transactions_mem = Bmg::Relation.new(TRANSACTIONS)
tags_mem = Bmg::Relation.new(TAGS)

def query(transactions, tags)
  transactions.join(tags.restrict(name: 'income'), { id: :transaction_id })
end

def query_reversed(transactions, tags)
  tags.restrict(name: 'income').join(transactions, { transaction_id: :id })
end

def run_query(title, type: :mem)
  puts title
  puts "======================"
  result = yield

  puts result.to_a
  puts result.to_sql if type == :sql

  puts;puts
end

run_query("Sql Relation", type: :sql)           { query(transactions_sql, tags_sql) }
run_query("In Memory Relation")                 { query(transactions_mem, tags_mem) }
run_query("Sql Relation Reversed", type: :sql)  { query_reversed(transactions_sql, tags_sql) }
