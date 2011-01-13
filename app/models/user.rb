class User < ActiveRecord::Base
	attr_accessible :name, :contacts_attributes
	
	has_many :contacts, :dependent => :destroy
	accepts_nested_attributes_for :contacts,
		:reject_if => proc { |a| a['content'].blank? },
		:allow_destroy => true
	
	validates :name, :presence => true
end
