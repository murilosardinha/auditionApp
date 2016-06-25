class Audition < ActiveRecord::Base
  belongs_to :prosecutor
  belongs_to :month

  delegate :name, to: :prosecutor, prefix: true
  delegate :name, to: :month, prefix: true

  scope :by_date_month, lambda { |date, month| where('date <= ? and extract(month from date) = ?', date, month) }
end
