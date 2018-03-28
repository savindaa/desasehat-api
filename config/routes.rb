Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :villages, path: "desa"

  post 'admin/login', to: 'authentication#authenticate_admin'
  get 'admin/do', to: 'authorize_request#authorize'

end
