class Post < ActiveRecord::Base
    validates :title, presence: true 
    validates :content, length: { minimum: 250 }
    validates :summary, length: { maximum: 250 }
   
    validates :category, inclusion: { in: %w(Fiction Nonfiction),
    message: "%{value} is not a valid category of Fiction or Nonfiction" }
   
    validate :post_is_invalid_if_not_clickbait

    def post_is_invalid_if_not_clickbait
        unless title.present? && title.match(/Won\'t Believe|Guess|Secret|Top [0-100]/)
            errors.add(:title, "isn't clickbaity enough")
        end
    end

end