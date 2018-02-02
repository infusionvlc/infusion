# ~/test/models/category_test.rb
require 'test_helper'

class CategoryTest < ActiveSupport::TestCase
    test 'Valid Category' do
      category = Category.new(name: 'CategoryTest')
      assert category.valid?
      puts '\nTest: Category -> Valid Category'
    end
    test 'Invalid without name' do
      category = Category.new()
      refute category.valid?, 'Category is valid without a Name'
      puts '\nTest: Category -> Invalid without name'
    end
end
