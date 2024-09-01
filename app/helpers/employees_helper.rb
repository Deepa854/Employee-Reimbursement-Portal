module EmployeesHelper
    def format_employee_name(employee)
      "#{employee.name} - #{employee.position}"
    end
  end
  