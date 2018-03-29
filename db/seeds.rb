# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#
# variable = Admin.create(username: "desasehat", password: "superadmin", password_confirmation: "superadmin", name: "Super Admin", role: "super_admin")
# variable = Admin.create(username: "edukasi", password: "adminedukasi", password_confirmation: "adminedukasi", name: "Admin Edukasi", role: "admin_edukasi")
#
# variable = Village.create(name: "Condong Catur", kecamatan: "Depok", kabupaten: "Sleman", provinsi: "DI Yogyakarta", description: "Kodepos 55283")
# variable = Village.create(name: "Catur Tunggal", kecamatan: "Depok", kabupaten: "Sleman", provinsi: "DI Yogyakarta", description: "Kodepos 55281")
#
# variable = Article.create(title: "Artikel Edukasi",
#   content: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut tempus faucibus malesuada. Fusce condimentum dolor a tortor cursus, pulvinar varius nisl placerat. Vivamus gravida libero et quam blandit, non lobortis risus aliquet. Vestibulum augue felis, auctor quis euismod vitae, vehicula eget nulla. Ut ut rhoncus justo, sed vehicula felis. Aenean semper ipsum consequat, mollis tortor at, ornare lectus. Morbi faucibus et odio eu volutpat. Integer eleifend purus consectetur dolor tempus, eu egestas augue volutpat. Fusce vitae urna justo. Fusce quis leo condimentum urna pellentesque varius eget ac elit. Quisque quis elit sit amet magna scelerisque porta ac semper tellus. Donec vestibulum rutrum risus, vitae viverra metus feugiat nec. Duis rutrum viverra tincidunt. Interdum et malesuada fames ac ante ipsum primis in faucibus. Vestibulum ac ex gravida, volutpat turpis et, porttitor odio. Sed mollis vulputate  lorem et iaculis.",
#   admin_id: 2)

# variable = Admin.create(username: "desasehat", password: "superadmin", password_confirmation: "superadmin", name: "Super Admin", role: "super_admin")
# variable = Admin.create(username: "edukasi", password: "adminedukasi", password_confirmation: "adminedukasi", name: "Admin Edukasi", role: "admin_edukasi")
#
# variable = Village.create(name: "Condong Catur", kecamatan: "Depok", kabupaten: "Sleman", provinsi: "DI Yogyakarta", description: "Kodepos 55283")
# variable = Village.create(name: "Catur Tunggal", kecamatan: "Depok", kabupaten: "Sleman", provinsi: "DI Yogyakarta", description: "Kodepos 55281")
#
# variable = Article.create(title: "Artikel Edukasi",
#   content: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut tempus faucibus malesuada. Fusce condimentum dolor a tortor cursus, pulvinar varius nisl placerat. Vivamus gravida libero et quam blandit, non lobortis risus aliquet. Vestibulum augue felis, auctor quis euismod vitae, vehicula eget nulla. Ut ut rhoncus justo, sed vehicula felis. Aenean semper ipsum consequat, mollis tortor at, ornare lectus. Morbi faucibus et odio eu volutpat. Integer eleifend purus consectetur dolor tempus, eu egestas augue volutpat. Fusce vitae urna justo. Fusce quis leo condimentum urna pellentesque varius eget ac elit. Quisque quis elit sit amet magna scelerisque porta ac semper tellus. Donec vestibulum rutrum risus, vitae viverra metus feugiat nec. Duis rutrum viverra tincidunt. Interdum et malesuada fames ac ante ipsum primis in faucibus. Vestibulum ac ex gravida, volutpat turpis et, porttitor odio. Sed mollis vulputate  lorem et iaculis.",
#   admin_id: 2)
Faker::Config.locale = 'id'

# 20.times do
# Patient.create!(
#   :name => Faker::Name.name,
#   :address => Faker::Address.street_address,
#   :phone => Faker::PhoneNumber.cell_phone,
#   :gender => "laki-laki",
#   :blood_type => "O",
#   :disease_type => "Diabetes",
#   :dob =>  Faker::Date.birthday(18, 65),
#   :pob => Faker::Address.city_name,
#   :village_id => 1,
#   :user_id => 1,
#   :status => "accepted"
# )
# end

# 12.times do
# Patient.create!(
#   :name => Faker::Name.name,
#   :address => Faker::Address.street_address,
#   :phone => Faker::PhoneNumber.cell_phone,
#   :gender => ["laki-laki", "perempuan"].sample,
#   :blood_type => ["A", "B", "AB", "O"].sample,
#   :disease_type => "Demam Berdarah",
#   :dob =>  Faker::Date.birthday(50, 65),
#   :pob => Faker::Address.city_name,
#   :village_id => 1,
#   :user_id => 1,
#   :status => "accepted"
# )
# end

# Resident.create!(input_date: DateTime.now.to_date.beginning_of_month >> -1, input_type: "jumlah_penduduk", total: 560, village_id: 1)
# variable = User.create(phone: "081234567899", name: "John Doe", gender: "laki-laki", nik: "12312301012000100", role: "admin_desa", village_id: 1)
