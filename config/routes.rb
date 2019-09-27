Rails.application.routes.draw do

  root 'posts#index'

  devise_for :users, 
              path: '', 
              path_names: { sign_in: 'login', 
                            sign_out: 'logout', 
                            sign_up: 'register' },
              controllers: { sessions: 'users/sessions' }
    
    
  get 'pages/home'
  get 'pages/about'
  get 'pages/contact'
    
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

end
