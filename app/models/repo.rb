# Basic data model which represents a GitHub repo
class Repo < ApplicationRecord
  has_and_belongs_to_many :owners

  validates_uniqueness_of :name
  validates_format_of :name, with: /\A[a-zA-Z0-9_-]+\Z/
end
