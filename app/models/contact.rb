class Contact < ActiveRecord::Base
	attr_accessible :content
	
	belongs_to :user
	
	#validates :content, :presence => true
end
