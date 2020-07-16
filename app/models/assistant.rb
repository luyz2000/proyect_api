class Assistant < ApplicationRecord
  has_many :activity_logs
  mount_uploader :image, SimpleUploader
end
