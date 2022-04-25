require 'test_helper'

class CategoryTest < ActiveSupport::TestCase
  test 'should not save a Category without a title' do
  category = Category.new
  category.description = "Walakong title"
  assert_not category.save, "Saved the category without title"
end
end