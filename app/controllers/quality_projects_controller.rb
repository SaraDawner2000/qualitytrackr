class QualityProjectsController < ApplicationController
  before_action :set_quality_project, only: %i[ show edit update destroy ]

  # GET /quality_projects or /quality_projects.json
  def index
    @quality_projects = QualityProject.all
  end

  # GET /quality_projects/1 or /quality_projects/1.json
  def show
  end

  # GET /quality_projects/new
  def new
    @quality_project = QualityProject.new
  end

  # GET /quality_projects/1/edit
  def edit
  end

  # POST /quality_projects or /quality_projects.json
  def create
    @quality_project = QualityProject.new(quality_project_params)

    respond_to do |format|
      if @quality_project.save
        format.html { redirect_to quality_project_url(@quality_project), notice: "Quality project was successfully created." }
        format.json { render :show, status: :created, location: @quality_project }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @quality_project.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /quality_projects/1 or /quality_projects/1.json
  def update
    respond_to do |format|
      if @quality_project.update(quality_project_params)
        format.html { redirect_to quality_project_url(@quality_project), notice: "Quality project was successfully updated." }
        format.json { render :show, status: :ok, location: @quality_project }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @quality_project.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /quality_projects/1 or /quality_projects/1.json
  def destroy
    @quality_project.destroy

    respond_to do |format|
      format.html { redirect_to quality_projects_url, notice: "Quality project was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_quality_project
      @quality_project = QualityProject.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def quality_project_params
      params.require(:quality_project).permit(:part_id, :customer, :customer_request, :purchase_order, :inspection_plan, :report_approval, :assembled_record, :customer_approval)
    end
end
