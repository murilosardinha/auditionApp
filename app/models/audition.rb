class Audition < ActiveRecord::Base
  belongs_to :prosecutor
  belongs_to :month
  belongs_to :user

  delegate :name, to: :prosecutor, prefix: true
  delegate :name, to: :month, prefix: true

  scope :by_month, lambda { |month| where('extract(month from date) = ?', month) }
end
