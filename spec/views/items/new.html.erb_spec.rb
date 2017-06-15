require 'rails_helper'

RSpec.describe "items/new", type: :view do
  before(:each) do
    assign(:item, Item.new(
      :supplier => "MyString",
      :number => "MyString",
      :description => "MyString",
      :bruto => 1.5,
      :discount => 1.5,
      :netto => 1.5
    ))
  end

  it "renders new item form" do
    render

    assert_select "form[action=?][method=?]", items_path, "post" do

      assert_select "input#item_supplier[name=?]", "item[supplier]"

      assert_select "input#item_number[name=?]", "item[number]"

      assert_select "input#item_description[name=?]", "item[description]"

      assert_select "input#item_bruto[name=?]", "item[bruto]"

      assert_select "input#item_discount[name=?]", "item[discount]"

      assert_select "input#item_netto[name=?]", "item[netto]"
    end
  end
end
