#!/usr/bin/env ruby

require 'bmg'
require 'bmg/sequel'
require_relative 'postgres_constants'
require_relative 'data'

system("createdb #{BUG_DB}")

DB = Sequel.connect(DB_URL)

DB.create_table :transactions do
  primary_key :id
  Float :amount
  String :name
end

DB.create_table :tags do
  primary_key :id
  foreign_key :transaction_id, :transactions
  String :name
end
