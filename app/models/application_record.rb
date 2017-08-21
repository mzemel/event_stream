# Abstract class for ActiveRecord descendants
class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
end
