Rails.application.routes.draw do


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
    resources :texts ,only: [:new, :create, :show, :index, :edit, :update, :destroy]
  end


  namespace :admin do

  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
