Faker::Config.locale = 'id'

5.times { User.create!(phone: Faker::PhoneNumber.phone_number, name: Faker::Name.name, village_id: 319) }

10.times do
article = Article.create!(title: "5 Langkah Mudah Mencegah Demam Berdarah",
  content: "DBD (Demam Berdarah Dengue), atau yang lebih dikenal dengan demam berdarah, disebabkan oleh virus dengue yang dibawa oleh nyamuk\u00A0Aedes aegypti.\u00A0Untuk mencegah demam berdarah, biasanya dilakukan penyemprotan atau fogging untuk mencegah jentik-jentik nyamuk\u00A0Aedes aegypti\u00A0berkembang biak. Namun, pencegahan juga tetap harus\u00A0Anda lakukan sendiri di rumah. Berikut 5 cara mudah yang bisa Anda lakukan untuk mencegah demam berdarah.\r\n1. Bersihkan bak mandi Anda seminggu sekali\r\nAir merupakan tempat berkembang biak nyamuk\u00A0Aedes aegypti\u00A0. Nyamuk betina bertelur pada dinding bak yang terisi air, larva nyamuk kemudian akan mendapat makanan dari mikroorganisme yang hidup di sekitarnya. Selama masa ini, larva nyamuk akan melepaskan kulit pelindung mereka dan berkembang biak hingga mencapai tahap terakhir. Ketika larva nyamuk sudah cukup kuat, selanjutnya larva akan berubah menjadi pupa. Pada tahap pupa, tidak dibutuhkan makanan. Pupa hanya akan mengalami perubahan bentuk hingga akhirnya menjadi nyamuk biasa yang siap terbang.\r\nKeseluruhan siklus ini berlangsung 8 \u2013 10 hari dalam suhu ruang. Membersihkan bak mandi Anda setidaknya satu minggu sekali dapat memutus siklus hidup nyamuk\u00A0Aedes aegypti.\r\n2. Perhatikan perabotan rumah tangga Anda yang menampung air\r\nBaskom berisi air, vas bunga, ember, dan wadah lain yang dapat menampung air berpotensi menjadi tempat nyamuk bersarang. Rajin-rajinlah membersihkan tempat-tempat tersebut setidaknya dua kali seminggu untuk mengurangi risiko munculnya nyamuk pembawa demam berdarah.\r\n3. Gunakan kasa nyamuk\r\nKasa nyamuk berguna untuk mencegah masuknya nyamuk dari luar rumah. Anda bisa memasang kasa nyamuk ini pada pintu dan jendela Anda.\r\n4. Jangan menumpuk atau menggantung baju terlalu lama\r\nSesekali perhatikanlah gantungan baju Anda di balik pintu. Baju kotor yang menumpuk dapat menjadi tempat favorit untuk dihinggapi nyamuk. Memang tumpukan baju kotor bukan tempat nyamuk berkembang biak, tetapi merupakan tempat favorit nyamuk hinggap. Hal ini dikarenakan nyamuk menyukai aroma tubuh manusia. Jika Anda memang harus menyimpan kembali baju yang telah dipakai, letakkan baju pada tempat yang bersih dan tertutup.\r\n5. Gunakan\u00A0lotion\u00A0anti nyamuk atau kelambu\r\nKetika Anda hendak bepergian, jangan lupa gunakan\u00A0lotion\u00A0anti nyamuk terutama pada bagian tubuh yang tidak tertutup oleh pakaian. Namun tidak hanya saat bepergian, Anda tetap harus melindungi diri dari gigitan nyamuk ketika sedang tidur karena nyamuk demam berdarah aktif pada malam hari hingga menjelang subuh.\r\nSelain menggunakan\u00A0lotion\u00A0anti nyamuk, menggunakan kelambu saat tidur juga dapat membantu menghindari gigitan nyamuk dan mencegah demam berdarah.",
  status: "accepted",
  created_by_id: 2)
article.tags << Tag.first
end


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
    :disease_type_id => rand(1..10),
    :village_id => 319,
    :inputted_by_id => 2,
    :validated_by_id => 1,
    :status => "accepted",
  )
end

# TotalResident.create!(total: 560, village_id: 1)
# TotalResident.create!(total: 710, village_id: 2)
