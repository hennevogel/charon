class Post < ActiveRecord::Base
  attr_accessible :guid, :name, :published_at, :summary, :url

  belongs_to :feed
end
