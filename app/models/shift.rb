class Shift < ApplicationRecord
  RESERVAL_HOURS_FIRST = 9  # 受付の最初の受付が9時
  RESERVAL_HOURS_LAST  = 21 # 受付の最後の受付が21時

  belongs_to :staff
end
