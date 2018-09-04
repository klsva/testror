require 'rails_helper'

RSpec.describe "values/new", type: :view do
  before(:each) do
    assign(:value, Value.new(
      :user_id => 1,
      :photo_id => 1,
      :value => 1
    ))
  end

  it "renders new value form" do
    render

    assert_select "form[action=?][method=?]", values_path, "post" do

      assert_select "input#value_user_id[name=?]", "value[user_id]"

      assert_select "input#value_photo_id[name=?]", "value[photo_id]"

      assert_select "input#value_value[name=?]", "value[value]"
    end
  end
end
