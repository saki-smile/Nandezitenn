Rails.application.routes.draw do
  devise_for :users
  root 'homes#top'
  get 'about' => 'homes#about'
  resources :users, only: [:index, :show, :edit, :update] do
    member do
      get 'out'
      get 'hide'
    end
    resource :relationships, only: [:create, :destroy]
    get 'followed' => 'relationships#followed', as: 'followed'
    get 'follower' => 'relationships#follower', as: 'follower'
  end
  # get 'users/:id/out' => 'users#out', as: 'out'
  # get 'users/:id/hide' => 'users#hide', as: 'hide'
  get 'users/:id/favorites' => 'users#favorite', as: 'users_favorites'
  resources :questions do
    resource :favorites, only: [:create, :destroy]
    resources :comments, only: [:create, :destroy]
  end
  get 'search' => 'questions#search'
  resource :inquiries, only: [:new, :create]
  get 'thanks' => 'inquiries#thanks'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
