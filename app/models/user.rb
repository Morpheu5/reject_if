class User < ActiveRecord::Base
	attr_accessible :name, :contacts_attributes
	
	has_many :contacts, :dependent => :destroy
	accepts_nested_attributes_for :contacts,
		:reject_if => proc { |a| a['content'].blank? },
		:allow_destroy => true
	
	validates :name, :presence => true
	
	def self.test
		User.delete_all
		Contact.delete_all
		user = User.create! :name => 'John Doe'
		contact = user.contacts.create! :content => 'This is a contact information'
		user.attributes = { :contacts_attributes => [{ :id => contact.id, :content => '' }] }
		user.save
		user.reload
		puts user.contacts.inspect
	end

	def self.test2
		User.delete_all
		Contact.delete_all
		user = User.create! :name => 'John Doe'
		contact = user.contacts.create! :content => 'This is a contact information'
		user.attributes = { :contacts_attributes => [{ :id => contact.id, :content => 'This is a modified contact information' }] }
		user.save
		user.reload
		puts user.contacts.inspect
	end
end
