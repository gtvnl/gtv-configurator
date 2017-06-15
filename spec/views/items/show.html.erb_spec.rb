require 'rails_helper'

RSpec.describe "items/show", type: :view do
  before(:each) do
    @item = assign(:item, Item.create!(
      :supplier => "Supplier",
      :number => "Number",
      :description => "Description",
      :bruto => 2.5,
      :discount => 3.5,
      :netto => 4.5
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Supplier/)
    expect(rendered).to match(/Number/)
    expect(rendered).to match(/Description/)
    expect(rendered).to match(/2.5/)
    expect(rendered).to match(/3.5/)
    expect(rendered).to match(/4.5/)
  end
end
