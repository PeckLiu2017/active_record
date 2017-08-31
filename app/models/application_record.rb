class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
  # for validates
  def m
     self.errors.messages
  end

  def v
    self.valid?
  end
end
