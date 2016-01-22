class AaibReport < Document

  validates :date_of_occurrence, presence: true, date: true

  FORMAT_SPECIFIC_FIELDS = [
    :date_of_occurrence,
    :aircraft_category,
    :report_type,
    :location,
    :aircraft_type,
    :registration,
  ]

  attr_accessor *FORMAT_SPECIFIC_FIELDS

  def initialize(params = {})
    super(params, FORMAT_SPECIFIC_FIELDS)
  end

  def format
    "aaib_report"
  end

  def self.format
    new.format
  end

  def public_path
    "/aaib-report"
  end
end
