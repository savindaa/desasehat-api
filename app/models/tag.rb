class Tag < ApplicationRecord

  has_and_belongs_to_many :articles

  def attributes
    {
      id: id,
      name: name
    }
  end

end
