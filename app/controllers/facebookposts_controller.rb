class FacebookpostsController < ApplicationController
  before_action :set_facebookpost, only: [:show, :edit, :update, :destroy]

  # GET /facebookposts
  # GET /facebookposts.json
  def index
    @facebookposts = Facebookpost.all
    @feeds = current_user.facebook.get_connections("me", "feed?fields=message,link,privacy")
    @facebookpost = Facebookpost.new
  end

  # GET /facebookposts/1
  # GET /facebookposts/1.json
  def show
  end

  # GET /facebookposts/new
  def new
    @facebookpost = Facebookpost.new
  end

  # GET /facebookposts/1/edit
  def edit
  end

  # POST /facebookposts
  # POST /facebookposts.json
  def create
    @facebookpost = Facebookpost.new(facebookpost_params)
    current_user.facebook.put_wall_post(:body)
    respond_to do |format|
      if @facebookpost.save
        format.html { redirect_to facebookposts_path, notice: 'Facebookpost was successfully created.' }
        format.json { render :show, status: :created, location: @facebookpost }
      else
        format.html { render :new }
        format.json { render json: @facebookpost.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /facebookposts/1
  # PATCH/PUT /facebookposts/1.json
  def update
    respond_to do |format|
      if @facebookpost.update(facebookpost_params)
        format.html { redirect_to @facebookpost, notice: 'Facebookpost was successfully updated.' }
        format.json { render :show, status: :ok, location: @facebookpost }
      else
        format.html { render :edit }
        format.json { render json: @facebookpost.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /facebookposts/1
  # DELETE /facebookposts/1.json
  def destroy
    @facebookpost.destroy
    respond_to do |format|
      format.html { redirect_to facebookposts_url, notice: 'Facebookpost was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_facebookpost
      @facebookpost = Facebookpost.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def facebookpost_params
      params.require(:facebookpost).permit(:user_id, :body)
    end
end
