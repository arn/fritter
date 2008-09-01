class Category < ActiveRecord::Base
  has_many :categorizations
  has_many :messages, :through => :categorizations
  
  validates_presence_of :flag, :on => :create, :message => "can't be blank"
  validates_presence_of :name, :on => :create, :message => "can't be blank"
  validates_uniqueness_of :flag, :on => :create, :message => "must be unique"
  validates_uniqueness_of :name, :on => :create, :message => "must be unique"
end
