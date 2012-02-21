class Project < ActiveRecord::Base
  default_scope :order => 'position ASC'
  extend FriendlyId
  friendly_id :title, use: [:slugged, :history]
  validates_presence_of :title, :slug, :images
  has_many :images, :order => 'position ASC', :dependent => :destroy
  accepts_nested_attributes_for :images, :allow_destroy => true
  after_create :set_front_project
  after_save :reset_front_project
  
  scope :visible, where(:visible => true)
  
  def is_front_project
    Settings.front_project == self.id
  end
  
  private
  # if this is the first project, set it to front
  def set_front_project
    if Project.count == 1
      Settings.front_project = self.id
    end
  end
  
  # if the front portfolio was just set to invisible, set the first visible one to front
  def reset_front_project
    if self.is_front_project && !self.visible?
      Settings.front_project = Project.find_by_visible(true).id
    end
  end
end