require 'swagger_helper'

# rubocop:disable Layout/LineLength
# rubocop:disable Metrics/BlockLength

RSpec.describe 'Posts API' do
  path '/api/comments' do
    post 'Creates a comment' do
      tags 'Comments'
      consumes 'application/json'
      produces 'application/json'
      security [Bearer: {}]
      parameter name: :comment, in: :body, schema: {
        type: :object,
        properties: {
          post_id: { type: :integer },
          text: { type: :string }
        },
        required: %w[post_id text]
      }

      response '201', 'user created' do
        schema type: :object,
               properties: {
                 id: { type: :integer },
                 text: { type: :string },
                 created_at: { type: :string },
                 updated_at: { type: :string },
                 post_id: { type: :integer },
                 author_id: { type: :integer }
               }

        let(:user1) do
          User.create!(name: 'Tim', email: 'tim@example.com', password: '123456', confirmed_at: Time.now, posts_counter: 3,
                       bio: 'I am a full-stack web developer from Germany')
        end
        let(:post1) do
          Post.create!(author: user1, title: 'My first post', text: 'The text in my first post', likes_counter: 0,
                       comments_counter: 0)
        end
        let(:comment) { { post_id: post1.id, text: 'This is the first comment of the post' } }
        run_test!
      end

      response '422', 'invalid request' do
        schema type: :object,
               properties: {
                 success: { type: :boolean },
                 message: {
                   type: :array,
                   items: { type: :string }
                 }
               }

        let(:user1) do
          User.create!(name: 'Tim', email: 'tim@example.com', password: '123456', confirmed_at: Time.now, posts_counter: 3,
                       bio: 'I am a full-stack web developer from Germany')
        end
        let(:post1) do
          Post.create!(author: user1, title: 'My first post', text: 'The text in my first post', likes_counter: 0,
                       comments_counter: 0)
        end
        let(:comment) { { post_id: 100 } }
        run_test!
      end
    end

    get 'Gets comments' do
      tags 'Comments'
      consumes 'application/json'
      produces 'application/json'
      parameter name: :user_post, in: :body, schema: {
        type: :object,
        properties: {
          user_id: { type: :integer },
          post_id: { type: :integer }
        },
        required: %w[user_id post_id]
      }

      response '200', 'comments downloaded' do
        schema type: :array,
               items: {
                 type: :object,
                 properties: {
                   id: { type: :integer },
                   text: { type: :string },
                   created_at: { type: :string },
                   updated_at: { type: :string },
                   post_id: { type: :integer },
                   author_id: { type: :integer }
                 }
               }

        let(:user1) do
          User.create!(name: 'Tim', email: 'tim@example.com', password: '123456', confirmed_at: Time.now, posts_counter: 3,
                       bio: 'I am a full-stack web developer from Germany')
        end
        let(:post1) do
          Post.create!(author: user1, title: 'My first post', text: 'The text in my first post', likes_counter: 0,
                       comments_counter: 0)
          Comment.create!(author: user1, post: post1, text: 'This is the first comment to the post')
          post1
        end
        let(:user_post) { { post_id: post1.id, user_id: user1.id } }
        run_test!
      end

      response '404', 'invalid request' do
        schema type: :object,
               properties: {
                 success: { type: :boolean },
                 message: {
                   type: :array,
                   items: { type: :string }
                 }
               }

        let(:user1) do
          User.create!(name: 'Tim', email: 'tim@example.com', password: '123456', confirmed_at: Time.now, posts_counter: 3,
                       bio: 'I am a full-stack web developer from Germany')
        end
        let(:post1) do
          Post.create!(author: user1, title: 'My first post', text: 'The text in my first post', likes_counter: 0,
                       comments_counter: 0)
        end
        let(:comment1) { Comment.create!(author: user1, post: post1, text: 'This is the first comment to hte post') }
        let(:user_post) { { post_id: 10_000, user_id: 100 } }
        run_test!
      end
    end
  end
end

# rubocop:enable Layout/LineLength
# rubocop:enable Metrics/BlockLength
