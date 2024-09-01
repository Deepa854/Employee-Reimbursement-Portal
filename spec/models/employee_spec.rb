require 'rails_helper'

RSpec.describe Employee, type: :model do
  let(:company) { Company.create(name: "Tech Corp", employee_count: 10, reimbursement_total: 5000.0) }

  it 'is valid with valid attributes' do
    employee = Employee.new(name: "John Doe", position: "Developer", company: company)
    expect(employee).to be_valid
  end

  it 'is not valid without a name' do
    employee = Employee.new(name: nil, position: "Developer", company: company)
    expect(employee).not_to be_valid
  end

  it 'is not valid without a position' do
    employee = Employee.new(name: "John Doe", position: nil, company: company)
    expect(employee).not_to be_valid
  end

  it 'is not valid without a company' do
    employee = Employee.new(name: "John Doe", position: "Developer", company: nil)
    expect(employee).not_to be_valid
  end
end
