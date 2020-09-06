#!/usr/bin/env ruby

require_relative 'postgres_constants'

system("dropdb #{BUG_DB}")