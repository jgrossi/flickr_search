Rails.application.routes.draw do
  resource :photos, only: [:index, :create, :destroy] do
    collection do
      get 'search'
    end
  end
  root 'photos#index'
end
