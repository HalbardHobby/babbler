Rails.application.routes.draw do
  resources :babbles
  post 'babbles/mark_as_read' => 'babbles#mark_as_read'
  devise_for :users
  root 'babbles#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
