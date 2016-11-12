class Import < ApplicationRecord
  has_many :contacts, dependent: :destroy
  has_many :null_contacts, dependent: :destroy


  mount_uploader :file, FileUploader
  validates_processing_of :file
  validates :file, presence: true

end
