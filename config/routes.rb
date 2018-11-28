
Rails.application.routes.draw do
  devise_for :users
  namespace :v1, defaults: { format: :json} do
    resources :topics
    resources :arguments
    get 'topics/get/by_user' => 'arguments#fetch_by_user'
    resource :sessions
    resource :votes
    end
end
