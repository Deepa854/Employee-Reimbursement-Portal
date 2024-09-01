require 'rails_helper'

RSpec.describe Company, type: :model do
  it 'is valid with valid attributes' do
    company = Company.new(name: "Tech Corp", employee_count: 10, reimbursement_total: 5000.0)
    expect(company).to be_valid
  end

  it 'is not valid without a name' do
    company = Company.new(name: nil, employee_count: 10, reimbursement_total: 5000.0)
    expect(company).not_to be_valid
  end

  it 'is not valid without an employee count' do
    company = Company.new(name: "Tech Corp", employee_count: nil, reimbursement_total: 5000.0)
    expect(company).not_to be_valid
  end

  it 'is not valid with a negative employee count' do
    company = Company.new(name: "Tech Corp", employee_count: -5, reimbursement_total: 5000.0)
    expect(company).not_to be_valid
  end

  it 'is not valid with a non-integer employee count' do
    company = Company.new(name: "Tech Corp", employee_count: 2.5, reimbursement_total: 5000.0)
    expect(company).not_to be_valid
  end
end
