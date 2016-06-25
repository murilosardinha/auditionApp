class AddUserReferencesToAudition < ActiveRecord::Migration
  def change
    add_reference :auditions, :user, index: true
  end
end
