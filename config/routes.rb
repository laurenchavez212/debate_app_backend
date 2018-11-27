
Rails.application.routes.draw do
  devise_for :users
  namespace :v1, defaults: { format: :json} do
    resources :topics
    resources :arguments
    resource :sessions
    resource :votes
    end
end
