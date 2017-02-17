class Ingredient < ApplicationRecord
  has_many :doses
  validates :name, presence: true, uniqueness: true

  before_destroy :check_for_exist

  private

  def check_for_exist
     if self.doses.any?
      errors[:base] << "cannot be delete"
      raise
      return false
     end
  end
end
