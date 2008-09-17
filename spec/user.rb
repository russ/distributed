class User < ActiveRecord::Base
	include Distributed::Distributable
end

class UserObserver < ActiveRecord::Observer
	def before_save(user)
		if user.name == 'Administrator'
			user.is_admin = true
		end
	end
end
