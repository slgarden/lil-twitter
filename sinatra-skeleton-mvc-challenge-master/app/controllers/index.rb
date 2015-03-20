

get '/' do
  erb :welcome
end

get '/login' do
  erb :login
end

post '/login' do
  user = User.find_by(username: params[:username])
  redirect '/login' unless user
  if user.authenticate(params[:password])
    session[:user_id] = user.id
    redirect '/main'
  else
    erb :login
  end
end

get '/register' do
  erb :register
end

post '/register' do
  user = User.new(name: params[:name], email: params[:email], username: params[:username], password: params[:password])
  if user.save
    session[:user_id] = user.id
    redirect '/main'
  else
    erb :register
  end
end

get '/main' do
  @users = User.all
  @current_user = User.find(session[:user_id])
  erb :main
end

get '/follow/:id' do
  user = User.find(params[:id])
  @current_user = User.find(session[:user_id])
  @current_user.idols << user
  @current_user.save
  redirect '/main'
end

get '/unfollow/:id' do
  user = User.find(params[:id])
  @current_user = User.find(session[:user_id])
  @current_user.idols.delete(user)
  @current_user.save
  redirect '/main'
end


