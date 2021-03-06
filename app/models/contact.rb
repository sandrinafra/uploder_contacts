class Contact < ApplicationRecord
  belongs_to :import

  validate :fullname_validation
  validates :email, presence: true, uniqueness: {
    message: "existe déjà" }
  validates :email, format: { with: /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]{2,}\z/i,
    message: 'mauvais format' }

  private def fullname_validation
    if !(self.firstname && self.lastname) && Contact.where(firstname: self.firstname, lastname: self.lastname).any?
      errors[:fullname] << "existe déjà"
      return false
    end
  end
end
