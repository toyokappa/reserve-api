class ShiftTransformer
  class << self
    def encode(shifts, lock_days, start_date)
      from = start_date.to_date
      to = from.since(13.days).to_date # 2週間分を渡すようにする
      encoded_format = (from..to).map do |date|
        { date: date.to_s, state_list: encoded_shift_format }
      end

      # 30分のものを除く
      shifts = shifts.filter {|shift| shift.work_time.to_fs(:time).match?(/.+:00$/) }
      # 日付でグルーピングする
      shifts = shifts.group_by {|shift| shift.work_time.to_fs(:date) }

      # グルーピングされたデータを予約可能な時間でwork, rest, lockに振り分ける
      encoded_format.each do |schedule|
        shifts[schedule[:date]]&.each do |day|
          work_hour = day.work_time.hour
          shift_index = work_hour - Shift::RESERVAL_HOURS_FIRST
          if day.work_time.in? lock_days
            schedule[:state_list][shift_index] = 'lock'
          else
            schedule[:state_list][shift_index] = 'work'
          end
        end
      end
      encoded_format
    end

    def encode_for_reserve(shifts, start_date)
      from = start_date.to_date
      to = from.since(13.days).to_date # 2週間分を渡すようにする
      encoded_format = (from..to).map do |date|
        { date: date.to_s, state_list: encoded_reserve_format }
      end

      # 30分のものを除く
      shifts = shifts.filter {|shift| shift.work_time.to_fs(:time).match?(/.+:00$/) }
      # 日付でグルーピングする
      shifts = shifts.group_by {|shift| shift.work_time.to_fs(:date) }
      # グルーピングされたデータを予約可能な時間でwork, restに振り分ける
      encoded_format.each do |schedule|
        shifts[schedule[:date]]&.each do |day|
          work_hour = day.work_time.hour
          shift_index = work_hour - Shift::RESERVAL_HOURS_FIRST
          schedule[:state_list][shift_index] = 'ok'
        end
      end
      encoded_format
    end

    def decode_to_work_times(schedule)
      # input { date: '2023-02-11', state_list: ['work', 'rest', 'rest', ...] }
      # output ['2023-02-11 9:00', ...]
      schedule.map do |day|
        day['state_list'].map.with_index do |state, i|
          next if state == 'rest'

          time = Shift::RESERVAL_HOURS_FIRST + i
          "#{day['date']} #{time}:00"
        end.compact
      end.flatten
    end

    def decode_to_rest_times(schedule)
      # input { date: '2023-02-11', state_list: ['work', 'rest', 'rest', ...] }
      # output ['2023-02-11 9:00', ...]
      schedule.map do |day|
        day[:state_list].map.with_index do |state, i|
          next if state.in? %w[work lock]

          time = Shift::RESERVAL_HOURS_FIRST + i
          "#{day[:date]} #{time}:00"
        end.compact
      end.flatten
    end

    private

    def encoded_shift_format
      (Shift::RESERVAL_HOURS_FIRST..Shift::RESERVAL_HOURS_LAST).map {|_| 'rest' }
    end

    def encoded_reserve_format
      (Shift::RESERVAL_HOURS_FIRST..Shift::RESERVAL_HOURS_LAST).map {|_| 'ng' }
    end
  end
end
