class Post < ApplicationRecord
  validates :title, presence: true 
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  validates :category, inclusion: { in: %w(Fiction Non-Fiction) }
  validate :proper_titles 

  def proper_titles 
    usable_titles = [/Won't Believe/i, /Secret/i, /Top \d/i, /Guess/i]

    unless 
      usable_titles.any? do |t| 
        t.match?(title)
      end 
      errors.add(:title, "Title is not clickbait-y enough")
    end 
  end 
end
