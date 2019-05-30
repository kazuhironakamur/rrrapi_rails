class Jdntrb < ApplicationRecord
    default_scope { 
        where("sytendkb in (?)",["0","9"]).where(soukb: '0').where("sytsu > jlnotpsu")
     }
end