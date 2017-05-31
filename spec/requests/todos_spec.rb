require 'rails_helper'
    RSpec.describe 'Todos API', type: :request do
        # initialize test data 
        let!(:todos) { create_list(:todo, 10) }
        let(:todo_id) { todos.first.id }

              # Test suite for GET /todos
                describe 'GET /todos' do
                 before { get '/todos' }
                    it 'returns todos' do
                        expect(json).not_to be_empty
                        expect(json.size).to eq(10)
                    end

                    it 'return status code 200' do
                        expect(response).to have_http_status(200)
                    end
                end

                 # Test suite for GET /todos/:id
                 describe 'GET todos/:id' do
                  before { get "/todos/#{todo_id}" }
                    it 'return todos/:id' do
                        expect(json).not be_empty
                        expect(json['id']).to eq(todo_id)
                    end
                    
                    it 'return status code 200' do
                        expect(response).to have_http_status(200)
                    end

                    context 'when the record does not exist' do
                        let(:todo_id) {100}
                
                        it 'return a not found message' do
                            expect(response.body).to match(/Could not find Todo/)
                        end
                    end
                 end     
                 # Continuing
    end
