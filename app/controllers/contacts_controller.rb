class ContactsController < ApplicationController

	before_filter :authenticate_user!, only: [ :admin, :edit, :update, :destroy ]

	
	def admin
		authorize! :admin, Contact
		@contacts = Contact.order( 'created_at desc' )

		render layout: 'admin'
	end


	def create
		@contact = Contact.new( contact_params )

		if @contact.save
			set_flash 'Thanks for your message!'
			redirect_to root_path
		else
			set_flash 'There was a problem with your message', :danger, @contact
			render :new
		end
	end


	def new
		@contact = Contact.new	
	end


	private

		def contact_params
			params.require( :contact ).permit( :email, :subject, :message )
		end

end