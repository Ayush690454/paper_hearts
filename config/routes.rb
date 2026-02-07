Rails.application.routes.draw do
  devise_for :users

  root "home#index"

  resource :wall, only: [:show] do
    resources :papers, only: [:new, :create, :update, :destroy]
  end


  get "/.well-known/*path", to: proc { [204, {}, [""]] }
end
