require 'rails_helper'

RSpec.describe MovieCsvSenderJob, type: :job do
  describe '.movie_csv_sender_job' do
    let!(:user) { FactoryBot.create(:user) }
    let(:file_path) { "tmp/movies.csv" }

    context '#perform_later' do
      it 'should send a csv' do
        ActiveJob::Base.queue_adapter = :test
        expect {
          MovieCsvSenderJob.perform_later(user, file_path)
        }.to have_enqueued_job
      end
    end
  end
end