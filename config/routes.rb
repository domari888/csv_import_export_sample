Rails.application.routes.draw do
  resources :users, only: :index do
    collection {resource :import, only: :create, controller: :import}
  end
end
