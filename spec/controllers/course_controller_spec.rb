require 'rails_helper'

describe CourseController, type: :controller do
  context 'POST' do
    subject { post :create, params: params}

    context 'success' do
      let(:params) {
        {
          title: 'Curso',
          description: 'Descricao exemplo',
          end_date: DateTime.now
        }
      }
      let(:expected_response) do
        {}.to_json
      end
  
  
      it 'creates a course' do
        expect(subject).to have_http_status(201)
        expect(response.body).to eq (expected_response)
        expect(Course.count).to eq 1
      end
    end

    context 'failure' do
      context 'title param missing' do
        let(:params) {{}}
        let(:expected_response) do
          "param is missing or the value is empty: title"
        end
  
        it 'do not creates a course' do
          expect(subject).to have_http_status(400)
          expect(response.body).to eq (expected_response)
          expect(Course.count).to eq 0
        end
      end

      context 'description param missing' do
        let(:params) {
          {
            title: 'Nome do Curso'
          }
        }
        let(:expected_response) do
          "param is missing or the value is empty: description"
        end
  
        it 'do not creates a course' do
          expect(subject).to have_http_status(400)
          expect(response.body).to eq (expected_response)
          expect(Course.count).to eq 0
        end
      end
    end
  end
end
