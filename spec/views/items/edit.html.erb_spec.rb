require 'rails_helper'

RSpec.describe "items/edit", type: :view do
  before(:each) do
    @item = assign(:item, Item.create!(
      :supplier => "MyString",
      :number => "MyString",
      :description => "MyString",
      :bruto => 1.5,
      :discount => 1.5,
      :netto => 1.5
    ))
  end

  it "renders the edit item form" do
    render

    assert_select "form[action=?][method=?]", item_path(@item), "post" do

      assert_select "input#item_supplier[name=?]", "item[supplier]"

      assert_select "input#item_number[name=?]", "item[number]"

      assert_select "input#item_description[name=?]", "item[description]"

      assert_select "input#item_bruto[name=?]", "item[bruto]"

      assert_select "input#item_discount[name=?]", "item[discount]"

      assert_select "input#item_netto[name=?]", "item[netto]"
    end
  end
end
