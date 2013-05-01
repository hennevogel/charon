class Feed < ActiveRecord::Base
  attr_accessible :feed_url, :title, :url, :user
 
  belongs_to :user
  has_many :posts
end
