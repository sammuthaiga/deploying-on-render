class Plumber < ApplicationRecord
    validates :name, presence: true
    validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
    validates :phone_number, presence: true
    validates :location, presence: true
    validates :specialization, presence: true
    validates :pricing, presence: true
    validates :start_rating, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 5 }
    # Additional validations can be added for reviews and profile page attributes
  
    # Associations
    has_many :reviews
end
