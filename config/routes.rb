Rails.application.routes.draw do
  get 'photos/search', to: 'photos#search'
  root 'photos#index'
end
