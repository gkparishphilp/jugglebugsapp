class ContactMailerPreview < ActionMailer::Preview
  def new_contact
    SwellMedia::ContactMailer.new_contact( SwellMedia::Contact.first )
  end
end