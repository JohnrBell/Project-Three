class User < ActiveRecord::Base
	has_secure_password
	self.has_many(:comments)
	self.has_many(:subcomments)
end