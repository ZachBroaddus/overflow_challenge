get '/users/new' do
  @user = User.new
  erb :'users/new'
end

post '/users' do
  @user = User.new(params[:user])
  if @user.save
    session[:user_id] = @user.id
    redirect '/'
  else
    @user.errors.full_messages
    @errors = @user.errors.full_messages
    erb :"users/new"
  end
end
