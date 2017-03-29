Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  # namespace 'something' do
  # end

  # scope '(:locale)', locale: /fr|es|en/ do
    resources :restaurants
    devise_for :users
    root to: 'pages#home'
    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # end
end
