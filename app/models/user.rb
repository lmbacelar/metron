class User < ActiveRecord::Base
  include RetryMethods

  authenticates_with_sorcery!
  
  validates :name,  presence: true
  validates :email, presence: true, uniqueness: true
  validates :password, confirmation: true, length: { minimum: 3 }
  validates :password_confirmation, presence: true
end
