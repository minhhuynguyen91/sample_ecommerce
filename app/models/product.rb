class Product < ApplicationRecord
  def self.search(barcode)
    if barcode
      where('code LIKE ?', "%#{barcode}").order('id DESC')
    else
      order('id DESC')
    end
  end
end
