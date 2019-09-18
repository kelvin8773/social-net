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
  
  # Rails.application.routes.draw do
  #   devise_for :users, controllers: {
  #     registraions: 'users/registraions',
  #     sessions: 'users/sessions',
  #     passwords: 'users/passwords',
  #     confirmations: 'users/confirmations'
  #   }
  # end

end
