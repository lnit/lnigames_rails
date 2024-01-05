class Api::V1::RankingItemsController < Api::V1::ApplicationController
  def index

  end

  def create
    ranking.add_item!(ranking_params)

    head :created
  end

  def permitted_params
    @permitted_params ||= params.permit(
      :project_code,
      :board_num,
      :score,
      :user_identifier,
      :name,
    )
  end

  def ranking_params
    permitted_params.slice(:score, :user_identifier, :name)
  end

  def project
    @project ||= Project.find_by!(code: permitted_params[:project_code])
  end

  def ranking
    @ranking ||= project.ranking_boards.find_by!(num: permitted_params[:board_num])
  end
end
