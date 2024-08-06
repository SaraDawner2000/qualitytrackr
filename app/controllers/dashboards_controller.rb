class DashboardsController < ApplicationController
  def show
    @part_query = Part.ransack(params[:q])
    @parts = @part_query.result

    @quality_project_query = QualityProject.ransack(params[:q])
    @quality_projects = @quality_project_query.result
  end
end
