require 'rails_helper'

RSpec.describe "photos/edit", type: :view do
  before(:each) do
    @photo = assign(:photo, Photo.create!(
      :file => "",
      :ave_value => 1.5,
      :album_id => 1
    ))
  end

  it "renders the edit photo form" do
    render

    assert_select "form[action=?][method=?]", photo_path(@photo), "post" do

      assert_select "input#photo_file[name=?]", "photo[file]"

      assert_select "input#photo_ave_value[name=?]", "photo[ave_value]"

      assert_select "input#photo_album_id[name=?]", "photo[album_id]"
    end
  end
end
