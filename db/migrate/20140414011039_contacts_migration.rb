class ContactsMigration < ActiveRecord::Migration
	create_table :contacts do |t|
		t.string		:email
		t.string		:subject
		t.text			:message
		t.string		:ip
		t.string		:contact_type
		t.string		:http_referrer
		t.string		:status, 		default: :active 
		t.timestamps
	end
	add_index :contacts, :email
end
