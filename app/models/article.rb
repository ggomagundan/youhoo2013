class Article < ActiveRecord::Base
  attr_accessible :content, :photo_id, :popularity, :title, :user_id
end
