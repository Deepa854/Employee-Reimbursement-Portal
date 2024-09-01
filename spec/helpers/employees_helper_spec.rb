require 'rails_helper'

RSpec.describe EmployeesHelper, type: :helper do
  describe '#format_employee_name' do
    it 'formats the employee name with position' do
      employee = Employee.new(name: "John Doe", position: "Developer")
      expect(helper.format_employee_name(employee)).to eq("John Doe - Developer")
    end
  end
end
