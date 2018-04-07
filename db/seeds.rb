Faker::Config.locale = 'id'
# Admin.create(username: "desasehat", password: "superadmin", password_confirmation: "superadmin", name: "Super Admin", role: "super_admin")
# Admin.create(username: "edukasi", password: "adminedukasi", password_confirmation: "adminedukasi", name: "Admin Edukasi", role: "admin_edukasi")
#
provinsi = Province.create(provinsi: "DI Yogyakarta")
kabupaten = provinsi.regencies.create(kabupaten: "Sleman")
kecamatan = kabupaten.subdistricts.create(kecamatan: "Depok")
kecamatan.villages.create(kelurahan: "Condong Catur", kodepos: "55283")
#
# Article.create(title: "Artikel Edukasi",
#   content: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut tempus faucibus malesuada. Fusce condimentum dolor a tortor cursus, pulvinar varius nisl placerat. Vivamus gravida libero et quam blandit, non lobortis risus aliquet. Vestibulum augue felis, auctor quis euismod vitae, vehicula eget nulla. Ut ut rhoncus justo, sed vehicula felis. Aenean semper ipsum consequat, mollis tortor at, ornare lectus. Morbi faucibus et odio eu volutpat. Integer eleifend purus consectetur dolor tempus, eu egestas augue volutpat. Fusce vitae urna justo. Fusce quis leo condimentum urna pellentesque varius eget ac elit. Quisque quis elit sit amet magna scelerisque porta ac semper tellus. Donec vestibulum rutrum risus, vitae viverra metus feugiat nec. Duis rutrum viverra tincidunt. Interdum et malesuada fames ac ante ipsum primis in faucibus. Vestibulum ac ex gravida, volutpat turpis et, porttitor odio. Sed mollis vulputate  lorem et iaculis.",
#   admin_id: 2)
#
5.times { User.create!(phone: Faker::PhoneNumber.phone_number, name: Faker::Name.name, gender: "laki-laki", village_id: 1) }
DiseaseType.create!(name: "Asthma")
DiseaseType.create!(name: "Diare")
DiseaseType.create!(name: "Diabetes Melitus")
DiseaseType.create!(name: "Demam Berdarah")
DiseaseType.create!(name: "Gizi Buruk")
DiseaseType.create!(name: "Hipertensi")
DiseaseType.create!(name: "Jantung Koroner")
DiseaseType.create!(name: "Malaria")
DiseaseType.create!(name: "Stroke")
DiseaseType.create!(name: "Tuberkolosis")
#
#
#
10.times do
  tmp = [1, 2].sample
Patient.create!(
  :name => Faker::Name.name,
  :address => Faker::Address.street_address,
  :phone => Faker::PhoneNumber.phone_number,
  :gender => ["laki-laki", "perempuan"].sample,
  :blood_type => ["A", "B", "AB", "O"].sample,
  :dob =>  Faker::Date.birthday(18, 65),
  :pob => Faker::Address.city_name,
  :disease_type_id => rand(1..10),
  :village_id => 1,
  :inputted_by_id => 1,
  :status => ["pending", "accepted"].sample,
  :created_at => Date.today
)
end

# TotalResident.create!(total: 560, village_id: 1)
# TotalResident.create!(total: 710, village_id: 2)


Privilege.create!(name: "admindesa")
Privilege.create!(name: "validator")
Privilege.create!(name: "inputter")
Privilege.create!(name: "edukasi")
