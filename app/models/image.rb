class Image < ActiveRecord::Base
  extend FriendlyId
  friendly_id :position
  belongs_to :project
  validates_attachment_presence :file
  acts_as_list :scope => :project
  has_attached_file :file,
                    :styles => { :default => "720x576>", :thumb => "223x223>" },
                    :default_style => :default,
                    :storage => :s3, 
                    :s3_credentials => "#{Rails.root}/config/s3.yml",
                    :path => "projects/:project_id/:basename/:basename-:style.:extension"
end