Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :users, only: %i[update]
    end
  end
end
