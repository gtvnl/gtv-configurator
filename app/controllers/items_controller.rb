class ItemsController < ApplicationController
  include Concerns::ItemMethods

  def import
    # csv_file = params[:file]
    #
    # b = Roo::Spreadsheet.open(csv_file)
    #
    # errors = 0
    #
    # records_added = 0
    # records_updated = 0
    # info = []
    #
    # b.each(
    #     delivery_date: 'Leverdatum',
    #     material_pc: 'Order.Voorgecalculeerde materiaalkosten') do |hash|
    #
    #     unless hash[:order_number] == 'Order' # Skip the header
    #
    #
    #    end
    # end
    #
    # redirect_to orders_path, notice: "#{errors} errors while importing. #{records_added} added. #{records_updated} updated. #{info}"

  end

  # GET /items
  def index
    items
  end

  # GET /items/new
  def new
    item
  end

  # GET /items/1/edit
  def edit
    item
  end

  # POST /items
  def create
    if item.save
      redirect_to positie_items_url, notice: 'Item aangemaakt.'
    else
      render :new
    end
  end

  # PATCH/PUT /items/1
  def update
    if item.update(item_params)
      redirect_to positie_items_url, notice: 'Item gewijzigd.'
    else
      render :edit
    end
  end

  # DELETE /items/1
  def destroy
    item.destroy
    redirect_to positie_items_url, notice: 'Item verwijderd.'
  end

end
