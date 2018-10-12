class Product < ApplicationRecord
  def self.search(barcode)
    if barcode
      where('code LIKE ?', "%#{barcode}").order('id DESC')
    else
      order('id DESC')
    end
  end

  def cart_action(current_user_id)
    if $redis.sismember "cart#{current_user_id}", id
      "Remove from"
    else
      "Add to"
    end
  end
end
