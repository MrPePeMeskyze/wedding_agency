class Services < ActiveRecord::Base

	validates :header, presence: true, uniqueness: true
	validates :title, presence: true, uniqueness: true
	validates :permalink, uniqueness: true
	validates :image, presence: true

	belongs_to :user, class_name: "Users", foreign_key: "user_id"

end
