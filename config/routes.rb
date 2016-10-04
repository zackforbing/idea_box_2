Rails.application.routes.draw do

  root to: 'public#index'

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :ideas, only: [:index, :create]
    end
  end
end
