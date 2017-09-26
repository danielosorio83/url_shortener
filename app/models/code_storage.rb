class CodeStorage < ApplicationRecord
  # Callbacks
  before_validation :update_code, on: [:create, :update]

  def self.next_code
    storage = lock(true).first_or_initialize
    storage.with_lock { storage.save! }
    storage.code
  end

  private

  def update_code
    self.code = random_code
  end

  def random_code
    Base64.urlsafe_encode64(Time.now.to_i.to_s)[7...-2] # subs part of the string
  end
end
