class Post < ActiveRecord::Base
    validates :title, presence: true
    validates :content, length: { minimum: 250 }
    validates :summary, length: { maximum: 250 }
    validates :category, inclusion: { in: %w(Fiction Non-Fiction) }
    validate :clickbait_title

    def clickbait_title
        clickbaits = ["Won't Believe", "Secret", "Top", "Guess"]
        check = clickbaits.any? do |bait|
            if title
                title.include?(bait)
            end
        end

        if !check
           errors.add(:title, "must include at least one of #{clickbaits}") 
        end
    end
end
