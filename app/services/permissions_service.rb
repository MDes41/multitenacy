class PermissionsService
	def initialize(user, controller, action)
		@user = user || User.new
		@controller = controller
		@action = action
	end

	def allow?
			return true if controller == "stores" && action.in?(%w(index))
			return true if controller == "items" && action.in?(%w(show index))
			return true if controller == "sessions" && action.in?(%w(new create destroy))
		if user.registered?
			return true if controller == "stores" && action.in?(%w(show index))
			return true if controller == "items" && action.in?(%w(show index))
			return true if controller == "sessions" && action.in?(%w(new create destroy))
		end
	end

	private
		attr_reader :user, :controller, :action
end