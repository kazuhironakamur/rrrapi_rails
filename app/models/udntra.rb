class Udntra < ApplicationRecord
    default_scope { where(datkb: '1') }
end
