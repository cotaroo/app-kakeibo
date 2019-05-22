class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]


  $error_flag = 0
  $this_date = Date.today

  # GET /items
  # GET /items.json
  def index
    @items = Item.all
    if params[:start_date].blank?
      $this_date = Date.today
    else
      $this_date = Date.parse(params[:start_date])
    end
    @income = 0
    @expenditure = 0
    @total = 0
    $error_flag = 0
  end

  # GET /items/1
  # GET /items/1.json
  # def show
  # end

  # GET /items/new
  def new
    @item = Item.new(start_time: params[:start_time])
  end

  # GET /items/1/edit
  def edit
  end

  # POST /items
  # POST /items.json
  def create
    @item = Item.new(item_params)

    respond_to do |format|
      if @item.save
        format.html { redirect_to items_path, notice: 'Item was successfully created.' }
        # format.json { render :show, status: :created, location: @item }
        $error_flag = 0
      else
        format.html { render :new }
        format.json { render json: @item.errors, status: :unprocessable_entity }
        $error_flag = 1
      end
    end
  end

  # PATCH/PUT /items/1
  # PATCH/PUT /items/1.json
  def update
    respond_to do |format|
      if @item.update(item_params)
        format.html { redirect_to items_path, notice: 'Item was successfully updated.' }
        # format.json { render :show, status: :ok, location: @item }
      else
        format.html { render :edit }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  def select
    @date = params[:start_time]
    @items = Item.where(start_time: params[:start_time])
  end

  def expenditure
    @items = Item.where(income_and_expenditure: "支出")
    @shokuhi = 0
    @gaishokuhi = 0
    @nichiyohin = 0
    @kotsuhi = 0
    @ihuku = 0
    @kosaihi = 0
    @shumi = 0
    @sonota = 0
  end


  def income
    @items = Item.where(income_and_expenditure: "収入")
    @kyuryo = 0
    @sonota = 0
  end


  # DELETE /items/1
  # DELETE /items/1.json
  def destroy
    @item.destroy
    respond_to do |format|
      format.html { redirect_to items_url, notice: 'Item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item
      @item = Item.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def item_params
      params.require(:item).permit(:name, :start_time, :amount, :income_and_expenditure)
    end
end
