class Image < ActiveRecord::Base
  extend FriendlyId
  friendly_id :position
  belongs_to :project
  acts_as_list :scope => :project
  validates_attachment_presence :file
  has_attached_file :file,
                    :styles => { :default => "720x576>", :thumb => "223x223>" },
                    :default_style => :default,
                    :storage => :s3, 
                    :s3_credentials => "#{Rails.root}/config/s3.yml",
                    #:s3_host_alias => "images.drudonovan.com",
                    #:url => ":s3_alias_url",
                    :path => "projects/:project_id/:basename/:basename-:style.:extension"
end