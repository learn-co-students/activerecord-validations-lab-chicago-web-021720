class Post < ActiveRecord::Base
    validates :title, presence: true 
    validates :content, length: { minimum: 250 }
    validates :summary, length: { maximum: 250 }
   
    validates :category, inclusion: { in: %w(Fiction Nonfiction),
    message: "%{value} is not a valid category of Fiction or Nonfiction" }
   
    validate :post_is_invalid_if_not_clickbait

    def post_is_invalid_if_not_clickbait
        unless title.present? and title.match(/Won\'t Believe|Guess|Secret|Top [0-100]/)
            errors.add(:title, "isn't clickbaity enough")
        end
    end

end
# title.scan(/Won't Believe/, )
# ["Won't Believe", "Secret", "Top /\d/", "Guess"]




# Finally, add a custom validator to Post that ensures the 
# title is sufficiently clickbait-y. If the title does not 
# contain "Won't Believe", "Secret", "Top [number]", or 
# "Guess", the validator should add a validation.

# t.string   "title"
# t.text     "content"
# t.text     "summary"
# t.string   "category"
# t.datetime "created_at", null: false
# t.datetime "updated_at", null: false