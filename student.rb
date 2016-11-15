require 'sinatra'
require 'dm-core'
require 'dm-migrations'

DataMapper.setup(:default,"sqlite3://#{Dir.pwd}/students.db")

class Student
  include DataMapper::Resource
  property :id, Serial
  property :name, String
  property :major, String
  property :birthday, Date

  def birthday=date
    super Date.strptime(date, '%m/%d/%Y')
  end
end

DataMapper.finalize
Student.auto_upgrade!


get '/student' do
  if session[:admin] == true
    @student = Student.all
  slim :students
  else
    redirect to ('/login')
  end
end

get '/student/new' do
  @student = Student.new
  slim :new_student
end

get '/student/:id' do
  @student = Student.get(params[:id])
  slim :show_student
end

get '/student/:id/edit' do
  @student = Student.get(params[:id])
  slim :edit_student
end

post '/student' do
  student = Student.create(params[:student])
  redirect to("/student/#{student.id}")
end

put '/student/:id' do
  student = Student.get(params[:id])
  student.update(params[:student])
  redirect to("/student/#{student.id}")
end

delete '/student/:id' do
  Student.get(params[:id]).destroy
  redirect to('/student')
end



