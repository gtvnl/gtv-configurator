class ItemsController < ApplicationController
  include Concerns::ItemMethods

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
