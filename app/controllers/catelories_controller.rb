class CateloriesController < ApplicationController
  before_action :set_catelory, only: [:show, :edit, :update, :destroy]

  # GET /catelories
  # GET /catelories.json
  def index
    @catelories = Catelory.all
    @catelory = Catelory.new
  end

  # GET /catelories/1
  # GET /catelories/1.json
  def show
  end

  # GET /catelories/new
  def new
    @catelory = Catelory.new
  end

  # GET /catelories/1/edit
  def edit
  end

  # POST /catelories
  # POST /catelories.json
  def create
    @catelory = Catelory.new(catelory_params)

    respond_to do |format|
      if @catelory.save
        format.html { redirect_to @catelory, notice: 'Catelory was successfully created.' }
        format.json { render :show, status: :created, location: @catelory }
      else
        format.html { render :new }
        format.json { render json: @catelory.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /catelories/1
  # PATCH/PUT /catelories/1.json
  def update
    respond_to do |format|
      if @catelory.update(catelory_params)
        format.html { redirect_to @catelory, notice: 'Catelory was successfully updated.' }
        format.json { render :show, status: :ok, location: @catelory }
      else
        format.html { render :edit }
        format.json { render json: @catelory.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /catelories/1
  # DELETE /catelories/1.json
  def destroy
    @catelory.destroy
    respond_to do |format|
      format.html { redirect_to catelories_url, notice: 'Catelory was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_catelory
      @catelory = Catelory.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def catelory_params
      params.require(:catelory).permit(:name)
    end
end
