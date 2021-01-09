Rails.application.routes.draw do

  devise_for :users
  root 'homes#top'
  get 'about' => 'homes#about'
  resources :users, only: [:index, :show, :edit, :update]
  resources :questions do
    resources :comments, only: [:create, :destroy]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
