class Import < ApplicationRecord
  has_many :contacts, dependent: :destroy
  has_many :null_contacts, dependent: :destroy


  mount_uploader :file, FileUploader
  validates :file, presence: true
  validates_processing_of :file

end
