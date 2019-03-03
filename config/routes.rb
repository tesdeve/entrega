Rails.application.routes.draw do

  root 'companies#index'

  resources :companies do
    resources :transporters do 
      member do
        get :orders
      end      
    end
    # added from here 
    resources :orders do
      collection do
        get :posts
        get :taken
      end
      member do
        get :take
      end
    end
    # to here
  end

  resources :senders do
    resources :orders do
      collection do
        get :posts
      end
    end
  end 


# Added to be able to see the orders
 resources :transporters do
   resources :orders
 end


end

# Removed to reflect the new association added Trough Company-Transporter-Orders

    #  resources :orders do
    #    collection do
    #      get :posts
    #      get :taken
    #      get :transporter_orders
    #    end
    #      member do
    #        get :take
    #      end
    #   end     
    #end



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

