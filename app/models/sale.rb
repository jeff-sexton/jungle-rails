class Sale < ActiveRecord::Base
  validates :name, presence: true
  validates :percent_off, { presence: true, numericality: true }
  validate :valid_sale_dates?

  def self.highest_active
    where(
      'sales.starts_on <= ? AND sales.ends_on > ?',
      Date.current,
      Date.current
    ).order(percent_off: :desc).first
  end

  def self.active
    where(
      'sales.starts_on <= ? AND sales.ends_on > ?',
      Date.current,
      Date.current
    )
  end

  def finished?
    ends_on < Date.current
  end

  def upcoming?
    starts_on > Date.current
  end

  def active?
    !upcoming? && !finished?
  end

  private

  def valid_sale_dates?
    errors.add(:starts_on, 'must be a valid date') if !starts_on.is_a?(Date)
    errors.add(:ends_on, 'must be a valid date') if !ends_on.is_a?(Date)
    if ends_on && starts_on && ends_on < starts_on
      errors.add(:ends_on, 'must be after sale start date')
    end
  end
end
