Rails.application.routes.draw do

  root 'posts#index'

  devise_for :users, 
              path: '', 
              path_names: { sign_in: 'login', 
                            sign_out: 'logout', 
                            sign_up: 'signup' },
              controllers: { 
                sessions: 'users/sessions',
                omniauth_callbacks: 'users/omniauth_callbacks'
               }
    
    
  get 'pages/home'
  
  get '/friends', to: 'pages#friends'
    
  resources :posts
  resources :likes
  
  # Rails.application.routes.draw do

  get 'comments/new'
  post 'comments/create'
  post 'comments/update'
  delete 'comments/destroy'

  get 'users/index'
  get 'users/show'

  post 'likes/create'
  delete 'likes/destroy'

  post '/create_friend', to: 'friendships#create'
  patch '/confirm_friend', to: 'friendships#confirm'
  delete '/ignore_request', to: 'friendships#ignore'
  delete '/cancel_request', to: 'friendships#cancel'

  delete '/delete_friend', to: 'friendships#destroy'



end
