class AdminController < ApplicationController

	before_filter :authenticate_user!

	def index
		authorize!( :admin, SwellMedia::Article )
	end

	
end