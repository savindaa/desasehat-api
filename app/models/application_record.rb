class ApplicationRecord < ActiveRecord::Base

  self.abstract_class = true

  # email regular expresion
  EMAIL_REGEX = /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i

  def created_at
    self[:created_at].strftime "%d-%m-%Y"
  end

  def updated_at
    self[:created_at].strftime "%d-%m-%Y %H:%M:%S"
  end

end
