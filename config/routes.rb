Rails.application.routes.draw do

  root "patients#patients_list"

  # dropdown desa
  get "/desa/dropdown", to: "villages#village_dropdown"
  get "/desa/dropdown/:prov", to: "villages#village_dropdown"
  get "/desa/dropdown/:prov/:kab", to: "villages#village_dropdown"
  get "/desa/dropdown/:prov/:kab/:kec", to: "villages#village_dropdown"

  get "/desa/statistik/:id", to: "villages#village_statistic"

  # edukasi API
  get "/edukasi", to: "articles#list"
  get "/edukasi/:id", to: "articles#detail"
  get "/edukasi/bookmark-simpan/:id", to: "articles#add_bookmark"
  get "/edukasi/bookmark-hapus/:id", to: "articles#remove_bookmark"
  get "/edukasi/bookmark-list", to: "articles#list_bookmark"

  # campaign API
  get "/pasien", to: "patients#patients_list"
  get "/pasien/:id", to: "patients#patient_detail"


  # Logged in user action

  # signup API
  post "user/signup", to: "otp_auth#signup"

  # login API
  post "user/login", to: "otp_auth#login"
  post "user/verify", to: "otp_auth#verify_otp"
  post "user/resend", to: "otp_auth#resend_otp"

  # admin desa API
  get "user/admindesa/list-user", to: "admin_desa#list_users"
  get "user/admindesa/list-user/:id", to: "admin_desa#detail_user"
  get "user/admindesa/list-wewenang", to: "admin_desa#privileges_list"
  put "user/admindesa/update-wewenang/:id", to: "admin_desa#update_privileges"

  # article creator API 
  get "user/creator/list-kategori", to: "article_creator#tags_list"
  post "user/creator/artikel-baru", to: "article_creator#create_article"
  get "user/creator/artikelku", to: "article_creator#my_articles"
  delete "user/creator/hapus-artikel/:id", to: "article_creator#delete_article"
  put "user/creator/edit-artikel/:id", to: "article_creator#edit_article"

  # campaign inputter API
  get "user/inputter/list-penyakit", to: "inputter#list_disease"
  post "user/inputter/campaign-baru", to: "inputter#create_patient"
  get "user/inputter/list-campaignku", to: "inputter#my_inputted_patient"

  # campaign validator API
  get "user/validator/pending-campaign", to: "validator#list_pending_patient"
  get "user/validator/validasi-campaign/:id", to: "validator#validate_patient"
  get "user/validator/tolak-campaign/:id", to: "validator#decline_patient"
  get "user/validator/list-validasi-campaignku", to: "validator#my_validated_patient"


  # CMS
  post "admin/login", to: "authentication#authenticate_admin"
  resources :medical_facilities, path: "admin/fasilitas-kesehatan"
  resources :medical_personnels, path: "admin/tenaga-kesehatan"
  resources :posts, path: "admin/artikel"
  resources :users, path: "admin/user"
  resources :desa, path: "admin/desa"
  resources :kecamatan, path: "admin/kecamatan"
  resources :kabupaten, path: "admin/kabupaten"
  resources :provinsi, path: "admin/provinsi"
  resources :disease_types, path: "admin/jenis-penyakit"
  resources :privileges, path: "admin/wewenang"
  resources :tags, path: "admin/kategori-artikel"
  resources :total_residents, path: "admin/jumlah-penduduk"
  
  
end
