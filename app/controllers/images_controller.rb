class ImagesController < ApplicationController
  before_action :set_image, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:show, :index, :submit]
  before_action :correct_user, only: [:edit, :update, :destroy]

  # GET /images
  # GET /images.json
  def index
    @select_options = {
      "All Category": "Meal Category", 
      "Breakfast": "Breakfast",
      "Lunch/Dinner": "Lunch/Dinner",
      "Dessert": "Dessert"
    }
    @images = Image.all
    @images = @images.search(params[:category]) if params[:category] && params[:category] != "Meal Category"
  end

  def search
    @images = Image.where("title LIKE ?", "%" + params[:q] + "%")
  end

  def category_search
    
  end

  # GET /images/1
  # GET /images/1.json
  def show
  end

  # GET /images/new
  def new
    #@image = Image.new
    @image = current_user.images.build
  end

  # GET /images/1/edit
  def edit
  end

  # POST /images
  # POST /images.json
  def create
    #@image = Image.new(image_params)
    @image = current_user.images.build(image_params)


    respond_to do |format|
      if @image.save
        format.html { redirect_to @image, notice: 'Image was successfully created.' }
        format.json { render :show, status: :created, location: @image }
      else
        format.html { render :new }
        format.json { render json: @image.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /images/1
  # PATCH/PUT /images/1.json
  def update
    respond_to do |format|
      if @image.update(image_params)
        format.html { redirect_to @image, notice: 'Image was successfully updated.' }
        format.json { render :show, status: :ok, location: @image }
      else
        format.html { render :edit }
        format.json { render json: @image.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /images/1
  # DELETE /images/1.json
  def destroy
    @image.destroy
    respond_to do |format|
      format.html { redirect_to images_url, notice: 'Image was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def correct_user
    @image = current_user.images.find_by(id: params[:id])
    redirect_to images_path, notice: "Not Authorized to Edit This Post" if @image.nil?
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_image
      @image = Image.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def image_params
      params.require(:image).permit(:image, :title, :description, :instructions, 
                                  :ingredients, :cookingtime, :user_id, :thing, :meal_category)
    end
end
