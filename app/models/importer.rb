
class Importer

	def self.import_contacts( file, user )
		count = 0
		CSV.foreach( file.path, headers: true ) do |row|
			contact = SwellMedia::Contact.new
			contact.attributes = row.to_hash.except( 'id' )
			count = count + 1 if contact.save
		end

		return count
	end

	def self.import_media( file, user )
		count = 0
		CSV.foreach( file.path, headers: true ) do |row|
			media = SwellMedia::Media.new
			media.attributes = row.to_hash.except( 'id', 'lft', 'rgt' )
			count = count + 1 if media.save
		end

		return count
	end
end