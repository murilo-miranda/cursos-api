require 'rails_helper'

describe CourseService::Creator do
  describe '.execute' do
    subject { described_class.new(params).execute }

    context 'success' do
      let(:params) {
        {
          title: 'Curso',
          description: 'Descricao exemplo',
          end_date: '2024-12-25'
        }
      }

      it 'creates a course' do
        expect { subject }.to change { Course.count }.by 1
        expect(Course.last.title).to eq 'Curso'
        expect(Course.last.description).to eq 'Descricao exemplo'
        puts params[:end_date].to_datetime
        expect(Course.last.end_date).to eq params[:end_date].to_datetime
      end
    end
  end
end
