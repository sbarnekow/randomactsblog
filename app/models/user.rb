class User < ActiveRecord::Base
	attr_accessor :password
	validates_confirmation_of :password
	before_save :encrypt_password

	validates :email, :presence => true
	validates :password, :presence => true
	validates :password_confirmation, :presence => true

	def encrypt_password
		self.password_salt = BCrypt::Engine.generate_salt
		self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
	end

	def self.authenticate(email, password)
		user = User.where(email: email).first
		if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
			user 
		else
			nil
		end
	end

	def is_admin? 
		self.admin == true
	end


end
