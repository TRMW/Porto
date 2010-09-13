class Photo < ActiveRecord::Base
  belongs_to :portfolio	
  has_attached_file :image,
  									:styles => { :medium => "720x576>", :thumb => "200x200>" },
  									:default_style => :default,
  									:storage => :s3, 
      							:s3_credentials => "#{RAILS_ROOT}/config/s3.yml", 
      							:path => "/:style/:filename"
end