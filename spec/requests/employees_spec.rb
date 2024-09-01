require 'rails_helper'

RSpec.describe "Employees", type: :request do
  let!(:company) { Company.create(name: "Tech Corp", employee_count: 10, reimbursement_total: 5000.0) }

  describe "GET /index" do
    it "returns http success" do
      get company_employees_path(company)
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST /create" do
    it "creates a new employee" do
      post company_employees_path(company), params: { employee: { name: "New Employee", position: "Developer" } }
      expect(response).to redirect_to(company_employees_path(company))
      follow_redirect!
      expect(response.body).to include("Employee was successfully created.")
    end
  end

  describe "PATCH /update" do
    let!(:employee) { Employee.create(name: "Old Name", position: "Manager", company: company) }

    it "updates the employee" do
      patch company_employee_path(company, employee), params: { employee: { name: "Updated Name" } }
      expect(response).to redirect_to(company_employee_path(company, employee))
      follow_redirect!
      expect(response.body).to include("Employee was successfully updated.")
    end
  end

  describe "DELETE /destroy" do
    let!(:employee) { Employee.create(name: "Delete Me", position: "Intern", company: company) }

    it "deletes the employee" do
      expect {
        delete company_employee_path(company, employee)
      }.to change(Employee, :count).by(-1)
      expect(response).to redirect_to(company_employees_path(company))
    end
  end
end
