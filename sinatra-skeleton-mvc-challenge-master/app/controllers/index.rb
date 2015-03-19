

get '/' do
  erb :welcome
end

get '/login' do
  erb :login
end

post '/login' do
  user = User.find_by(username: params[:username])
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


