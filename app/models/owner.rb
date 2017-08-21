class Owner < ApplicationRecord
  has_and_belongs_to_many :repos

  validates_uniqueness_of :name
end
