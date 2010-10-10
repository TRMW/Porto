class Portfolio < ActiveRecord::Base
	has_many :photos, :order => "position ASC"
	acts_as_list
	accepts_nested_attributes_for :photos, :allow_destroy => true
end
