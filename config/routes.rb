Rails.application.routes.draw do
  resources :posts
  devise_for :users, path: '', path_names: { sign_in: 'login', sign_out: 'logout', sign_up: 'register' }
  
  root 'pages#home'

  get 'pages/home'
  get 'pages/about'
  get 'pages/contact'

  
  # Rails.application.routes.draw do
  #   devise_for :users, controllers: {
  #     registraions: 'users/registraions',
  #     sessions: 'users/sessions',
  #     passwords: 'users/passwords',
  #     confirmations: 'users/confirmations'
  #   }
  # end

end
