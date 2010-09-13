class Portfolio < ActiveRecord::Base
	has_many :photos, :order => "position ASC"
end
