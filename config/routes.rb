Rails.application.routes.draw do
	get 'tag_tweets' => 'epicenter#tag_tweets' #just a label, you can call it anything you want
	#label here^ doesn't need to match here^

  get 'show_user' => 'epicenter#show_user' #just labels that shorten what you have to type in address bar
  get 'now_following' => 'epicenter#now_following' #these are all action method that sends data to the view
  get 'unfollow' => 'epicenter#unfollow'
  get 'following' => 'epicenter#following'
  get 'followers' => 'epicenter#followers'
  resources :tweets
  root 'epicenter#feed'
  get 'all_users' => 'epicenter#all_users'
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
