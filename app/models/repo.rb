# Basic data model which represents a GitHub repo
class Repo < ApplicationRecord
  has_and_belongs_to_many :owners

  validates_uniqueness_of :name
end
