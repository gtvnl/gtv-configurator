require 'rails_helper'

RSpec.describe "items/index", type: :view do
  before(:each) do
    assign(:items, [
      Item.create!(
        :supplier => "Supplier",
        :number => "Number",
        :description => "Description",
        :bruto => 2.5,
        :discount => 3.5,
        :netto => 4.5
      ),
      Item.create!(
        :supplier => "Supplier",
        :number => "Number",
        :description => "Description",
        :bruto => 2.5,
        :discount => 3.5,
        :netto => 4.5
      )
    ])
  end

  it "renders a list of items" do
    render
    assert_select "tr>td", :text => "Supplier".to_s, :count => 2
    assert_select "tr>td", :text => "Number".to_s, :count => 2
    assert_select "tr>td", :text => "Description".to_s, :count => 2
    assert_select "tr>td", :text => 2.5.to_s, :count => 2
    assert_select "tr>td", :text => 3.5.to_s, :count => 2
    assert_select "tr>td", :text => 4.5.to_s, :count => 2
  end
end
