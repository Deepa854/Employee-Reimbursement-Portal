module CompaniesHelper
    def formatted_company_name(company)
        "#{company.name} (#{company.employee_count} employees)"
      end
end
