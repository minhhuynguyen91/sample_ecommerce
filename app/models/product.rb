class Product < ApplicationRecord
  def self.search(barcode)
    if barcode
      where('barcode LIKE ?', "%#{barcode}").order('id DESC')
    else
      order('id DESC')
    end
  end
end
