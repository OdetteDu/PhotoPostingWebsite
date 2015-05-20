class Tag < ActiveRecord::Base
	belongs_to :user
	belongs_to :photo

	validates :left, presence: true
	validates :top, presence: true
	validates :width, presence: true
	validates :height, presence: true

	def validate_width
		if width == 0 then
			errors.add(:width, "must be greater than 0")
		end
	end

	def validate_height
		if height == 0 then
			errors.add(:height, "must be greater than 0")
		end
	end

	validate :validate_width
	validate :validate_height
end
