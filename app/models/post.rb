class Post < ApplicationRecord
    validates :title, presence: true
    validates :content, length: { minimum: 250 }
    validates :summary, length: { maximum: 250 }
    validates :category, inclusion: { in: ["Fiction", "Non-Fiction"]}

    validate :clickbait_title

    def clickbait_title
        unless title.to_s.include? "Won't Believe" || "Secret" || "Top [number]" || "Guess"
            errors.add(:title, "Invalid title, not clickbait-y enough")
        end
    end
end
