Rails.application.routes.draw do

  root "patients#dashboard"

  resources :articles, path: "/edukasi"
  resources :villages, path: "/desa"
  resources :patients, path: "/pasien"

  get "/dashboard", to: "patients#dashboard"

  get "desa/:id/penduduk", to: "residents#show"

  # login API
  post "admin/login", to: "authentication#authenticate_admin"
  post "user/login", to: "otp_auth#login"
  post "user/verify", to: "otp_auth#verify_otp"

end
