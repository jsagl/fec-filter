class AccountingLine < ApplicationRecord
  belongs_to :aggregate, inverse_of: :accounting_lines
end
