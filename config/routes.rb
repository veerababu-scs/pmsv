Rails.application.routes.draw do
  devise_for :admins, controllers: {sessions: "admins/sessions"}
  #get '/admins' => 'admins#index', as: :admin_root
  #namespace :admin do
     # root 'admins#index' # creates user_root_path
  #end
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  #devise_for :users, controllers: { confirmations: 'confirmations' }
  devise_for :users
  resources :tasks, :only => [:index,:new,:create,:edit,:update,:show]
  resources :projects, :only => [:index,:new,:create,:edit,:update]
  resources :users, :only => [:index,:show]
  #resources :attachments, :only=>[:index,:new,:create]
  resources :project_attachments, :only=>[:index,:new,:create,:show]
  root "users#index"
	get "users/index"
	# For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
