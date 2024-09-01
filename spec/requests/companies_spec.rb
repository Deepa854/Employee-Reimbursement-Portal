require 'rails_helper'

RSpec.describe "Companies", type: :request do
  let(:user) { User.create!(email: 'test@example.com', password: 'password') } # Create a test user

  before do
    sign_in user # Authenticate the user before running the tests
  end

RSpec.describe "Companies", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get companies_path
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST /create" do
    it "creates a new company" do
      post companies_path, params: { company: { name: "New Company", employee_count: 20, reimbursement_total: 1000.0 } }
      expect(response).to redirect_to(assigns(:company))
      follow_redirect!
      expect(response).to have_http_status(:success)
      expect(response.body).to include("Company was successfully created.")
    end
  end

  describe "PATCH /update" do
    let!(:company) { Company.create(name: "Old Name", employee_count: 15, reimbursement_total: 800.0) }

    it "updates the company" do
      patch company_path(company), params: { company: { name: "Updated Name" } }
      expect(response).to redirect_to(assigns(:company))
      follow_redirect!
      expect(response.body).to include("Company was successfully updated.")
    end
  end

  describe "DELETE /destroy" do
    let!(:company) { Company.create(name: "Delete Me", employee_count: 5, reimbursement_total: 300.0) }

    it "deletes the company" do
      expect {
        delete company_path(company)
      }.to change(Company, :count).by(-1)
      expect(response).to redirect_to(companies_path)
    end
  end
end
