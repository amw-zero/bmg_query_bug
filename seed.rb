#!/usr/bin/env ruby

require 'bmg'
require 'bmg/sequel'
require_relative 'postgres_constants'
require_relative 'data'

DB = Sequel.connect(DB_URL)

transactions = Bmg.sequel(:transactions, DB)
tags = Bmg.sequel(:tags, DB)

TRANSACTIONS.each { |t| transactions.insert(t) }
TAGS.each { |t| tags.insert(t) }