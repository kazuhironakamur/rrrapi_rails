class Zaisma < ApplicationRecord
    default_scope { 
        where(soukb: '0')
            .where(SMADT: Systba.select('monupddt'))
     }

end
