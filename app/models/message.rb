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
      self.user.categories.find(:all).each do |c|
        if self.content.match(/^\-#{c.flag}\b|\s\-#{c.flag}\b/) || self.content.match(/\W\-\-#{c.name}\b/)
          self.categorizations.build( :message_id => self.id, :category_id => c.id )
        end
      end
    end
  
end
