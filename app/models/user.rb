class User < ActiveRecord::Base
  attr_accessible :email, :name, :uid

  include Gravtastic
  has_gravatar

  has_many :feeds

end
