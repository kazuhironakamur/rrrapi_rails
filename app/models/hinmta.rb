class Hinmta < ApplicationRecord
    belongs_to :hinjancd, primary_key: 'hincd', foreign_key: 'hincd'
    belongs_to :brandmta, primary_key: 'clsid', foreign_key: 'hinclbid'
    default_scope { where(datkb: '1') }
    scope :list, -> { select('hinmta.hincd, hinmta.hinnma, hinmta.hinstscd, hinmta.prctk, hinmta.hinenma, hinmta.hinrn') }
end
