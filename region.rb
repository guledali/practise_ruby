class Region
  attr_accessor :first_to_quarter
  attr_accessor :last_application_date

  def initialize(name:, description:, qualification:, last_application_date:)
    @name = name
    @description = description
    @qualification = qualification
    @last_application_date = last_application_date
    @first_to_quarter ||= false
  end

  def last_application_date
    @last_application_date
  end

  def assign_first_to_quarter
    if last_application_date_blank?
      self.first_to_quarter = true
    end
  end

  private

  def last_application_date_blank?
    self.last_application_date.empty? || self.last_application_date.nil?
  end
end
