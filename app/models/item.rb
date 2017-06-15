class Item
  include NoBrainer::Document
  include NoBrainer::Document::Timestamps

  paginates_per 11

  field :supplier, :type => String
  field :number, :type => String, unique: true
  field :description, :type => String
  field :bruto
  field :discount
  field :netto

  def netto_price
    if self.netto.nil?
      (((100 - discount.to_d) / 100) * bruto.to_d).round(2)
    else
      netto.to_d
    end
  end

  def info
    "#{self.supplier} \t- #{self.number} \t- #{self.description}"
  end

  def supplier=(value)
    super(value.upcase)
  end


end
