class QrCode < ApplicationRecord
  def increase_count
    self.count += 1
    save
  end
end
