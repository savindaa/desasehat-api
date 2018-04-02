# Admin.create(username: "desasehat", password: "superadmin", password_confirmation: "superadmin", name: "Super Admin", role: "super_admin")
# Admin.create(username: "edukasi", password: "adminedukasi", password_confirmation: "adminedukasi", name: "Admin Edukasi", role: "admin_edukasi")
#
# Village.create(name: "Condong Catur", kecamatan: "Depok", kabupaten: "Sleman", provinsi: "DI Yogyakarta", description: "Kodepos 55283")
# Village.create(name: "Catur Tunggal", kecamatan: "Depok", kabupaten: "Sleman", provinsi: "DI Yogyakarta", description: "Kodepos 55281")
#
# Article.create(title: "Artikel Edukasi",
#   content: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut tempus faucibus malesuada. Fusce condimentum dolor a tortor cursus, pulvinar varius nisl placerat. Vivamus gravida libero et quam blandit, non lobortis risus aliquet. Vestibulum augue felis, auctor quis euismod vitae, vehicula eget nulla. Ut ut rhoncus justo, sed vehicula felis. Aenean semper ipsum consequat, mollis tortor at, ornare lectus. Morbi faucibus et odio eu volutpat. Integer eleifend purus consectetur dolor tempus, eu egestas augue volutpat. Fusce vitae urna justo. Fusce quis leo condimentum urna pellentesque varius eget ac elit. Quisque quis elit sit amet magna scelerisque porta ac semper tellus. Donec vestibulum rutrum risus, vitae viverra metus feugiat nec. Duis rutrum viverra tincidunt. Interdum et malesuada fames ac ante ipsum primis in faucibus. Vestibulum ac ex gravida, volutpat turpis et, porttitor odio. Sed mollis vulputate  lorem et iaculis.",
#   admin_id: 2)

# User.create!(phone: "081234567899", name: "Dimas", gender: "laki-laki", role: "admin_desa", village_id: 1)
#
# Faker::Config.locale = 'id'
#
# 50.times do
# Patient.create!(
#   :name => Faker::Name.name,
#   :address => Faker::Address.street_address,
#   :phone => Faker::PhoneNumber.cell_phone,
#   :gender => ["laki-laki", "perempuan"].sample,
#   :blood_type => ["A", "B", "AB", "O"].sample,
#   :disease_type => ["Diabetes Mellitus", "Demam Berdarah", "Bronkitis"].sample,
#   :dob =>  Faker::Date.birthday(18, 65),
#   :pob => Faker::Address.city_name,
#   :village_id => 1,
#   :user_id => 1,
#   :status => "accepted"
# )
# end
#
# Resident.create!(input_date: DateTime.now.to_date.beginning_of_month, input_type: "jumlah_penduduk", total: 560, village_id: 1)
