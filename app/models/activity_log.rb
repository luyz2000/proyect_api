class ActivityLog < ApplicationRecord
  validates :start_time_before_type_cast, presence: true, format: { with: /\d{4}-[01]\d-[0-3]\d\ ?T?[0-2]\d:[0-5]\d:[0-5]\d(?:\.\d+)?Z?/, message: "Formato de fecha no valido" }, allow_nil: true, allow_blank: true
  validates :stop_time_before_type_cast, presence: true, format: { with: /\d{4}-[01]\d-[0-3]\d\ ?T?[0-2]\d:[0-5]\d:[0-5]\d(?:\.\d+)?Z?/, message: "Formato de fecha no valido" }, allow_nil: true, allow_blank: true
  validate :end_before_start?, on: :update

  belongs_to :baby
  belongs_to :assistant
  belongs_to :activity

  after_save :set_duration
  after_update :set_duration

  scope :filter_baby, -> (baby_id) { where baby_id: baby_id }
  scope :filter_assistant, -> (assistant_id) { where assistant_id: assistant_id }
  scope :filter_status, lambda {|status| status=='terminada' ? where.not(stop_time: nil) : where(stop_time: nil)}

  private
  def end_before_start?
    if self.stop_time < self.start_time
      errors.add(:stop_time, "Error: no se puede terminar la actividad antes de empezar")
      return false
    end
  end

  def set_duration
    self.update_column(:duration, ((stop_time - start_time)/1.minutes).to_i ) unless stop_time.blank? # This will skip validation gracefully.
  end

end
