class ReimbursementClaimsController < ApplicationController
    before_action :set_company
    before_action :set_employee
    before_action :set_reimbursement_claim, only: %i[show edit update destroy]
  
    def index
      @reimbursement_claims = @employee.reimbursement_claims
    end
  
    def show
    end
  
    def new
      @reimbursement_claim = @employee.reimbursement_claims.new
    end
  
    def create
      @reimbursement_claim = @employee.reimbursement_claims.new(reimbursement_claim_params)
      if @reimbursement_claim.save
        redirect_to company_employee_reimbursement_claim_path(@company, @employee, @reimbursement_claim), notice: 'Reimbursement claim was successfully created.'
      else
        render :new
      end
    end
  
    def edit
    end
  
    def update
      if @reimbursement_claim.update(reimbursement_claim_params)
        redirect_to company_employee_reimbursement_claim_path(@company, @employee, @reimbursement_claim), notice: 'Reimbursement claim was successfully updated.'
      else
        render :edit
      end
    end
  
    def destroy
      @reimbursement_claim.destroy
      redirect_to company_employee_path(@company, @employee), notice: 'Reimbursement claim was successfully destroyed.'
    end
  
    private
  
    def set_company
      @company = Company.find(params[:company_id])
    end
  
    def set_employee
      @employee = @company.employees.find(params[:employee_id])
    end
  
    def set_reimbursement_claim
      @reimbursement_claim = @employee.reimbursement_claims.find(params[:id])
    end
  
    def reimbursement_claim_params
      params.require(:reimbursement_claim).permit(:purpose, :amount, :date_of_expenditure)
    end
  end
  