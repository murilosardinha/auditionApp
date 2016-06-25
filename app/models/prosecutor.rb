class Prosecutor < ActiveRecord::Base
  belongs_to :user
  has_many :auditions
end
