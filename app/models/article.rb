class Article < ActiveRecord::Base
  belongs_to :user
  attr_accessible :content, :photo_id, :popularity, :title, :user_id
end
