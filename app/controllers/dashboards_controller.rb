class DashboardsController < ApplicationController
  def show
    @user = current_user
  end

  def sort_parts
    @q_parts = Part.ransack(params[:q_parts])
    @parts = @q_parts.result
    respond_to do |format|
      format.js { render partial: "parts/parts_table" }
    end
  end

  def sort_quality_projects
    @q_quality_projects = QualityProject.ransack(params[:q_quality_projects])
    @quality_projects = @q_quality_projects.result
    respond_to do |format|
      format.js { render partial: "quality_projects/quality_projects_table" }
    end
  end
end
