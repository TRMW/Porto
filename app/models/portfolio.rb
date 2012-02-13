class Portfolio < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title, use: [:slugged, :history]
  validates_presence_of :title, :slug, :photos
  has_many :photos, :order => "position ASC", :dependent => :destroy
  accepts_nested_attributes_for :photos, :allow_destroy => true
  acts_as_list
  after_create :set_front_portfolio
  
  def set_front_portfolio
    # if this is the first portfolio, set it as the front portofolio
    if Portfolio.length == 1
      Settings.front_portfolio = self.id
    end
  end
end