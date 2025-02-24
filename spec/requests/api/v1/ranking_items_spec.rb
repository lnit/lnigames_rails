require 'rails_helper'

RSpec.describe "Api::V1::RankingItems", type: :request do
  let(:project) { create(:project) }
  let(:board) { create(:point_ranking_board, project: project) }

  describe "GET /api/v1/ranking_items" do
    let(:player_uid) { SecureRandom.uuid }
    let(:params) do
      {
        project_code: project.code,
        board_num: board.num,
        uid: player_uid,
      }
    end

    before do
      create_list(:point_rank_item, 5, ranking_board: board)
      create(:point_rank_item, ranking_board: board, uid: player_uid, name: "プレイヤーさん", score: 250)
    end

    it "works! (now write some real specs)" do
      get api_v1_ranking_items_path(params)

      expect(JSON.parse(response.body)).to include({
        top_ranking: [
          { name: "ユーザー5", rank: 1, score: 500 },
          { name: "ユーザー4", rank: 2, score: 400 },
          { name: "ユーザー3", rank: 3, score: 300 },
          { name: "プレイヤーさん", rank: 4, score: 250 },
          { name: "ユーザー2", rank: 5, score: 200 },
          { name: "ユーザー1", rank: 6, score: 100 },
        ],
        high_score: {
          rank: 4, score: 250, name: "プレイヤーさん"
        },
      }.as_json)
    end
  end

  describe "POST /api/v1/ranking_items" do
    subject(:post_score) { post api_v1_ranking_items_path, params: params }

    before do
      allow(LniGamesAuth).to receive(:valid?).and_return(true)
    end

    let(:params) do
      {
        project_code: project.code,
        board_num: board.num,
        uid: SecureRandom.uuid,
        name: "テスト◆太郎",
        score: "100",
        d: "testdigest"
      }
    end

    it { expect { post_score }.to change(PointRankItem, :count).by(1) }
  end
end
