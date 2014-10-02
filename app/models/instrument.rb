class Instrument < ActiveRecord::Base
  include RetryMethods

  validates :reference, presence: true, uniqueness: true
  validates :description, presence: true
end
