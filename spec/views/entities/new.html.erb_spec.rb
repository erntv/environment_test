require 'rails_helper'

RSpec.describe "entities/new", type: :view do
  before(:each) do
    assign(:entity, Entity.new(
      user_id: 1,
      book_id: 1
    ))
  end

  it "renders new entity form" do
    render

    assert_select "form[action=?][method=?]", entities_path, "post" do

      assert_select "input[name=?]", "entity[user_id]"

      assert_select "input[name=?]", "entity[book_id]"
    end
  end
end
