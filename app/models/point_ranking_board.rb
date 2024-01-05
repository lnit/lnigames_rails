class PointRankingBoard < RankingBoard
  has_many :rank_items, class_name: 'PointRankItem', foreign_key: :ranking_board_id

  def add_item!(params)
    params[:name] = "No Name" if params[:name].blank?

    item = rank_items.find_or_initialize_by(user_identifier: params[:user_identifier])

    # 新規レコード、または過去のスコアの方が低い場合にスコアを保存
    if item.new_record? || item.score <= params[:score].to_i
      item.update!(params)
    end

    item
  end
end
