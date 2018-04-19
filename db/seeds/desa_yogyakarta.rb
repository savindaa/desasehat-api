provinsi = Province.create(provinsi: "DI Yogyakarta")
kabupaten = provinsi.regencies.create(kabupaten: "Kota Yogyakarta")

kecamatan = kabupaten.subdistricts.create(kecamatan: 'Danurejan')
kecamatan.villages.create(kelurahan: 'Bausasran', kodepos: '55211')
kecamatan.villages.create(kelurahan: 'Tegal Panggung', kodepos: '55212')
kecamatan.villages.create(kelurahan: 'Suryatmajan', kodepos: '55213')

kecamatan = kabupaten.subdistricts.create(kecamatan: 'Kotagede')
kecamatan.villages.create(kelurahan: 'Rejowinangun', kodepos: '55171')
kecamatan.villages.create(kelurahan: 'Prenggan', kodepos: '55172')
kecamatan.villages.create(kelurahan: 'Purbayan', kodepos: '55173')

kecamatan = kabupaten.subdistricts.create(kecamatan: 'Wirobrajan')
kecamatan.villages.create(kelurahan: 'Patangpuluhan', kodepos: '55251')
kecamatan.villages.create(kelurahan: 'Wirobrajan', kodepos: '55252')
kecamatan.villages.create(kelurahan: 'Pakuncen', kodepos: '55253')