class Subcomment < ActiveRecord::Base
	self.belongs_to(:user)
	self.belongs_to(:comment)

	delegate :article, to: :comment 
end