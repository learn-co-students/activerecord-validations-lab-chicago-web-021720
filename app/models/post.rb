class Post < ActiveRecord::Base
  validates_presence_of :title
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  validates :category, inclusion: {in: %w(Fiction Non-Fiction), message: "%{value} is not valid category"}
  validate :title_cannot_have_clickbait

def title_cannot_have_clickbait
  s = self.title
  if s
    if !s.include?("Won't Believe")
      self.errors.add(:title, "This is not clickbaity enough")
    end
    end
  end
end

#|| !s.include?(/Secret/i) || !s.include?(/Guess/i) || !s.include?(/Top \d/i))
