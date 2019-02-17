Rails.application.routes.draw do

  root 'companies#index'

  resources :companies do
    resources :transporters
    resources :orders do
      collection do
        get :posts
        get :taken
      end
      member do
        get :take
      end
    end
  end
  resources :senders do
    resources :orders
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
