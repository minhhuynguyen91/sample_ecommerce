class Product < ApplicationRecord
  def self.search(barcode)
    if barcode
      where('name LIKE ?', "%#{barcode}").order('id DESC')
    else
      order('id DESC')
    end
  end
end
