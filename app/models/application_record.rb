class ApplicationRecord < ActiveRecord::Base

  self.abstract_class = true

  # email regular expresion
  EMAIL_REGEX = /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i

end
