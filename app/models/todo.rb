class Todo < ApplicationRecord
  belongs_to :project

  validates :text, presence: { message: 'Text is a required field' }
  validates :is_completed, inclusion: { in: [ true, false ], message: 'is_completed must be either true or false' }
  validates :project_id, presence: { message: 'Todo  must belong to Project' }
end
