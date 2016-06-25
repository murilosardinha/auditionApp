class CreateAuditions < ActiveRecord::Migration
  def change
    create_table :auditions do |t|
      t.string :courte
      t.string :turn
      t.date :date
      t.references :prosecutor, index: true
      t.references :month, index: true

      t.timestamps
    end
  end
end
