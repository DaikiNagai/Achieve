Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users, controllers: {
    registrations: "users/registrations",
    omniauth_callbacks: "users/omniauth_callbacks"
  }
  #get 'top/index'
  #get 'contacts/new'
  #get 'contacts/create'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
    resources :blogs do
      post :confirm, on: :collection
      resources :comments
    end
    #get 'blogs' => 'blogs#index'

    root 'top#index'

    resources :contacts, only: [:new, :create] do
      collection do
        post :confirm
      end
    end

    resources :poems, only: [:index, :show]

    if Rails.env.development?
      mount LetterOpenerWeb::Engine, at: "/letter_opener"
    end
end
