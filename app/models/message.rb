class Message < ActiveRecord::Base
  has_many :categorizations
  has_many :categories, :through => :categorizations
  
  validates_presence_of :content, :on => :create, :message => "can't be blank"
  
  cattr_reader :per_page
  @@per_page = 5
end
