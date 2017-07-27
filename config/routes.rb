Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :environments do
    member do
      post :update_pm
    end
  end
  root 'environments#index'
end
