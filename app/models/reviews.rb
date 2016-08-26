class Reviews < ActiveRecord::Base

	belongs_to :session, class_name: "Sessions", foreign_key: "session_id"

end
