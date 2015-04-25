class EmailValidator < ActiveRecord::EachValidator
  def validate_each(record, attribute, value)
    puts options.keys
  end
end
