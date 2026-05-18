class Schedule < ApplicationRecord
  validates :title, presence: true
  validates :title, length: { maximum: 20 }
  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :schedule_memo, length: { maximum: 500 }

  validate :end_date_after_start_date

  def end_date_after_start_date
    if end_date == nil

    elsif end_date < Date.tomorrow
      errors.add(:end_date,"は開始日以降の日付を選択してください")
    else

    end
  end
end
