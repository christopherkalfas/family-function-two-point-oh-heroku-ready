class CreateHouseHolds < ActiveRecord::Migration[5.2]
  def change
    create_table :house_holds do |t|
      t.string :name
      t.references :member, foreign_key: true
      t.references :chore, foreign_key: true

      t.timestamps
    end
  end
end
