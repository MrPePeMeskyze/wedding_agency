class Reviews < ActiveRecord::Base

	validates :fio, presence: true
	validates :body, presence: true

	mount_uploader :avatar, AvatarUploader

	belongs_to :session, class_name: "Sessions", foreign_key: "session_id"

end
