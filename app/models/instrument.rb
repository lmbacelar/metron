class Instrument < ActiveRecord::Base
  include RetryMethods

  validates :reference, presence: true
  validates :description, presence: true
end
