class Soumta < ApplicationRecord
    default_scope { 
        where(soukb: '0').where(datkb: "1")
     }
end
