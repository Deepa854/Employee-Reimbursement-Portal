# spec/helpers/reimbursement_claims_helper_spec.rb
require 'rails_helper'

RSpec.describe ReimbursementClaimsHelper, type: :helper do
  describe '#format_amount' do
    it 'formats the amount as currency' do
      expect(helper.format_amount(100)).to eq("$100.00")
    end
  end
end
