class Message < ActiveRecord::Base
  has_many :categorizations
  has_many :categories, :through => :categorizations
  
  validates_presence_of :content, :on => :create, :message => "can't be blank"
  
  before_save :categorize
  
  cattr_reader :per_page
  @@per_page = 10
  
  
  # method will find matches to categoris in content and create categorizations
  def categorize
    logger.info "in method categorize"
    Category.find(:all).each do |c|
      logger.info "#{c.name} is the category being tested"
      if self.content.match(/\-#{c.flag}/) || self.content.match(/\-\-#{c.name}/)
        self.categorizations.build( :message_id => self.id, :category_id => c.id )
        logger.info "created categorization"
      end
    end
    logger.info "done testing categories"
  end
  
end
