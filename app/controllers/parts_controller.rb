class PartsController < ApplicationController
  before_action :set_part, only: %i[ show edit update destroy ]
  before_action :destroy_duds, only: %i[ index ]
  # GET /parts or /parts.json
  def index
    @q = Part.ransack(params[:q])
    @parts = @q.result.page(params[:page])
  end

  # GET /parts/1 or /parts/1.json
  def show
  end

  # GET /parts/new
  def new
    @part = Part.new
  end

  # GET /parts/1/edit
  def edit
  end

  # POST /parts or /parts.json
  def create
    @part = Part.new(part_params)

    respond_to do |format|
      if @part.save
        child_hash = params[:subcomponents]
        if child_hash
          create_children(@part, child_hash)
        end
        format.html { redirect_to new_quality_project_url(part_id: @part.id), notice: "Part was successfully created." }
        format.json { render :show, status: :created, location: @part }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @part.errors, status: :unprocessable_entity }
      end
    end
  end

  def create_children(parent_part, child_hash)
    child_hash.each do |key, child_params|
      delete_empty_params child_params
      permitted_child_params = child_params.permit(:part_number, :revision, :drawing, :base_material, :finish)

      child_part = Part.new(permitted_child_params)
      if child_part.save
        Subcomponent.create(
          parent_id: parent_part.id,
          child_id: child_part.id
        )
      end
    end
  end

  def delete_empty_params(params)
    params.delete_if { |key, value| value == "" }
  end

  # PATCH/PUT /parts/1 or /parts/1.json
  def update
    respond_to do |format|
      if @part.update(part_params)
        format.html { redirect_to part_url(@part), notice: "Part was successfully updated." }
        format.json { render :show, status: :ok, location: @part }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @part.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /parts/1 or /parts/1.json
  def destroy
    @part.destroy

    respond_to do |format|
      format.html { redirect_to parts_url, notice: "Part was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_part
      @part = Part.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def part_params
      part_params = params.require(:part)
      delete_empty_params part_params
      part_params.permit(:part_number, :revision, :job, :drawing, :base_material, :finish, :measured_status)
    end

    def destroy_duds
      Part.top_parts.each do |part|
        unless part.quality_project
          part.children.destroy_all
          part.destroy
        end
      end
    end
end
