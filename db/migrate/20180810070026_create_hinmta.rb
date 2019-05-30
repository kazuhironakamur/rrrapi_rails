class CreateHinmta < ActiveRecord::Migration[5.2]
  def change
    create_table :hinmta do |t|

      t.timestamps
    end
  end
end
