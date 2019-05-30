class Ksnmta < ApplicationRecord
    default_scope { 
        where(datkb: '1')
    }
end
