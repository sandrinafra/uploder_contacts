class Import < ApplicationRecord
  has_many :contacts
  has_many :null_contacts

  mount_uploader :file, FileUploader
  validates_processing_of :file

end
