Rails.application.routes.draw do
  resources :kontoumsaetzes do 
    collection { post :import }
  end

  resources :posts
  devise_for :users, controllers: { registrations: 'registrations'}
  root to: 'static#home'
end
