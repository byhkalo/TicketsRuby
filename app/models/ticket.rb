class Ticket < ApplicationRecord
	validates :name, presence: true, length: { minimum: 6 }
	validates :seat_id_seq, presence: true, length: { in: 2..4 }
	validates :email_address, presence: true
	validates :price, presence: true
	validates :phone, presence: true
end
