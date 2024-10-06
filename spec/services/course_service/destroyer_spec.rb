require 'rails_helper'

describe CourseService::Destroyer do
  describe '.execute' do
    subject { described_class.new(params).execute }
    let(:params) {{ id: course.id }}
    let(:course) {
      Course.create(title: 'Title', description: 'Description', end_date: DateTime.now)
    }

    context 'success' do
      it 'deletes specified course' do
        course

        subject

        expect(Course.count).to eq 0
      end
    end
  end
end