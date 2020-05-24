
class Me < ActiveRecord::Base
	validates :email, format: { with: URI::MailTo::EMAIL_REGEXP } 
end
