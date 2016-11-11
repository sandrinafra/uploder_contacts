class Import < ApplicationRecord
  has_many :contacts

  mount_uploader :file, FileUploader
  validates_processing_of :file

end
