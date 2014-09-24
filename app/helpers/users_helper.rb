module UsersHelper

def check_if_admin
	if current_user
		flash[:notice] = "You are not an admin user." unless current_user.is_admin?
	else 
		flash[:notice] = "Please sign in."
	end
end

end