Rails.application.routes.draw do
  
  get 'users/:id/index' => 'users#index'
  get 'users/:id/edit' => 'users#edit'
  get 'users/:id/invite' => 'users#invite'
  get 'users/:id' => 'users#show'
  get 'users/:id/friend' => 'users#friend'
  
  post 'users/create' => 'users#create'
  post 'login' => 'users#login'
  post 'logout' => 'users#logout'
  post 'users/:id/update' => "users#update"
        
  get 'posts/index' => 'posts#index'
  get 'posts/new' => 'posts#new'
  get 'posts/:id/edit' => 'posts#edit'
  get 'posts/:id' => 'posts#show'
  
  post 'posts/create' => 'posts#create'
  post 'posts/:id/destroy' => 'posts#destroy'
  post 'posts/:id/update' => 'posts#update'
  
  get '/' => 'home#top'
  get 'cooking' => 'home#cooking'
  get 'health' => 'home#health'
  get 'learning' => 'home#learning'
  get 'life' => 'home#life'
  get 'out' => 'home#out'
  get 'mom' => 'home#mom'
  get 'trip' => 'home#trip'
  get 'sentences' => 'home#sentences'
  
  post 'create' => 'home#create'
  
  post 'likes/:post_id/create' => 'likes#create'
  post 'likes/:post_id/destroy' => 'likes#destroy'
  
  post 'comments/:post_id/create' => 'comments#create'
  post 'comments/:post_id/destroy' => 'comments#destroy'
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
