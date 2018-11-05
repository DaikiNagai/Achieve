Rails.application.routes.draw do
  devise_for :users
  #get 'top/index'
  #get 'contacts/new'
  #get 'contacts/create'
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
    resources :blogs, only: [:index, :new, :create, :edit, :update, :destroy] do
      collection do
        post :confirm
      end
    end
    #get 'blogs' => 'blogs#index'
    
    root 'top#index'
    
    resources :contacts, only: [:new, :create] do
      collection do
        post :confirm
      end
    end
    
end
