class BookComment < ApplicationRecord
  
  #user,book model relation
  belongs_to :user
  belongs_to :book
  
end
