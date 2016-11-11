class Import < ApplicationRecord
  mount_uploader :file, FileUploader

  validates_processing_of :file 

end
