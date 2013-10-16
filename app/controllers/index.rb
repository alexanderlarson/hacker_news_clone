#=========== GET ============

get '/' do
  @posts = Post.all
  erb :index
end

get '/login' do
  erb :sign_up_login
end

get '/profile/:user_id' do
  erb :profile
end

get '/all_posts/:user_id' do
  erb :member_posts
end

get '/all_comments/:user_id' do
  erb :member_comments
end

get '/make_new_post/' do 
  erb :new_post
end

get '/logout' do
  session.clear
  redirect '/'
end

#========== POST =============

post '/login' do
  @user = User.find(params[:email])
  redirect to '/'
end

post '/signup' do
  @user = User.create(params[:user])
  redirect to '/profile/:user_id'
end

post '/newpost/:user_id' do
  @user_id = User.find(params[:id])
  @post = Post.create(params[:post])
end



