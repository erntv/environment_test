require 'rails_helper'

RSpec.describe "entities/index", type: :view do
  before(:each) do
    assign(:entities, [
      Entity.create!(
        user_id: 2,
        book_id: 3
      ),
      Entity.create!(
        user_id: 2,
        book_id: 3
      )
    ])
  end

  it "renders a list of entities" do
    render
    assert_select "tr>td", text: 2.to_s, count: 2
    assert_select "tr>td", text: 3.to_s, count: 2
  end
end
