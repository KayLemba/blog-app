require 'rails_helper'

RSpec.describe Post, type: :model do
  subject do
    user = User.new(name: 'Tom', photo: 'image.png', bio: 'I am programmer', posts_counter: 0)
    Post.new(title: 'Hello world', text: 'Helloworld',
             likes_counter: 0, comments_counter: 0, user: user)
  end

  before { subject.save }

  it 'should check validation' do
    expect(subject).to be_valid
  end

  it 'should have 250 characters' do
    subject.title = 'f' * 300
    expect(subject).to_not be_valid
  end

  it 'should be invalid if comment counter is nil' do
    subject.comments_counter = nil
    expect(subject).to_not be_valid
  end

  it 'should be invalid if like counter is nil' do
    subject.likes_counter = nil
    expect(subject).to_not be_valid
  end

  it 'should return most recent comments' do
    user = User.new(name: 'Tom', photo: 'image.png', bio: 'I am programer', posts_counter: 0)
    comment2 = subject.comments.create!(user: user, text: 'hi')
    comment3 = subject.comments.create!(user: user, text: 'hi')
    comment4 = subject.comments.create!(user: user, text: 'hi')
    comment5 = subject.comments.create!(user: user, text: 'Hi')
    comment6 = subject.comments.create!(user: user, text: 'hi')

    comments = subject.return_five_comments
    expect(comments.length).to eql 5
    expect(comments).to match_array([comment6, comment5, comment4, comment3, comment2])
  end

  it 'should update user post  counter' do
    expect(subject.user.posts_counter).to eql 1
  end
end
