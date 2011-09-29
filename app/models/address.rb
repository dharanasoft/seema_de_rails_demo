class Address < ActiveRecord::Base
  validates_presence_of :name,:phone,:email,:customer_type
  validates_numericality_of :phone 
  validates_format_of :email, :with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i

end
