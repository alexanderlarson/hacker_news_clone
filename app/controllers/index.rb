#=========== GET ============

get '/' do
  @posts = Post.all
  erb :index
end

get '/login' do
  erb :sign_up_login
end

get '/profile/:user_id' do
  @user = User.find(params[:user_id])
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

get 'post/:post_id' do
  @post = Post.find(params[:post_id])
  @comments = @post.comments
  erb :singlepost
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

post '/newpost/:post_id' do
  @user_id = User.find(params[:id])
  @post = Post.create(params[:post])
end

post '/post/:post_id' do
  @post_id = params[:post_id]
  @user_id = User.find(session[:id]).id 
  @comment_text = params[:comment_text]
  Comment.create(post_id: @post_id, user_id: @user_id, comment_text: @comment_text)
  redirect "/post/#{@post_id}"
end

