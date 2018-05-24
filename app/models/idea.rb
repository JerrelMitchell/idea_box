class Idea < ApplicationRecord
  validates_presence_of :title
  validates_presence_of :content

  belongs_to :user
  belongs_to :category, optional: true
end
