Rails.application.routes.draw do

  root to: 'homes#top'
  devise_for :users, controllers: {
    sessions:      'public/devise/sessions',
    passwords:     'public/devise/passwords',
    registrations: 'public/devise/registrations'
  }
  devise_for :admins,
  path: :admin,
  controllers: {
    sessions: 'admin/devise/sessions',
    passwords: 'admin/devise/passwords',
    registrations: 'admin/devise/registrations',
  }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
