class Odntra < ApplicationRecord
    default_scope { 
        where("olnendkb in (?)",["0","9"]).where(soukb: '0').where(datkb: "1")
     }
end
