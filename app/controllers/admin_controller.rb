class AdminController < SwellMedia::AdminController

	before_filter :authenticate_user!

	def index
		authorize!( :admin, SwellMedia::Article )
		@articles = SwellMedia::Article.order( publish_at: :desc ).limit( 10 )
		@pages = SwellMedia::Page.order( publish_at: :desc ).limit( 10 )
		@contacts = SwellMedia::Contact.order( created_at: :desc ).limit( 10 )
	end

	
end