Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root "patients#dashboard"

  resources :articles, path: "/edukasi"

  resources :villages, path: "/desa"

  resources :patients, path: "/pasien"

  get "penduduk/update", to: "residents#update_log"

  get "penduduk/:id", to: "residents#show"

  post "admin/login", to: "authentication#authenticate_admin"

  post "user/login", to: "otp_auth#login"

  post "user/verify", to: "otp_auth#verify_otp"

end
