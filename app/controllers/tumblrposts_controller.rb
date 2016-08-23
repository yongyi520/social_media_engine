class TumblrpostsController < ApplicationController
  before_action :set_tumblrpost, only: [:show, :edit, :update, :destroy]

  # GET /tumblrposts
  # GET /tumblrposts.json
  def index
    @tumblrposts = Tumblrpost.all
  end

  # GET /tumblrposts/1
  # GET /tumblrposts/1.json
  def show
  end

  # GET /tumblrposts/new
  def new
    @tumblrpost = Tumblrpost.new
  end

  # GET /tumblrposts/1/edit
  def edit
  end

  # POST /tumblrposts
  # POST /tumblrposts.json
  def create
    @tumblrpost = Tumblrpost.new(tumblrpost_params)

    respond_to do |format|
      if @tumblrpost.save
        format.html { redirect_to @tumblrpost, notice: 'Tumblrpost was successfully created.' }
        format.json { render :show, status: :created, location: @tumblrpost }
      else
        format.html { render :new }
        format.json { render json: @tumblrpost.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tumblrposts/1
  # PATCH/PUT /tumblrposts/1.json
  def update
    respond_to do |format|
      if @tumblrpost.update(tumblrpost_params)
        format.html { redirect_to @tumblrpost, notice: 'Tumblrpost was successfully updated.' }
        format.json { render :show, status: :ok, location: @tumblrpost }
      else
        format.html { render :edit }
        format.json { render json: @tumblrpost.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tumblrposts/1
  # DELETE /tumblrposts/1.json
  def destroy
    @tumblrpost.destroy
    respond_to do |format|
      format.html { redirect_to tumblrposts_url, notice: 'Tumblrpost was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tumblrpost
      @tumblrpost = Tumblrpost.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tumblrpost_params
      params.require(:tumblrpost).permit(:user_id, :title, :body)
    end
end
