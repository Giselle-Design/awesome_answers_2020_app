class Question < ApplicationRecord

    has_many(:answers, dependent: :destroy)
    # has_many(:answers, dependent: :destroy) adds
    # the following instance methods to the Question model:
    # .answers
    # .answers<<(object, ...)
    # .answers.delete(object, ...)
    # .answers.destroy(object, ...)
    # .answers=(object)
    # .answers_singular_ids
    # .answers.singular_ids=(ids)
    # .answers.clear
    # .answers.empty?
    # .answers.size
    # .answers.find(...)
    # .answers.where(...)
    # .answers.exists?(...)
    # .answers.built(attribute = {}, ...)
    # .answers.create(attributes = {}, ...)
    # .answers.create!(attributes = {}, ...)
    # .answers.reload

    validates(:title, presence: true, uniqueness: true)

    validates(
        :body,
        presence: { message:"You have to provide body"},
        length: { minimum: 10 }
        )

    #     before_validation :set_default_view_count
    #     validate :no_apple

    # private

    # def no_apple
    #     # &. is the safe navigation operator. It's used
    #     # like the . operator to call methods on an object.
    #     # If the method doesn't exist for the object, 'nil'
    #     # will be returned instead of getting error
    #     if body&.downcase&.include?('apple')
    #         # To make a record invalid. You must add a
    #         # validation error using the 'errors' 'add' method
    #         # It's arguments (in order):
    #         #  - A symbol for the invalid column
    #         #  - An error message as a string
    #         self.errors.add(:body, "must not have apples")
    #     end
    # end

    # def set_default_view_count
    #     # If you are writing to an attribute accessor, you
    #     # must prefix with 'self'. Which you don't need to do
    #     # if you are reading it instead
    #     self.view_count ||= 0
    # end




      # Create a scope with a class method
    # https://guides.rubyonrails.org/active_record_querying.html#scopes

    # def self.recent
    #     order(created_at: :DESC).limit(10)
    # end

    # Scopes are commonly used feature of rails, that
    # there's another way to create them quicker. It
    # takes a name and a lambda as a callback
    scope(:recent, -> { order(created_at: :DESC).limit(10) })

   # def self.search(query)
    #     where("title ILIKE ? OR body ILIKE ?", "%#{query}%", "%#{query}%")
    # end
    # Equivalent to:
    scope(:search, -> (query) { where("title ILIKE ? OR body ILIKE ?", "%#{query}%", "%#{query}%") })
end
