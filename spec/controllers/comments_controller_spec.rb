require 'rails_helper'

RSpec.describe CommentsController, type: :controller do

  login_user

  describe "GET top_commenters" do
    let!(:user) { FactoryBot.create(:user) }
    let!(:movie) { FactoryBot.create(:movie) }


    it "has a 200 status code" do
      get :top_commenters
      expect(response.status).to eq(200)
    end

    it "has top_commenter render" do
      get :top_commenters
      expect(response.content_type).to eq 'text/html'
    end
  end

  context 'Actions' do
    let!(:movie) { FactoryBot.create(:movie) }

    describe "POST comment" do
      it "should create a comment" do
        post :create, params: { comment: "example", movie_id: movie.id, user_id: User.last.id }
        expect(response).to redirect_to movie_path(movie.id)
      end
    end

    describe "DELETE comment" do
      let!(:comment) { FactoryBot.create(:comment) }

      it "should delete a comment" do
        delete :destroy, params: { id: comment.id, movie_id: movie.id }
        expect(Comment.count).to eq 0
      end
    end
  end
end
