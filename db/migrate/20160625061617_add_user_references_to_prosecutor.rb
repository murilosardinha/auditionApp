class AddUserReferencesToProsecutor < ActiveRecord::Migration
  def change
    add_reference :prosecutors, :user, index: true
  end
end
