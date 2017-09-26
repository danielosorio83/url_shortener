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
end
