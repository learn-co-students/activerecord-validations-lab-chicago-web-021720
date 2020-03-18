class Author < ActiveRecord::Base
    validates_presence_of :name
    validates_uniqueness_of :name
    validate :ten_digits

    def ten_digits
        if phone_number.gsub(/[^0-9]/, '').length != 10
            errors.add(:phone_number, "must have exactly 10 digits.")
        end
    end

end
