class Post < ActiveRecord::Base

    validates_presence_of :title
    validates :content, length: { minimum: 250 }
    validates :summary, length: { maximum: 250 }
    validates :category, inclusion: {
        in: ["Fiction", "Non-Fiction"],
        message: "%{value} must be Fiction or Non-Fiction"}
    
    validate :clickbaity

    def clickbaity
        if title
            if ![/Won\'t Believe/, /Secret/, /Top [0-9]+/, /Guess/].find { |reg| title.match(reg) }
                errors.add(:title, "is not clickbaity enuf. Try again!")
            end
        end
    end

end