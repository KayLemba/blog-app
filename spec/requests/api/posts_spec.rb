require 'swagger_helper'

# rubocop:disable Metrics/BlockLength
# rubocop:disable Layout/LineLength

RSpec.describe 'Posts API' do
  path '/api/posts' do
    get 'Gets posts' do
      tags 'Posts'
      consumes 'application/json'
      produces 'application/json'
      parameter name: :user, in: :body, schema: {
        type: :object,
        properties: {
          user_id: { type: :integer }
        },
        required: ['user_id']
      }

      response '200', 'posts downloaded' do
        schema type: :array,
               items: {
                 type: :object,
                 properties: {
                   id: { type: :integer },
                   title: { type: :string },
                   text: { type: :string },
                   comments_counter: { type: :integer },
                   likes_counter: { type: :integer },
                   created_at: { type: :string },
                   updated_at: { type: :string },
                   author_id: { type: :integer }
                 }
               }

        let(:user) do
          user = User.create!(id: 3, name: 'Tim', email: 'tim@example.com', password: '1234566',
                              confirmed_at: Time.now, posts_counter: 3, bio: 'I am a full-stack web developer from Germany')
          Post.create!(author: user, title: 'My first post', text: 'The text of my post', likes_counter: 0,
                       comments_counter: 0)
          { user_id: user.id }
        end
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

        let(:user) { { user_id: 'foo' } }
        run_test!
      end
    end
  end
end

# rubocop:enable Layout/LineLength
# rubocop:enable Metrics/BlockLength
