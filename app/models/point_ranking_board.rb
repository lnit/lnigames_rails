class PointRankingBoard < RankingBoard
  has_many :rank_items, class_name: 'PointRankItem', foreign_key: :ranking_board_id
end
