class PatientSerializer < ActiveModel::Serializer
  attributes :id, :name, :address, :phone, :gender, :blood_type, :picture, :description, :disease_type, :status

  attribute :date_of_birth do
    object.dob.strftime "%d-%m-%Y"
  end

  attribute :place_of_birth do
    object.pob
  end

  attribute :age do
    ((Time.zone.now - object.dob.to_time) / 1.year.seconds).floor
  end

  attribute :village do
    "Desa #{object.village.name.to_s}"
  end

  attribute :created_by do
    object.user.name
  end

end
