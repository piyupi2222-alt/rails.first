class Schedule < ApplicationRecord
    validates :title, presence:true, length:{maximum:20}
    validates :startday, presence:true
    validates :finishday, presence:true
    validates :schedule_memo, length:{maximum:500}
    validate :startday_finishday_check

    def startday_finishday_check
        if startday == nil
            return
        elsif finishday == nil
            return
        elsif self.startday >= self.finishday
            errors.add(:finishday, "は開始日以降の日付を選択してください。")
        else
            return
        end
    end
end
