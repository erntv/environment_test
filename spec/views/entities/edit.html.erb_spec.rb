require 'rails_helper'

RSpec.describe "entities/edit", type: :view do
  before(:each) do
    @entity = assign(:entity, Entity.create!(
      user_id: 1,
      book_id: 1
    ))
  end

  it "renders the edit entity form" do
    render

    assert_select "form[action=?][method=?]", entity_path(@entity), "post" do

      assert_select "input[name=?]", "entity[user_id]"

      assert_select "input[name=?]", "entity[book_id]"
    end
  end
end
