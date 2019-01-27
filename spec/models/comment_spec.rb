require 'rails_helper'

RSpec.describe Comment, type: :model do
  let(:movie) { FactoryBot.create(:movie) }
  let(:user) { FactoryBot.create(:user) }
  let(:comment) { FactoryBot.create(:comment) }


  it "has one record" do
    FactoryBot.create(:comment)
    expect(Comment.count).to eq 1
  end

  it "is invalid" do
    comment = Comment.new(comment: "comment")
    expect(comment).to be_invalid
  end

  context 'top_commentors' do
    describe '.top_commenters' do
      let!(:comment) { FactoryBot.create(:comment) }

      it "should return array of data" do
        expect(Comment.top_commenters).to eq Comment.group(:user_id).count.sort
      end
    end

    describe '.top_commenters' do
      it "should return array of data" do
        expect(Comment.top_commenters).to eq []
      end
    end
  end
end
