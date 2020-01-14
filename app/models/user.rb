class User < ApplicationRecord
  belongs_to :role
  has_many :user_extension_fields

  accepts_nested_attributes_for :user_extension_fields, allow_destroy: true
end
