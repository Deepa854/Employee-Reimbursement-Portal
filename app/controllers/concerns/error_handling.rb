# app/controllers/concerns/error_handling.rb
module ErrorHandling
    extend ActiveSupport::Concern
  
    included do
      rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
    end
  
    private
  
    def record_not_found
      flash[:alert] = "Record not found."
      redirect_to root_path
    end
  end
  