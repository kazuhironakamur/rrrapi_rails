class Zaitra < ApplicationRecord
    scope :import, -> {
        dt = Systba.select('monupddt').last
        where(datkb: '1')
            .where(ukehrdkb: '0')
            .where(Zaitra.arel_table[:dendt].gt(dt.monupddt))
            .where(soukb: '0')
    }
    scope :export, -> {
        dt = Systba.select('monupddt').last
        where(datkb: '1')
            .where(ukehrdkb: '1')
            .where(Zaitra.arel_table[:dendt].gt(dt.monupddt))
            .where(soukb: '0')
    }
end
