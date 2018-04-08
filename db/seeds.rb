Faker::Config.locale = 'id'
Admin.create(username: "desasehat", password: "superadmin", password_confirmation: "superadmin", name: "Super Admin")
Admin.create(username: "edukasi", password: "adminedukasi", password_confirmation: "adminedukasi", name: "Admin Edukasi")

provinsi = Province.create(provinsi: "DI Yogyakarta")
kabupaten = provinsi.regencies.create(kabupaten: "Sleman")
kecamatan = kabupaten.subdistricts.create(kecamatan: "Depok")
kecamatan.villages.create(kelurahan: "Condong Catur", kodepos: "55283")

5.times { User.create!(phone: Faker::PhoneNumber.phone_number, name: Faker::Name.name, gender: "laki-laki", village_id: 1) }

Tag.create!(name: "Cegah")
Tag.create!(name: "Pengobatan")
Tag.create!(name: "Fakta")

article = Article.create!(title: "5 Langkah Mudah Mencegah Demam Berdarah",
  content: "DBD (Demam Berdarah Dengue), atau yang lebih dikenal dengan demam berdarah, disebabkan oleh virus dengue yang dibawa oleh nyamuk\u00A0Aedes aegypti.\u00A0Untuk mencegah demam berdarah, biasanya dilakukan penyemprotan atau fogging untuk mencegah jentik-jentik nyamuk\u00A0Aedes aegypti\u00A0berkembang biak. Namun, pencegahan juga tetap harus\u00A0Anda lakukan sendiri di rumah. Berikut 5 cara mudah yang bisa Anda lakukan untuk mencegah demam berdarah.\r\n1. Bersihkan bak mandi Anda seminggu sekali\r\nAir merupakan tempat berkembang biak nyamuk\u00A0Aedes aegypti\u00A0. Nyamuk betina bertelur pada dinding bak yang terisi air, larva nyamuk kemudian akan mendapat makanan dari mikroorganisme yang hidup di sekitarnya. Selama masa ini, larva nyamuk akan melepaskan kulit pelindung mereka dan berkembang biak hingga mencapai tahap terakhir. Ketika larva nyamuk sudah cukup kuat, selanjutnya larva akan berubah menjadi pupa. Pada tahap pupa, tidak dibutuhkan makanan. Pupa hanya akan mengalami perubahan bentuk hingga akhirnya menjadi nyamuk biasa yang siap terbang.\r\nKeseluruhan siklus ini berlangsung 8 \u2013 10 hari dalam suhu ruang. Membersihkan bak mandi Anda setidaknya satu minggu sekali dapat memutus siklus hidup nyamuk\u00A0Aedes aegypti.\r\n2. Perhatikan perabotan rumah tangga Anda yang menampung air\r\nBaskom berisi air, vas bunga, ember, dan wadah lain yang dapat menampung air berpotensi menjadi tempat nyamuk bersarang. Rajin-rajinlah membersihkan tempat-tempat tersebut setidaknya dua kali seminggu untuk mengurangi risiko munculnya nyamuk pembawa demam berdarah.\r\n3. Gunakan kasa nyamuk\r\nKasa nyamuk berguna untuk mencegah masuknya nyamuk dari luar rumah. Anda bisa memasang kasa nyamuk ini pada pintu dan jendela Anda.\r\n4. Jangan menumpuk atau menggantung baju terlalu lama\r\nSesekali perhatikanlah gantungan baju Anda di balik pintu. Baju kotor yang menumpuk dapat menjadi tempat favorit untuk dihinggapi nyamuk. Memang tumpukan baju kotor bukan tempat nyamuk berkembang biak, tetapi merupakan tempat favorit nyamuk hinggap. Hal ini dikarenakan nyamuk menyukai aroma tubuh manusia. Jika Anda memang harus menyimpan kembali baju yang telah dipakai, letakkan baju pada tempat yang bersih dan tertutup.\r\n5. Gunakan\u00A0lotion\u00A0anti nyamuk atau kelambu\r\nKetika Anda hendak bepergian, jangan lupa gunakan\u00A0lotion\u00A0anti nyamuk terutama pada bagian tubuh yang tidak tertutup oleh pakaian. Namun tidak hanya saat bepergian, Anda tetap harus melindungi diri dari gigitan nyamuk ketika sedang tidur karena nyamuk demam berdarah aktif pada malam hari hingga menjelang subuh.\r\nSelain menggunakan\u00A0lotion\u00A0anti nyamuk, menggunakan kelambu saat tidur juga dapat membantu menghindari gigitan nyamuk dan mencegah demam berdarah.",
  picture: "data:image/png;base64,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",
  status: "accepted",
  created_by_id: 2)
article.tags << Tag.first

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
20.times do
  Patient.create!(
    :name => Faker::Name.name,
    :address => Faker::Address.street_address,
    :phone => Faker::PhoneNumber.phone_number,
    :gender => ["Laki-laki", "Perempuan"].sample,
    :blood_type => ["A", "B", "AB", "O"].sample,
    :dob =>  Faker::Date.birthday(18, 65),
    :pob => Faker::Address.city_name,
    :disease_type_id => rand(1..10),
    :village_id => 1,
    :inputted_by_id => 2,
    :validated_by_id => 1,
    :status => "accepted",
    :created_at => Date.today
  )
end

# TotalResident.create!(total: 560, village_id: 1)
# TotalResident.create!(total: 710, village_id: 2)


Privilege.create!(name: "Admin Desa", su_only: true)
Privilege.create!(name: "Validator Campaign")
Privilege.create!(name: "Inputter Campaign")
Privilege.create!(name: "Creator Artikel Edukasi", su_only: true)
