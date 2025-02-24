class PointRankItem < ApplicationRecord
  include Decorator::PointScore

  belongs_to :ranking_board

  attribute :name, :string,  default: "No Name"

  def name=(val)
    val = val.to_s
    super(val.gsub(/[\r\n\f]/, "").strip)
  end
end
