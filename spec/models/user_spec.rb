require 'spec_helper'

describe User do
	describe 'when created' do
		it 'should reject blank contact information' do
			lambda do
				user = User.create! :name => 'Jane Doe', :contacts_attributes => [{:content => ''}]
			end.should_not change(Contact, :count).by(1) 
		end
	end
	
	describe 'when updated' do
		it 'should reject blank contact information' do
			lambda do
				user = User.create! :name => 'Jane Doe', :contacts_attributes => [{:content => 'This is correct'}]
				contact = user.contacts.first
				user.update_attributes :contacts_attributes => [{:id => contact.id, :content => ''}]
				
				# this won't work either
				# user.attributes = { :contacts_attributes => [{:id => contact.id, :content => ''}] }
			end.should_not change(Contact, :count).by(1) 
		end
	end

end