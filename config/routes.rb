Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth'

  scope format: 'json' do
    namespace :users do
      resource :account, only: :show
      resource :two_factor_auth, only: [:show, :create]
    end

    resources :posts
  end
end
