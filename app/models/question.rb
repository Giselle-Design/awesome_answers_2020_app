class Question < ApplicationRecord

    validates(:title, presence: true, uniqueness: true)
    
    validates(
        :body, 
        presence: { message:"You have to provide body"}, 
        length: { minimum: 10 }
        )
end
