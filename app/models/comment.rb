class Comment < ActiveRecord::Base
	self.belongs_to(:user)
	self.belongs_to(:article)
	self.has_many(:subcomments)
end