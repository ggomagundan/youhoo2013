class Picture < ActiveRecord::Base
  attr_accessible :article_id, :image, :remote_image_url
  belongs_to :article
  mount_uploader :image, ImageUploader
end
