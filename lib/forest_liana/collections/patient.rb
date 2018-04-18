class Forest::Campaign
    include ForestLiana::Collection
  
    collection :Patient
  
    action 'Tambah Donasi', type: 'single', fields: [{
      field: 'Jumlah',
      isRequired: true,
      description: 'Jumlah donasi yang ditambahkan.',
      type: 'Number'
    }]
  end