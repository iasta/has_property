class User < ActiveRecord::Base
  has_property :email, :as => :email_address
  validates_presence_of :email

  has_property :username, :as => :username
  validates_presence_of :username
  validates_uniqueness_of :username
end

