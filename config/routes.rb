Rails.application.routes.draw do
  get 'comments/new'
  post 'comments/create'

  post 'comments/update'

  delete 'comments/destroy'

  root 'posts#index'
  
  get 'users/index'
  get 'users/show'
  
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
  
  # Rails.application.routes.draw do
  get 'comments/new'
  get 'comments/update'
  get 'comments/destroy'
  get 'users/index'
  get 'users/show'
  
  #   devise_for :users, controllers: {
  #     registraions: 'users/registraions',
  #     sessions: 'users/sessions',
  #     passwords: 'users/passwords',
  #     confirmations: 'users/confirmations'
  #   }
  # end

end
