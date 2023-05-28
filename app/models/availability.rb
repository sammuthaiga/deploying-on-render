class Availability < ApplicationRecord
  belongs_to :plumber

  validates :plumber, presence: true
  validates :available, inclusion: { in: [true, false] }
  validates :expected_available_date, presence: true, if: :unavailable?

  def unavailable?
    !available
  end
end
