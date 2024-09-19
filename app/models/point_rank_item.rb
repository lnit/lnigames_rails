class PointRankItem < ApplicationRecord
  belongs_to :ranking_board

  attribute :name, :string,  default: "No Name"

  def name=(val)
    super(val.gsub(/[\r\n\f]/, "").strip)
  end
end
