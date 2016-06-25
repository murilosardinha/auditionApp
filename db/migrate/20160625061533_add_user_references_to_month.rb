class AddUserReferencesToMonth < ActiveRecord::Migration
  def change
    add_reference :months, :user, index: true
  end
end
