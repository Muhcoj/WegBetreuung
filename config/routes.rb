Rails.application.routes.draw do
  resources :kontoumsaetzes do 
    collection { post :import }
  end

  resources :posts
  devise_for :users, controllers: { registrations: 'registrations'}
  
  # devise_scope :user do
  #   root to: "devise/sessions#new"
  # end

  root to: 'static#home'

  get 'static/contact'

  post 'static/thank_you'
end
