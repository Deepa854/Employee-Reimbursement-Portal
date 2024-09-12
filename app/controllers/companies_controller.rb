class CompaniesController < ApplicationController
    before_action :authenticate_user!  # Ensure users are authenticated
    before_action :set_company, only: [:show, :edit, :update, :destroy]
    include ErrorHandling  # Include the concern

    # GET /companies
    def index
      @companies = Company.all
    end
    def new
        @company = Company.new
      end
      def create
        @company = Company.new(company_params)
        
        if @company.save
          redirect_to company_employees_path(@company), notice: 'Company was successfully created.'
        else
          render :new, status: :unprocessable_entity
        end
      end

        def show
         # @company is already set by the before_action :set_company
         @employees = @company.employees
       end
      

    # GET /companies/:id/edit
      def edit
        # @company is set by the before_action :set_company
       end

       # PATCH/PUT /companies/:id
  def update
    if @company.update(company_params)
      redirect_to @company, notice: 'Company was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /companies/:id
  def destroy
    @company.destroy
    respond_to do |format|
      format.html { redirect_to companies_url, notice: 'Company was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_company
    @company = Company.find(params[:id])
  end

def company_params
        params.require(:company).permit(:name, :employee_count, :reimbursement_total)
      end
end
