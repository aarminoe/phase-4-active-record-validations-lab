class Post < ApplicationRecord
   validates :title, presence: true
   validates :content, length: {minimum: 250}
   validates :summary, length: {maximum: 250}
   validates :category, inclusion: { in: %w(Fiction Non-Fiction)}
   validate :clickbait

   def clickbait
        good_title = [/Won't Believe/, /Top [number]/, /Guess/, /Secret/]   
        if good_title.none? {|t| t.match (title)} 
            errors.add(:title, "nope!")
        end
    end


    # def clickbait
    #     good_title = ["Won't Believe", "Top [number]", "Guess", "Secret"]  
    #     good_title.each do |t|
    #         if !title.include? t
    #             errors.add(:title, "nope!")
    #         end
    #     end
    #     # unless title.include? "Won't Believe", "Top [number]", "Guess", "Secret"
    #     #     errors.add(:title, "nope!")
    #     # end
    # end

end