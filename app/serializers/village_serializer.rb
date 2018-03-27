class VillageSerializer < ActiveModel::Serializer
  attributes :id, :name, :kecamatan, :kabupaten, :provinsi, :description
end
