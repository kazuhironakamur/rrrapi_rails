class Itemstatusmta < Clsmta
    self.table_name = 'CLSMTA'
    belongs_to :hinmta, primary_key: 'hinclbid', foreign_key: 'clsid'
    default_scope { where(clskb: '4').where(datkb: '1') }
end