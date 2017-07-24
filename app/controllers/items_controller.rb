class ItemsController < ApplicationController
  include Concerns::ItemMethods
  include Concerns::Importable


  def import

    csv_file = params[:file]

    #

    sheet = Roo::Spreadsheet.open(csv_file)

    @items = sheet.parse(bestelnummer: /bestelnummer/,	vervangt_artikel: /vervangt_artikel/,	bestelnummer_oud: /bestelnummer_oud/, 	omschrijving: /omschrijving/,	ean_code: /ean_code/, type_nummer: /type_nummer/,	ean_aantal: /ean_aantal/,	gebruiks_eenheid: /gebruiks_eenheid/, bruto_prijs: /bruto_prijs/, prijseenheid_aantal: /prijseenheid_aantal/,	prijseenheid: /prijseenheid/,	artikelgroep: /artikelgroep/)



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
