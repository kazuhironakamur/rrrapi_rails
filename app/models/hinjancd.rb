class Hinjancd < ApplicationRecord
    belongs_to :hinmta, primary_key: 'hincd', foreign_key: 'hincd'
    default_scope { where(datkb: '1') }
end
