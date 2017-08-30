class Book < ApplicationRecord
  belongs_to :author
  # belongs_to :author, touch: :books_updated_at
  # belongs_to :writer, class_name: 'Author', foreign_key: 'author_id' # 配合inverse使用
  # belongs_to :author, -> { where active: true }, dependent: :destroy
  has_many :line_items
  # a = Author.first
  # b = a.books.first
  # a.first_name == b.writer.first_name # => true
  # a.first_name = 'David'
  # a.first_name == b.writer.first_name # => false

end
