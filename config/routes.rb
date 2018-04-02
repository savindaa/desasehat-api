Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root "patients#index"

  resources :articles, path: '/edukasi'

  resources :villages, path: "/desa"

  resources :patients, path: "/pasien"

  get 'resident/update', to: "residents#update_log"

  get 'resident/:id', to: "residents#show"

end
