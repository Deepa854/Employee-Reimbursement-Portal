class Employee < ApplicationRecord
  belongs_to :company
  has_many :reimbursement_claims, dependent: :destroy
  validates :name, :position, presence: true
end
