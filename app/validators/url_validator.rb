class UrlValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    return if value.blank?
    record.errors[attribute] << (options[:message] || "is not a valid url") unless is_url?(value)
  end

  def is_url?(value)
    uri = URI.parse(value)
    uri.kind_of?(URI::HTTP)
  rescue URI::InvalidURIError
    false
  end
end