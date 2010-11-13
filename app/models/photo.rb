class Photo < ActiveRecord::Base
  belongs_to :portfolio
  acts_as_list :scope => :portfolio
  validates_attachment_presence :image
  has_attached_file :image,
  									:styles => { :default => "720x576>", :thumb => "223x223>" },
  									:default_style => :default,
  									:storage => :s3, 
      							:s3_credentials => "#{RAILS_ROOT}/config/s3.yml", 
      							:path => "portfolios/:portfolio_id/:basename/:basename-:style.:extension"
end