class Baby < ApplicationRecord
  validates :birthday_before_type_cast, format: { with: /\d{4}-[01]\d-[0-3]\d/, message: "Formato de fecha no valido" }, allow_nil: true
  validate :unbirthday, on: [:update, :create]

  has_many :activity_logs

  def age_months
    ((Time.now - birthday.to_time)/1.month.second).round
  end

  private
  def unbirthday
    return if birthday.blank?
     if birthday > Date.today
       errors.add(:birthday, "Fecha de nacimiento mayor al dia de hoy")
       return false
     end
  end

end
