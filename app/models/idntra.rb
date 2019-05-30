class Idntra < ApplicationRecord
    default_scope { 
        where("ilnendkb in (?)",["0","9"]).where(soukb: '0').where(datkb: "1")
     }
end
