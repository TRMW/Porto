class Portfolio < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title, :use => [:slugged, :history]
  validates_presence_of :title, :slug, :photos
  has_many :photos, :order => "position ASC", :dependent => :destroy
  accepts_nested_attributes_for :photos, :allow_destroy => true
  acts_as_list
end