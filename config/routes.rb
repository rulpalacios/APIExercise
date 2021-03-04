Rails.application.routes.draw do
  scope module: :api, constraints: ApiConstraint do
    resources :articles
  end
  resources :articles
  resources :rooms
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
