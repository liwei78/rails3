class Pad < ActiveRecord::Base
  acts_as_taggable
  
  belongs_to :user
  belongs_to :category
  has_many :contents
  
end
