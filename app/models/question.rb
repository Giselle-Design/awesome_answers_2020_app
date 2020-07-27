class Question < ApplicationRecord

    has_many(:answers, dependent: :destroy)
    belongs_to :user
    
    validates(:title, presence: true, uniqueness: true)
    validates(
        :body,
        presence: { message:"You have to provide body"},
        length: { minimum: 10 }
        )

    scope(:recent, -> { order(created_at: :DESC).limit(10) })
    scope(:search, -> (query) { where("title ILIKE ? OR body ILIKE ?", "%#{query}%", "%#{query}%") })
end
