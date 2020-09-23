class Book < ActiveRecord::Base
    has_many :author, dependent: :destroy
    belongs_to :author
end
