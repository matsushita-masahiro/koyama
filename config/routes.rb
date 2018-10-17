Rails.application.routes.draw do
  post 'posts/create' => 'posts#create'
  post 'posts/:id/destroy' => 'posts#destroy'
  post 'posts/:id/update' => 'posts#update'
  
  post 'users/create_friend' => 'users#create_friend'
  post 'users/create' => 'users#create'
  post 'login' => 'users#login'
  post 'logout' => 'users#logout'
  post 'users/:id/update' => "users#update"
  post 'users/invite_create' => 'users#invite_create'
  post 'users/:id/destroy' => 'users#destroy'
  
  get 'users/index' => 'users#index'
  get 'users/:id/relationship' => 'users#relationship'
  get 'users/:id/edit' => 'users#edit'
  get 'users/:id/invite' => 'users#invite'
  get 'users/:id/friend' => 'users#friend'
  get 'users/:id' => 'users#show'
  
  
  
        
  get 'posts/index' => 'posts#index'
  get 'posts/new' => 'posts#new'
  get 'posts/:id/edit' => 'posts#edit'
  get 'posts/:id' => 'posts#show'
  
 
  
  get '/' => 'home#top'
  get 'cooking' => 'home#cooking'
  get 'cooking_recipe' => 'home#cooking_recipe'
  get 'cooking_ingredient' => 'home#cooking_ingredient'
  get 'health' => 'home#health'
  get 'learning' => 'home#learning'
  get 'life' => 'home#life'
  get 'out' => 'home#out'
  get 'mom' => 'home#mom'
  get 'trip' => 'home#trip'
  get 'sentences' => 'home#sentences'
  get 'login' => 'home#login'
  get 'sign_up' => 'home#sign_up'
  
  post 'create' => 'home#create'
  post 'learning_create' => 'home#learning_create'
  post 'health_create' => 'home#health_create'
  post 'cooking_create' => 'home#cooking_create'
  post 'out_create' => 'home#out_create'
  post 'life_create' => 'home#life_create'
  post 'trip_create' => 'home#trip_create'
  post 'mom_create' => 'home#mom_create'
  
  post 'likes/:post_id/create' => 'likes#create'
  post 'likes/:post_id/destroy' => 'likes#destroy'
  
  post 'comments/:post_id/create' => 'comments#create'
  post 'comments/:post_id/destroy' => 'comments#destroy'
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
