class Project < ApplicationRecord
  has_many :todos

  validates :title, presence: { message: 'Title is a required field' }

  def title=(val)
    self[:title] = val&.strip
  end

  def title
    self[:title]
  end
end
