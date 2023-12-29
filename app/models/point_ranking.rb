class PointRanking < Ranking
  has_many :rank_items, class_name: 'PointRankItem', foreign_key: :ranking_id
end
