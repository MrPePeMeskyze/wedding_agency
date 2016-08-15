class Portfolios < ActiveRecord::Base

	validates :permalink, presence: true, uniqueness: true
	validates :name, presence: true

end
