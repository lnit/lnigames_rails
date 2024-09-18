class PointRankItem < ApplicationRecord
  belongs_to :ranking_board

  def name=(val)
    super(val.gsub(/[\r\n\f]/, "").strip)
  end
end
