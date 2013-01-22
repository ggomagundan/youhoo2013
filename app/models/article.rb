class Article < ActiveRecord::Base
  belongs_to :user
  has_many :picture
  attr_accessible :content, :photo_id, :popularity, :title, :user_id
end
