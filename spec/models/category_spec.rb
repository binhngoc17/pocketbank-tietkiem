require 'spec_helper'

describe Category do
  it "Create a category" do
    Category.create!(name: "BankLoan")
    Category.find_by_name("BankLoan").name.to_s.should eql "BankLoan"
  end

  it "Create and Delete a category" do
    Category.create!(name: "DeleteCategory")
    Category.find_by_name("DeleteCategory").destroy
    Category.find_by_name("BankLoan").should eql nil
  end

  it "Query to search for the category" do
    Category.create!([{name: "CategoryA"},
                      {name: "CategoryB"},
                      {name: "CategoryC"}])

    names = Category.query('Category%').collect { |x| x.name.to_s }
    names.should eql ['CategoryA', 'CategoryB', 'CategoryC']
  end

end
