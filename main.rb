require 'sinatra'
require 'slim'
require 'sass'
require './student'
require 'sinatra/reloader' if development?

configure do
  enable :sessions
  set :username,"yuan"
  set :password,"new"
end



get('/styles.css'){ scss :styles }

get '/' do
  slim :home
end

get '/about' do
  @title = "All About This Website"
  slim :about
end

get '/contact' do
  slim :contact
end

not_found do
  slim :not_found
end

get'/login'do
  slim :login
end

get '/logout' do
  session.clear
  redirect to ('/login')
end

post'/login' do
  if params[:username] ==settings.username &&
      params[:password] == settings.password
    session[:admin] = true
    redirect to ('student')
  else
    slim :login
  end
end

