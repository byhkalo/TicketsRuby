# class TicketModelValidator < ActiveModel::Validator
	# def validate(record)
		# event = Event.where(id: record.event_id)
		# if record.event.price_low > record.price 
		# 	record.errors.add('Price Error', 'Price can''t be lower than ')
		# end
		# if record.event.price_hight < record.price
		# 	record.errors.add('Price Error', 'Price can''t be bigger than ')
		# end
# 	end
# end

class Ticket < ApplicationRecord
	validates :name, presence: true, length: { minimum: 6 }
	validates :seat_id_seq, presence: true, length: { in: 2..4 }
	validates :email_address, presence: true
	validates :price, presence: true
	validates :event_id, presence: true
	validates :user_id, presence: true
	belongs_to :event
	belongs_to :user
	# validates_with TicketModelValidator
end
