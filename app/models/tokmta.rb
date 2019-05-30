class Tokmta < ApplicationRecord
    belongs_to :ksnmta, primary_key: 'mancd', foreign_key: 'mancd'
    belongs_to :nhsmta, primary_key: 'nhstokcd', foreign_key: 'tokcd'
    default_scope { where(datkb: '1') }
    scope :list, -> { select('tokmta.tokcd, tokmta.toknm, tokmta.toknk, tokmta.tokada, tokmta.tokadb, tokmta.tokadc, tokmta.toktl, tokmta.tokfx').where(datkb: '1') }
end
