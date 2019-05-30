class Hsttra < ApplicationRecord
    default_scope {
        where(datkb: "1").where("endkb in (?)",["0","9"]).where(outsoukb: "0").where("istsu > movsu")
     }
end
