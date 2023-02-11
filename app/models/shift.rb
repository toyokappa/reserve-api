class Shift < ApplicationRecord
  RESERVAL_HOURS_FIRST = 9  # 受付の最初の受付が9時
  RESERVAL_HOURS_LAST  = 21 # 受付の最後の受付が21時
  DISPLAY_INTERVAL = 60.minutes
  INPUT_INTERVAL = 30.minutes

  belongs_to :staff

  class << self
    def input_times
      DISPLAY_INTERVAL / INPUT_INTERVAL
    end
  end

  # FIXME: scopeで定義するのが正しいかは怪しいので実装方法は今後検討
  scope :to_output_times, -> {
    # 30分のものを除く
    # 日付でグルーピングする
    # グルーピングされたデータを予約可能な時間でwork, restに振り分ける
  }
end
