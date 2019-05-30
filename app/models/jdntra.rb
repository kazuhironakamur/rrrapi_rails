class Jdntra < ApplicationRecord
    default_scope { 
        where(datkb: "1")
    }

    scope :backlog, -> {
        where(jlnendkb: '0').or(Jdntra.where(jlnendkb: '7')).or(Jdntra.where(jlnendkb: '9'))
        .where(dkbctlkb: '1').or(Jdntra.where(dkbctlkb: '5'))
        .where(Jdntra.arel_table[:uodsu].gt(Jdntra.arel_table[:jlnurisu]))
    }
end