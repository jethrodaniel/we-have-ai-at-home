class ApplicationRecord < ActiveRecord::Base
  primary_abstract_class

  # Needed for `.first`/`.last` when models use UUIDs
  self.implicit_order_column = :created_at
end
