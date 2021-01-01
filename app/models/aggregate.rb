class Aggregate < ApplicationRecord
  has_many :accounting_lines, inverse_of: :aggregate
end
