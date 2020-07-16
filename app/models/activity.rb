class Activity < ApplicationRecord
  has_many :activity_logs
  mount_uploader :image, SimpleUploader
end
