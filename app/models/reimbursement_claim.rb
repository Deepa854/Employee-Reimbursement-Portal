class ReimbursementClaim < ApplicationRecord
  belongs_to :employee
  validates :purpose, :amount, :date_of_expenditure, presence: true
  validates :amount, numericality: { greater_than_or_equal_to: 0 }
end
