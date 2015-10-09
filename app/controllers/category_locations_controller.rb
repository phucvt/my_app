class CategoryLocationsController < ApplicationController
  before_action :set_category_location, only: [:show, :edit, :update, :destroy]

  # GET /category_locations
  # GET /category_locations.json
  def index
    @category_locations = CategoryLocation.all
  end

  # GET /category_locations/1
  # GET /category_locations/1.json
  def show
  end

  # GET /category_locations/new
  def new
    @category_location = CategoryLocation.new
  end

  # GET /category_locations/1/edit
  def edit
  end

  # POST /category_locations
  # POST /category_locations.json
  def create
    @category_location = CategoryLocation.new(category_location_params)

    respond_to do |format|
      if @category_location.save
        format.html { redirect_to @category_location, notice: 'Category location was successfully created.' }
        format.json { render :show, status: :created, location: @category_location }
      else
        format.html { render :new }
        format.json { render json: @category_location.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /category_locations/1
  # PATCH/PUT /category_locations/1.json
  def update
    respond_to do |format|
      if @category_location.update(category_location_params)
        format.html { redirect_to @category_location, notice: 'Category location was successfully updated.' }
        format.json { render :show, status: :ok, location: @category_location }
      else
        format.html { render :edit }
        format.json { render json: @category_location.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /category_locations/1
  # DELETE /category_locations/1.json
  def destroy
    @category_location.destroy
    respond_to do |format|
      format.html { redirect_to category_locations_url, notice: 'Category location was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_category_location
      @category_location = CategoryLocation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def category_location_params
      params.require(:category_location).permit(:name)
    end
end
