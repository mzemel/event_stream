# Basic data model which represents the owner of a GitHub repo
class Owner < ApplicationRecord
  has_and_belongs_to_many :repos

  validates_uniqueness_of :name
  validates_format_of :name, with: /\A[a-zA-Z0-9_-]+\Z/
end
