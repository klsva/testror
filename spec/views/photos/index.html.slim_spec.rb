require 'rails_helper'

RSpec.describe "photos/index", type: :view do
  before(:each) do
    assign(:photos, [
      Photo.create!(
        :file => "",
        :ave_value => 2.5,
        :album_id => 3
      ),
      Photo.create!(
        :file => "",
        :ave_value => 2.5,
        :album_id => 3
      )
    ])
  end

  it "renders a list of photos" do
    render
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => 2.5.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
  end
end
