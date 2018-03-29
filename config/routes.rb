Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :articles, path: '/edukasi'

  resources :villages, path: "/desa"

  post 'admin/login', to: 'authentication#authenticate_admin'

end
