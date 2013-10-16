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
  @user = User.find(params[:user_id])
  @user_posts = @user.posts
  erb :member_posts
end

get '/all_comments/:user_id' do
  erb :member_comments
end

get '/make_new_post' do 
  if current_user
    @user_id = User.find(session[:id]).id
   erb :new_post
  else
    redirect '/login'
  end
end

get '/post/:post_id' do
  @post = Post.find(params[:post_id])
  @comments = @post.comments
  erb :single_post
end

get '/logout' do
  session.clear
  redirect '/'
end

#========== POST =============

post '/login' do
  @user = User.find_by_email(params[:email])
    if @user.password_hash == params[:password]
      session[:id] = @user.id
      redirect "/profile/#{session[:id]}"
    else
      redirect '/login'
    end
  end

post '/signup' do
  @user = User.create(params[:newuser])
  session[:id] = @user.id
  redirect to "/profile/#{session[:id]}"
end

post '/newpost/:post_id' do
  @user_id = User.find(params[:user_id])
  @post = Post.create(params[:post])
  redirect "/post/#{@post.id}"
end

post '/post/:post_id' do
  @post_id = params[:post_id]
  @user_id = User.find(session[:id]).id 
  @comment_text = params[:comment_text]
  Comment.create(post_id: @post_id, user_id: @user_id, comment_text: @comment_text)
  redirect "/post/#{@post_id}"
end

