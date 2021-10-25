require 'rails_helper'

RSpec.describe "posts/show", type: :view do
  current_user = User.first_or_create!(email: 'dean@example.com', password: 'password', password_confirmation: 'password')

  before(:each) do
    @post = assign(:post, Post.create!(
      title: "Title",
      body: "MyText",
      user: current_user,
      views: 0
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/1/) #what user_id to we expect?
    expect(rendered).to match(/0/)
  end
end

#added current user
#added expected user_id
#changed views to 0 as it is in as default