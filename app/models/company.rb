class Company < ApplicationRecord
    has_many :employees, dependent: :destroy
    has_many :reimbursement_claims, through: :employees
  
    validates :name, presence: true
    validates :employee_count, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  
end
