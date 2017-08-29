class Comment < ApplicationRecord
  after_create :send_email_to_author, if: :author_wants_emails?,
  unless: Proc.new { |comment| comment.article.ignore_comments? }
  belongs_to :article

  def send_email_to_author
    puts "send_email_to_author"
  end

  def author_wants_emails?
    true
  end

end
