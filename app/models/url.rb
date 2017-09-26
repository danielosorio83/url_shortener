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

  def self.search(params)
    url = new(params)
    url.send(:sanitize_url)
    find_or_create_by(original_url: url.original_url)
  end

  private

  def sanitize_url
    return unless self.original_url
    sanitize_url = self.original_url.strip
    sanitize_url = sanitize_url.downcase.gsub(/(https?:\/\/)|(www\.)/, '')
    sanitize_url.slice!(-1) if sanitize_url[-1] == '/'
    self.original_url = "http://#{sanitize_url}"
  end
end
