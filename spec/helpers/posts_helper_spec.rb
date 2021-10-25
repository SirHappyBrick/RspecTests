require 'rails_helper'
include PostsHelper

RSpec.describe PostsHelper, type: :helper do
  it 'assigns a user to a post' do
    #AAA - arange, act, assert
    #Arraging
    creator = User.first_or_create!(email: 'dean@example.com', password: 'password', password_confirmation: 'password')
    @post = Post.new(title: 'MyString', body: 'MyText', views: 1)

    #Acting
    returned_post = assign_post_creator(@post, creator)

    #Asserting
    expect(returned_post.user).to be(creator)
  end
end
