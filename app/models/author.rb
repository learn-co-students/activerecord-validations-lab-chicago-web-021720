class Author < ActiveRecord::Base
  validates_presence_of :name
  validates_uniqueness_of :name
  validates :phone_number, length: {minimum: 10}
end
