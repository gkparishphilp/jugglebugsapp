class AdminMailer < ActionMailer::Base

	def new_contact( contact )
		@contact = contact
		mail to: 'gk@gkparishphilp.com', from: 'avery.parishphilp@gmail.com', subject: 'Juggle Bugs has a new contact!'
	end

end