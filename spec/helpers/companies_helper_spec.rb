require 'rails_helper'

RSpec.describe CompaniesHelper, type: :helper do
  describe '#formatted_company_name' do
    it 'formats the company name with employee count' do
      company = Company.new(name: "Tech Corp", employee_count: 10)
      expect(helper.formatted_company_name(company)).to eq("Tech Corp (10 employees)")
    end
  end
end
