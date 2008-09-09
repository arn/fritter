class Message < ActiveRecord::Base
  belongs_to :user
  has_many :categorizations
  has_many :categories, :through => :categorizations
  
  validates_presence_of :content, :on => :create, :message => "can't be blank"
  
  before_save :categorize

  cattr_reader :per_page
  @@per_page = 10
  
  protected

  def categorize
    self.user.categories.each do |c|
      if self.content.match(/^\s?(\-#{c.flag}|\-\-#{c.name})\b/)
        self.categories << c
      end
    end
  end
  
end
