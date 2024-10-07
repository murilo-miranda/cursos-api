require 'rails_helper'

describe CourseController, type: :controller do
  context 'INDEX' do
    subject { get :index }
    let!(:course1) {
      Course.create(title: 'Course 1', description: 'Description', end_date: DateTime.now)
    }
    let!(:course2) {
      Course.create(title: 'Course 2', description: 'Description', end_date: DateTime.now)
    }
    let(:expected_response) do
      { 
        data: [
          {
            id: course1.id.to_s,
            type: 'course',
            attributes: {
              title: course1.title,
              description: course1.description,
              end_date: course1.end_date
            }
          },
          {
            id: course2.id.to_s,
            type: 'course',
            attributes: {
              title: course2.title,
              description: course2.description,
              end_date: course2.end_date
            }
          }
        ]
      }.to_json
    end

    context 'success' do
      it 'return a list of courses' do
        expect(subject).to have_http_status(200)
        expect(response.body).to eq (expected_response)
      end
    end
  end
  
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

  context 'DELETE' do
    subject { delete :destroy, params: params}
    let(:course) {
      Course.create(title: 'Title', description: 'Description', end_date: DateTime.now)
    }

    context 'success' do
      let(:params) {{ id: course.id }}

      it 'deletes specified course' do
        course

        expect(subject).to have_http_status(204)
        expect(response.body).to eq ("{}")
        expect(Course.count).to eq 0
      end
    end

    context 'failure' do
      context 'id not found' do
        let(:params) {{ id: 999 }}

        it 'do not deletes specified course' do
          course
  
          expect(subject).to have_http_status(404)
          expect(response.body).to eq ("Couldn't find Course with 'id'=#{params[:id]}")
          expect(Course.count).to eq 1
        end
      end
    end
  end

  context 'PUT' do
    subject { put :update, params: params}

    let(:edited_course) {
      Course.create(title: 'Old Title', description: 'Old Description', end_date: DateTime.now)
    }
    let(:expected_response) do
      {
        id: edited_course.id,
        title: 'New title',
        description: 'New description'
      }.to_json
    end

    context 'success' do
      let(:params) {
        {
          id: edited_course.id,
          title: 'New title',
          description: 'New description'
        }
      }

      it 'updates a course' do
        subject
        
        expect(subject).to have_http_status(200)
        expect(response.body).to eq (expected_response)
      end
    end

    context 'failure' do
      context 'not found' do
        let(:params) {
          {
            id: 999,
            title: 'New title',
            description: 'New description'
          }
        }

        it 'do not updates a course' do
          subject
          
          expect(subject).to have_http_status(404)
          expect(response.body).to eq ("Couldn't find Course with 'id'=#{params[:id]}")
        end
      end
    end
  end
end
