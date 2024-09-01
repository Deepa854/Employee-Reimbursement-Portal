Rails.application.routes.draw do
  devise_for :users
   resources :companies do
    resources :employees do
    resources :reimbursement_claims 
    
    end
  end
 root to: 'companies#index'
end
