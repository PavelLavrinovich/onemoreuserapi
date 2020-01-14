# spec/integration/users_spec.rb
require 'swagger_helper'

describe 'Users API' do
  path '/users' do
    get 'List users' do
      tags 'Users'
      consumes 'application/json'
      produces 'application/json'

      parameter name: :X_REQUESTED_WITH, in: :header, type: :string, required: true, description: 'Should be equal XMLHttpRequest'

      response '200', 'all users' do
        examples 'application/json' => [
          {
            "id": 1,
            "email": 'test@email.com',
            "name": nil,
            "phone": nil,
            "role_id": 4,
            "created_at": '2020-01-14T13:02:44.736Z',
            "updated_at": '2020-01-14T13:02:44.736Z'
          }
        ]
        run_test!
      end
    end

    post 'Create user' do
      tags 'Users'
      consumes 'application/json'
      produces 'application/json'

      parameter name: :X_REQUESTED_WITH, in: :header, type: :string, required: true, description: 'Should be equal XMLHttpRequest'
      parameter name: :user, in: :body, schema: {
        type: :object,
        properties: {
          name: { type: :string },
          email: { type: :string },
          phone: { type: :string },
          user_extension_fields_attributes: {
            type: :array,
            items: {
              type: :object,
              properties: {
                name: { type: :string },
                value: { type: :string }
              }
            }
          }
        },
        required: %i[name email phone]
      }

      response '201', 'create a user' do
        examples 'application/json' => {
          "id": 2,
          "email": 'one@more.com',
          "name": 'One More',
          "phone": '1234567890',
          "role_id": 4,
          "created_at": '2020-01-14T13:56:52.580Z',
          "updated_at": '2020-01-14T13:56:52.580Z'
        }
        run_test!
      end
    end
  end

  path '/users/:id' do
    get 'Show user' do
      tags 'Users'
      consumes 'application/json'
      produces 'application/json'

      parameter name: :X_REQUESTED_WITH, in: :header, type: :string, required: true, description: 'Should be equal XMLHttpRequest'
      parameter name: :id, in: :path, type: :string, required: true, description: 'Id of the user'

      response '200', 'user' do
        examples 'application/json' => {
          "id": 1,
          "email": 'test@email.com',
          "name": nil,
          "phone": nil,
          "role_id": 4,
          "created_at": '2020-01-14T13:02:44.736Z',
          "updated_at": '2020-01-14T13:02:44.736Z'
        }
        run_test!
      end
    end

    put 'Update user' do
      tags 'Users'
      consumes 'application/json'
      produces 'application/json'

      parameter name: :X_REQUESTED_WITH, in: :header, type: :string, required: true, description: 'Should be equal XMLHttpRequest'
      parameter name: :id, in: :path, type: :string, required: true, description: 'Id of the user'

      parameter name: :user, in: :body, schema: {
        type: :object,
        properties: {
          name: { type: :string },
          email: { type: :string },
          phone: { type: :string },
          user_extension_fields_attributes: {
            type: :array,
            items: {
              type: :object,
              properties: {
                id: { type: :integer },
                name: { type: :string },
                value: { type: :string },
                _destroy: { type: :boolean }
              }
            }
          }
        },
        required: %i[name email phone]
      }

      response '200', 'create a user' do
        examples 'application/json' => {
          "id": 2,
          "email": 'one@more.com',
          "name": 'One More',
          "phone": '1234567890',
          "role_id": 4,
          "created_at": '2020-01-14T13:56:52.580Z',
          "updated_at": '2020-01-14T13:56:52.580Z'
        }
        run_test!
      end
    end
  end
end