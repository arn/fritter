class Message < ActiveRecord::Base
  has_many :categorizations
  has_many :categories, :through => :categorizations
  
  validates_presence_of :content, :on => :create, :message => "can't be blank"
  
  before_save :categorize
  
  cattr_reader :per_page
  @@per_page = 10
  
  
  # method will find matches to categoris in content and create categorizations
  def categorize
    puts 'something'
  end
  
end
