class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :menu
  validates :user_id, presence: true
  validates :menu_id, presence: true, allow_nil: true
  validates :name,    presence: true
  validate :date_before_start
  validate :start_time_not_sunday
  validate :start_time_not_saturday
  validate :time_limits
  scope :future_reservations, -> do
    where("start_time > ?", Date.today).order(start_time: :desc)
  end
  scope :reservations_history, -> (count) { order(start_time: :desc).limit(count) }

  def date_before_start
    errors.add(:start_time, "は過去の日付を選択できません") if start_time < Date.today
  end

  def start_time_not_sunday
    errors.add(:start_time, "は日曜日を選択できません") if start_time.sunday?
  end

  def start_time_not_saturday
    errors.add(:start_time, "は土曜日を選択できません") if start_time.saturday?
  end

  def time_limits
    if hour_1 && minite
      true
    elsif hour_2 && minite
      true
    else
      errors.add(:start_time, "(営業時間)は9:30から18:30になります")
    end
  end

  def hour_1
    start_time.hour > 9
  end

  def hour_2
    start_time.hour < 18
  end

  def minite
    start_time.min == 30
  end
end
