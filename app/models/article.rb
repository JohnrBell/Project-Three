class Article < ActiveRecord::Base
	self.has_many(:comments)
	self.has_many(:subcomments, {through: :comments})
end