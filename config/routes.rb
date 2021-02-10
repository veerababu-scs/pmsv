Rails.application.routes.draw do
  #devise_for :users, controllers: { confirmations: 'confirmations' }
  devise_for :users
  resources :tasks, :only => [:index,:new,:create,:edit]
  resources :projects, :only => [:index,:new,:create]
  resources :users, :only => [:index]
  root "users#index"
	get "users/index"
	# For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
