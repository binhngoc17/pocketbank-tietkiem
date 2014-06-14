# require 'test_helper'

class CategoryTest < ActiveSupport::TestCase
  def test_the_truth
    category = Category.new(
        :name => 'TestCategory'
    )
    assert category.invalid?
  end
  def test_the_false
    puts 'Hi'
    assert false
  end
end