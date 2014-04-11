RailsDecal::Application.routes.draw do
  root to: "pages#home"

  match "apply", to: "student_applications#new", via: :get
  match "apply", to: "student_applications#create", as: "student_applications", via: :post

  resources :lectures, only: [:show, :index]

  devise_for :users, path: '',
                     path_names: { sign_in: 'login', sign_up: 'sign-up', sign_out: 'logout'},
                     controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  resources :users, only: [:show]

  namespace :admin do
    match '/', to: redirect('/admin/dashboard'), via: :get
    match 'dashboard', to: 'pages#dashboard', via: :get
  end

end
