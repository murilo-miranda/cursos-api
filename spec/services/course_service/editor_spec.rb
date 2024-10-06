require 'rails_helper'

describe CourseService::Editor do
  describe '.execute' do
    subject { described_class.new(params).execute }
    let(:edited_course) {
      Course.create(title: 'Old Title', description: 'Old Description', end_date: DateTime.now)
    }

    context 'success' do
      context 'course title' do
        let(:params) {
          {
            id: edited_course.id,
            title: 'New title'
          }
        }

        it 'update' do
          subject
          
          expect(Course.count).to eq 1
          expect(Course.find(edited_course.id).title).to eq 'New title'
          expect(Course.find(edited_course.id).description).to eq 'Old Description'
        end
      end

      context 'course description' do
        let(:params) {
          {
            id: edited_course.id,
            description: 'New description'
          }
        }

        it 'update' do
          subject

          expect(Course.count).to eq 1
          expect(Course.find(edited_course.id).title).to eq 'Old Title'
          expect(Course.find(edited_course.id).description).to eq 'New description'
        end
      end

      context 'all params' do
        let(:params) {
          {
            id: edited_course.id,
            title: 'New title',
            description: 'New description'
          }
        }

        it 'update' do
          subject
          
          expect(Course.count).to eq 1
          expect(Course.find(edited_course.id).title).to eq 'New title'
          expect(Course.find(edited_course.id).description).to eq 'New description'
        end
      end
    end
  end
end