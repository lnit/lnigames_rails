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

  def display_ranking
    {
      top_ranking: top_ranking
    }
  end

  private

  def top_ranking
    last_rank = nil
    last_score = nil
    rank_items.order(score: :desc, updated_at: :asc).map.with_index do |item, i|
      obj = item.slice(:score, :name)

      if item.score == last_score
        obj[:rank] = last_rank
      else
        obj[:rank] = i + 1
        last_rank = i + 1
        last_score = item.score
      end

      obj
    end
  end
end
