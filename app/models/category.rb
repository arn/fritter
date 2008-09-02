class Category < ActiveRecord::Base
  belongs_to :user
  
  has_many :categorizations
  has_many :messages, :through => :categorizations
  
  validates_presence_of :flag, :on => :create, :message => "can't be blank"
  validates_presence_of :name, :on => :create, :message => "can't be blank"
  
  # Uniqueness constraints only make sense per-user - until I figure out how to do this, these are disabled
  # validates_uniqueness_of :flag, :on => :create, :message => "must be unique"
  # validates_uniqueness_of :name, :on => :create, :message => "must be unique"
end
