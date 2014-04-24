class PorterController < ApplicationController

	respond_to :csv

	def export_media
		export = CSV.generate do |csv|
			csv << SwellMedia::Media.column_names
			SwellMedia::Media.all.each do |media|
				csv << media.attributes.values_at( *SwellMedia::Media.column_names )
			end
		end

		send_data export, filename: "#{ENV['APP_NAME']}_media_export.csv"
	end

	def import_media
		if count = Importer.import_media( params[:file], current_user )
			set_flash "#{count} media imported"
			redirect_to :back
		else
			set_flash 'Could Not Import.', :error
			redirect_to :back
		end
	end



	def export_contacts
		export = CSV.generate do |csv|
			csv << Contact.column_names
			Contact.all.each do |contact|
				csv << contact.attributes.values_at( *Contact.column_names )
			end
		end

		send_data export, filename: "#{ENV['APP_NAME']}_contacts_export.csv"
	end

	def import_contacts
		if count = Importer.import_contacts( params[:file], current_user )
			set_flash "#{count} contacts imported"
			redirect_to :back
		else
			set_flash 'Could Not Import.', :error
			redirect_to :back
		end
	end

end