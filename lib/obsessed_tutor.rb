require 'rubygems'
require 'sinatra'

set :views, Proc.new { File.join(root, '..', "views") }
set :public, Proc.new { File.join(root, '..', "public") }

configure do
  enable :sessions
end

before do
  session[:session_start_time] ||= Time.now
end

get '/' do
  @session_start_time = session[:session_start_time]
  erb :index
end

get '/timer' do
  erb :timer
end

# start = Time.now
# finish = Time.now
# elapsed = finish.to_f - start.to_f
# mins, secs = elapsed.divmod 60.0
# puts("%3d:%04.2f"%[mins.to_i, secs])
