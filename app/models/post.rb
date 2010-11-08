class Post < ActiveRecord::Base
  has_attached_file :image,
  									:styles => { :default => "350x278>", :thumb => "223x223>" },
  									:default_style => :default,
  									:storage => :s3, 
      							:s3_credentials => "#{RAILS_ROOT}/config/s3.yml", 
      							:path => ":class/:id/:basename-:style.:extension"
end
