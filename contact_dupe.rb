# Question: Given a list of Contacts where each contact has a contact ID and a list of email IDs, output a unique list of contacts by removing duplicates (if they share at least one email ID).

# We have to go through all the email addresses at some point so the best we can do will be O(n*k) time

require 'set'

class Contact
	attr_accessor :contact_id, :email_ids
end

def build_contacts()
	contacts = []
	contact = Contact.new();
	contact.contact_id = "a";
	contact.email_ids = ["@uber", "@yahoo", "@brightroll"]
	contacts << contact

	contact = Contact.new()
	contact.contact_id = "c";
	contact.email_ids = ["@facebook", "@twitter", "@yahoo"]
	contacts << contact
	return contacts

	contact = Contact.new()
	contact.contact_id = "b";
	contact.email_ids = ["@brightroll", "@google"]
	contacts << contact
end

def clean_contact_data(contacts)
	email_to_contact_map = {}
	unique_contacts = Set[]
	contacts.each do |contact|
		unique_contact = true
		dupe_match = nil
		contact.email_ids.each do |email|
			if email_to_contact_map.key?(email)
				dupe_match = email_to_contact_map[email]
				unique_contact = false
				break	
			end
			email_to_contact_map[email] = contact
		end
		if unique_contact
			unique_contacts.add(contact)
		else
			unique_contacts.delete(dupe_match)	
			merged_email_ids = dupe_match.email_ids.concat(contact.email_ids).uniq
			dupe_match.email_ids = merged_email_ids
			unique_contacts.add(dupe_match)
		end
	end
	return unique_contacts
end

deduped_contacts = clean_contact_data(build_contacts())
deduped_contacts.each do |contact|
	p contact.contact_id
	p contact.email_ids
end
