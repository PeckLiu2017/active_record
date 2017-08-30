class Book < ApplicationRecord
  belongs_to :author
  # belongs_to :writer, class_name: 'Author', foreign_key: 'author_id'

  # a = Author.first
  # b = a.books.first
  # a.first_name == b.writer.first_name # => true
  # a.first_name = 'David'
  # a.first_name == b.writer.first_name # => false

end
