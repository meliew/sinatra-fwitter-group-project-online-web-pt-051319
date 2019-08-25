class TweetsController < ApplicationController

  get '/tweets' do
  if logged_in?
    @tweets = Tweet.all
    erb :"tweets/index"
  else
    redirect "/login"
  end
end

  post '/tweets' do

    @tweet = Tweet.create(content: params[:content])
    @tweet.user_id = current_user.id
    @tweet.save

    redirect "/tweets"

  end

get 'tweets/new' do
  if !logged_in?
    redirect '/login'
  else
    erb :'/tweets/new'
  end
end

get '/tweets/:id' do
  if !logged_in
    redirect '/login'
  else
    @tweet = Tweet.find_by_id(params[:id])
    @user = User.find_by_id(params[:id])
  erb :'tweets/show_tweet'
  end
end

get '/tweets/:id/edit' do
end



end
