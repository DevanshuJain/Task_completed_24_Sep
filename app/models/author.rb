class Author < ActiveRecord::Base
    has_many :books, dependent: :destroy
    belongs_to :book
end
