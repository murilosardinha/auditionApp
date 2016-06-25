class CreateProsecutors < ActiveRecord::Migration
  def change
    create_table :prosecutors do |t|
      t.string :name

      t.timestamps
    end
  end
end
