require 'rails_helper'

RSpec.describe ReimbursementClaim, type: :model do
  let(:company) { Company.create(name: "Tech Corp", employee_count: 10, reimbursement_total: 5000.0) }
  let(:employee) { Employee.create(name: "John Doe", position: "Developer", company: company) }

  it 'is valid with valid attributes' do
    reimbursement_claim = ReimbursementClaim.new(purpose: "Travel", amount: 150.0, date_of_expenditure: "2024-08-29", employee: employee)
    expect(reimbursement_claim).to be_valid
  end

  it 'is not valid without a purpose' do
    reimbursement_claim = ReimbursementClaim.new(purpose: nil, amount: 150.0, date_of_expenditure: "2024-08-29", employee: employee)
    expect(reimbursement_claim).not_to be_valid
  end

  it 'is not valid without an amount' do
    reimbursement_claim = ReimbursementClaim.new(purpose: "Travel", amount: nil, date_of_expenditure: "2024-08-29", employee: employee)
    expect(reimbursement_claim).not_to be_valid
  end

  it 'is not valid with a negative amount' do
    reimbursement_claim = ReimbursementClaim.new(purpose: "Travel", amount: -150.0, date_of_expenditure: "2024-08-29", employee: employee)
    expect(reimbursement_claim).not_to be_valid
  end

  it 'is not valid without a date of expenditure' do
    reimbursement_claim = ReimbursementClaim.new(purpose: "Travel", amount: 150.0, date_of_expenditure: nil, employee: employee)
    expect(reimbursement_claim).not_to be_valid
  end

  it 'is not valid without an employee' do
    reimbursement_claim = ReimbursementClaim.new(purpose: "Travel", amount: 150.0, date_of_expenditure: "2024-08-29", employee: nil)
    expect(reimbursement_claim).not_to be_valid
  end
end
