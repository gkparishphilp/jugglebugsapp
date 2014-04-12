class Ability

	# Used by CanCan to define abilities and access priveledges

	# godmin -- generic super-admin
	# admin -- owner / manager 
	
	include CanCan::Ability

	def initialize( user )
		user ||= User.new
		if user.has_role?( :godmin )
			can :manage, :all
		end

	end
end