class Test < ApplicationRecord
  has_and_belongs_to_many :users

  def self.show_by_category(category)
    category = Category.find_by(title: category).id
    Test.where(category_id: category).order('id DESC')
  end
end
