class OptionsController < ApplicationController
  before_action :set_option, only: [:update, :destroy]

  # GET /options
  # GET /options.json
  def index
    @options = Option.all
  end

  # GET /options/1
  # GET /options/1.json
  def show
    option = Option.find_by domain: params[:shop]
    add_cors_headers
    render json: {option: option.as_json(:except => [:created_at, :updated_at, :domain])}, status: :ok
  end

  # GET /options/new
  def new
    @option = Option.new
  end

  # GET /options/1/edit
  def edit
=begin    
    @shop = ShopifyAPI::Shop.current
    @option = Option.find_by domain: @shop.domain
    if @option.nil?
      @option = Option.new
      @option.domain = @shop.domain
      @option.save
    end
=end    
  end

  # POST /options
  # POST /options.json
  def create
    @option = Option.new(option_params)

    respond_to do |format|
      if @option.save
        format.html { redirect_to @option, notice: 'Option was successfully created.' }
        format.json { render :show, status: :created, location: @option }
      else
        format.html { render :new }
        format.json { render json: @option.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /options/1
  # PATCH/PUT /options/1.json
  def update
=begin    
    respond_to do |format|
      if @option.update(option_params)
        #format.html { redirect_to edit_option_path(@option), notice: 'Options are successfully updated.' }
        flash[:notice] = 'Options are successfully updated.'
        format.html {render 'home/index' }        
      else
        flash[:alert] = 'Errors while updating'
        format.html { render :edit }
      end
    end
=end
    if @option.update(option_params)      
      flash[:notice] = 'Options are successfully updated.'      
      redirect_to root_path
    else
      flash[:alert] = 'Errors while updating'      
    end
  end

  # DELETE /options/1
  # DELETE /options/1.json
  def destroy
    @option.destroy
    respond_to do |format|
      format.html { redirect_to options_url, notice: 'Option was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_option
      @option = Option.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def option_params
      params.require(:option).permit(:auto_complete, :validate_address, :pobox_warning, :streetnum_warning, :domain)
    end

    def add_cors_headers
      response.headers['Access-Control-Allow-Origin'] = '*'
      response.headers['Access-Control-Allow-Methods'] = 'POST, PUT, DELETE, GET, OPTIONS'
      response.headers['Access-Control-Request-Method'] = '*'
      response.headers['Access-Control-Allow-Headers'] = 'Origin, X-Requested-With, Content-Type, Accept, Authorization'
    end
end
