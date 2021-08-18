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
    resources :topics ,only: [:create, :show, :index, :destroy] do
      resources :posts ,only: [:create] do
        get 'ajax',         to: 'posts#ajax'
      end

    end
    resources :likes ,only: [:create, :destroy]
    resources :comments ,only: [:create, :destroy]
    resources :users ,only: [:show,:edit,:update]
    resources :texts ,only: [:show, :index] do
      resources :patches ,only: [:new, :create, :show, :index, :edit, :update, :destroy] do
        get 'literatures' => 'literatures#text_patch_index'
        post 'literatures' => 'literatures#text_patch_create'
        delete 'literature/:id' => 'literatures#text_patch_destroy', as: 'literature'
        resources :text_patch_orders ,only: [:new, :edit, :create, :destroy], as: 'orders'
        get 'order/ajax1',         to: 'text_patch_orders#ajax1'
        get 'order/ajax2',         to: 'text_patch_orders#ajax2'
      end
    end
    resources :columns ,only: [:new, :create, :show, :index, :edit, :update, :destroy] do
      post 'literatures' => 'literatures#column_create'
      delete 'literature/:id' => 'literatures#column_destroy', as: 'literature'
      resources :links ,only: [:create, :destroy]
    end
    resources :problems ,only: [:new, :create, :show, :index, :edit, :update, :destroy] do
      resources :subjects ,only: [:create, :destroy]
    end
    get 'columns/:id/link' => 'columns#link', as: 'columns_link'

    get 'problems/:id/subject' => 'problems#subject', as: 'subject_problem'
    get 'ajax',         to: 'links#ajax'
    get 'ajax/subjects',         to: 'subjects#ajax'
  end


  namespace :admin do
    resources :texts ,only: [:new, :create, :show, :index, :edit, :update, :destroy] do
      post 'literatures' => 'literatures#text_create'
      delete 'literature/:id' => 'literatures#text_destroy',as: 'literature'
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
