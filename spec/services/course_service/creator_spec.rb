require 'rails_helper'

describe CourseService::Creator do
  describe '.execute' do
    let(:params) {
      {
        title: 'Curso',
        description: 'Descricao exemplo',
        end_date: DateTime.now
      }
    }

    subject { described_class.new(params).execute }

    context 'success' do
      it 'creates a course' do
        expect{subject}.to change{Course.count}.by 1
        expect(Course.last.title).to eq 'Curso'
        expect(Course.last.description).to eq 'Descricao exemplo'
        # expect(Course.last.end_date).to eq
      end
    end
  end
end