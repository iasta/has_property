class Contact < ActiveRecord::Base
  has_property :email, :as => :email_address
  validates_presence_of :email
  validates_uniqueness_of :email
end

