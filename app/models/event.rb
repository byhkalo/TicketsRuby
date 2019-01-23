class EventModelValidator < ActiveModel::Validator
	def validate(record)
		if record.event_date < Date.today
			record.errors.add('Date expired', 'Date can not be in the past')
		end
		if record.price_hight < record.price_low
			record.errors.add('Price error', 'Hight price can''t be lower than price_low')
		end
	end
end


class Event < ApplicationRecord
	validates :artist, presence: true
	validates :price_low, presence: true, numericality: { only_integer: true }
	validates :price_hight, presence: true, numericality: { only_integer: true }
	validates :event_date, presence: true
	has_many :tickets
	validates_with EventModelValidator
end
