class Post < ActiveRecord::Base
    validates :title, presence: true
    validates :content, length: { minimum: 250 }
    validates :summary, length: { maximum: 250 }
    validates :category, inclusion: { in: ["Fiction", "Non-Fiction"] }

    validate :title_is_clickbaity

    def title_is_clickbaity
        unless title.present? and title.match(/Won\'t Believe|Guess|Secret|Top [0-100]/)
            errors.add(:title, "isn't clickbaity enough")
        end
    end
end
