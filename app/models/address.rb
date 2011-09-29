class Address < ActiveRecord::Base
  validates_numericality_of :phone 
  validates_format_of :email, :with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i
end
