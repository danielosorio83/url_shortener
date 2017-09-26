# == Schema Information
#
# Table name: urls
#
#  id           :integer          not null, primary key
#  code         :string
#  original_url :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Url < ApplicationRecord
  # Validations
  validates :original_url, uniqueness: true, presence: true, url: true

  # Callbacks
  before_create :sanitize_url
  before_validation :generate_code, on: :create

  def self.search(params)
    url = new(params)
    url.send(:sanitize_url)
    find_or_create_by(original_url: url.original_url)
  end

  private

  def generate_code
    self.code = Base64.urlsafe_encode64(Time.now.to_i.to_s)[7...-2] # subs part of the string
  end

  def sanitize_url
    return unless self.original_url
    sanitize_url = self.original_url.strip
    sanitize_url = sanitize_url.downcase.gsub(/(https?:\/\/)|(www\.)/, '')
    sanitize_url.slice!(-1) if sanitize_url[-1] == '/'
    self.original_url = "http://#{sanitize_url}"
  end
end
