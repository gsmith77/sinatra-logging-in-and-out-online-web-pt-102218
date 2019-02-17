require_relative '../../config/environment'
class ApplicationController < Sinatra::Base
  configure do
    set :views, Proc.new { File.join(root, "../views/") }
    enable :sessions unless test?
    set :session_secret, "secret"
  end

  get '/' do
    erb :index
  end

  post '/login' do
    @user = User.find_by(username: params[:username])
    #binding.pry
    if @user.password == params[:password]
      session[:user_id] = @user.id
      redirect '/account'
      erb :account
    else
      redirect '/error'
    end
  end

  get '/account' do
    binding.pry
    #FILL THIS OUT BEFORE TRYING ANYTHING NEW!!!
  end

  get '/logout' do
    session.clear
    redirect '/'
  end


end
