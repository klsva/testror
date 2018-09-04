require 'rails_helper'

RSpec.describe "photos/new", type: :view do
  before(:each) do
    assign(:photo, Photo.new(
      :file => "",
      :ave_value => 1.5,
      :album_id => 1
    ))
  end

  it "renders new photo form" do
    render

    assert_select "form[action=?][method=?]", photos_path, "post" do

      assert_select "input#photo_file[name=?]", "photo[file]"

      assert_select "input#photo_ave_value[name=?]", "photo[ave_value]"

      assert_select "input#photo_album_id[name=?]", "photo[album_id]"
    end
  end
end
