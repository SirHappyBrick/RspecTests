require 'rails_helper'

RSpec.describe Post, type: :model do
  current_user = User.first_or_create!(email: 'dean@example.com', password: 'password', password_confirmation: 'password')
  it 'has a title' do 
    post = Post.new(
      title: '',
      body: 'valid body',
      user: current_user,
      views: 0
    )

    expect(post).to_not be_valid
    post.title = "Has a title"
    expect(post).to be_valid
  end 

  it 'has a body' do 
    post = Post.new(
      title: 'valid title',
      body: '',
      user: current_user,
      views: 0
    )

    expect(post).to_not be_valid
    post.body = "Has a body"
    expect(post).to be_valid
  end

  it 'has a title at least 2 characters long' do 
    post = Post.new(
      title: '',
      body: 'valid body',
      user: current_user,
      views: 0
    )

    expect(post).to_not be_valid
    post.title = '12'
    expect(post).to be_valid
  end 

  it 'has a body between 5 and 100 chars' do #It should be splitted for 2 tests but for sake of learning let's do it this way for now.
    post = Post.new(
      title: 'valid title',
      body: '',
      user: current_user,
      views: 0
    )

    expect(post).to_not be_valid
    post.body = '12345'
    
    hundred_char_string = 'Bv55olhfUuuM4iIEcz8b2rGKxB8NvoONofCCfR2kiimkP17qZ9AmeE7wurUZjfWWf4oupRx0BfzSTbvXamXfQ8OEcswID6qKyUkN'
    post.body = hundred_char_string
    expect(post).to be_valid

    post.body = hundred_char_string + '1'
    expect(post).to_not be_valid
  end 

  it 'has numerical views' do
    post = Post.new(
      title: 'valid title',
      body: 'valid body',
      user: current_user,
      views: 0
    )

    expect(post.views).to be_a(Integer)
  end
end
