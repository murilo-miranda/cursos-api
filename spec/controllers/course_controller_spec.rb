require 'rails_helper'

describe CourseController, type: :controller do
  context 'POST' do
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

    subject { post :create, params: params}

    it 'creates a course' do
      expect(subject).to have_http_status(201)
      expect(response.body).to eq (expected_response)
      expect(Course.count).to eq 1
    end
  end
end
