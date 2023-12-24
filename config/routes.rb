Rails.application.routes.draw do
  namespace 'api' do
    namespace 'v1' do
      resources :rooms, only: [:index]
      resources :messages, only: :create
      post "/rooms" => "rooms#create"
    end
  end

  devise_for :users, controllers: { registrations: "registrations" }
  root to: "rooms#index"
  resources :rooms, only: %i[show new create], param: :title
  resources :messages, only: %i[ create ] do
    member { post :like }
  end
end
