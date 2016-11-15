require 'sinatra'
require 'dotenv'

Dotenv.load
$stdout.sync = true

require './main'
run Sinatra::Application
