class Idea < ActiveRecord::Base
#	belongs_to :user

	validates :title, presence: true, uniqueness: {scope: :body, case_sensitive: false}
	validates :body, presence: {message: "must be provided!"}


	before_save :cap_title

	def user_first_name
		user.first_name if user
	end

	private

	def cap_title
		self.title.capitalize!	
	end

end
