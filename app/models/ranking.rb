class Ranking < ApplicationRecord
  belongs_to :project

  before_create do
    # 並行して2つ作成されない前提で雑にカウントアップ
    self.num = project.rankings.count + 1
  end
end
