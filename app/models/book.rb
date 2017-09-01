class Book < ApplicationRecord
  # b.errors.messages => {:name=>["名字不能为空"]}
  validates :title, presence: { present: true, message: '名字不能为空' }
  # b.errors.messages => {:name=>["can't be blank", "名字不能为空"]}
  # validates :name, presence: { message: '名字不能为空' }
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
  def find_associations
    puts self.id if self.author.nil?
  end

  def special?
    true
  end
end
