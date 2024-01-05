class RankingBoard < ApplicationRecord
  MAX_LIST_COUNT = 100

  belongs_to :project

  before_create do
    # 並行して2つ作成されない前提で雑にカウントアップ
    self.num = project.ranking_boards.count + 1
  end
end
