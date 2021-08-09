Rails.application.routes.draw do

  namespace :public do
    get 'columns/index'
    get 'columns/show'
    get 'columns/edit'
    get 'columns/new'
  end
  root to: 'homes#top'
  devise_scope :user do
    post '/users/guest_sign_in',to: 'public/devise/sessions#guest_sign_in'
  end

  devise_for :users, controllers: {
    sessions:      'public/devise/sessions',
    registrations: 'public/devise/registrations'
  }
  devise_for :admins,
  path: :admin,
  controllers: {
    sessions: 'admin/devise/sessions',
  }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  scope module: :public do
    get 'users/:id/confirm' => 'users#confirm', as: 'users_confirm'
    patch 'users/destroy/:id' => 'users#destroy' , as: 'user_destroy'
    resources :users ,only: [:show,:edit,:update]
    resources :texts ,only: [:show, :index]
    resources :columns ,only: [:new, :create, :show, :index, :edit, :update, :destroy] do
      resources :links ,only: [:create, :destroy]
    end
    get 'columns/:id/link' => 'columns#link', as: 'columns_link'
    get 'ajax',         to: 'links#ajax'
  end


  namespace :admin do
    resources :texts ,only: [:new, :create, :show, :index, :edit, :update, :destroy]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
