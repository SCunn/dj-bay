class DjcatsController < ApplicationController
  before_action :set_djcat, only: [:show, :edit, :update, :destroy]

  # GET /djcats
  # GET /djcats.json
  def index
    @djcats = Djcat.all
  end

  # GET /djcats/1
  # GET /djcats/1.json
  def show
  end

  # GET /djcats/new
  def new
    @djcat = Djcat.new
  end

  # GET /djcats/1/edit
  def edit
  end

  # POST /djcats
  # POST /djcats.json
  def create
    @djcat = Djcat.new(djcat_params)

    respond_to do |format|
      if @djcat.save
        format.html { redirect_to @djcat, notice: 'Djcat was successfully created.' }
        format.json { render :show, status: :created, location: @djcat }
      else
        format.html { render :new }
        format.json { render json: @djcat.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /djcats/1
  # PATCH/PUT /djcats/1.json
  def update
    respond_to do |format|
      if @djcat.update(djcat_params)
        format.html { redirect_to @djcat, notice: 'Djcat was successfully updated.' }
        format.json { render :show, status: :ok, location: @djcat }
      else
        format.html { render :edit }
        format.json { render json: @djcat.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /djcats/1
  # DELETE /djcats/1.json
  def destroy
    @djcat.destroy
    respond_to do |format|
      format.html { redirect_to djcats_url, notice: 'Djcat was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_djcat
      @djcat = Djcat.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def djcat_params
      params.require(:djcat).permit(:artist, :album, :genre, :description, :image)
    end
end
