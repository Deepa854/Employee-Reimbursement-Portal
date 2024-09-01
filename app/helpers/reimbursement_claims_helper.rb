module ReimbursementClaimsHelper
    def format_amount(amount)
        number_to_currency(amount)
      end
end
