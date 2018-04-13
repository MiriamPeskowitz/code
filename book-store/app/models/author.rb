class Author < ApplicationRecord
	has_many :books, dependent: :destroy
	before_sace :check_for_duplicates
end
