class Job < ApplicationRecord
  validates :title, :level_of_interest, :city, presence: true
  belongs_to :company
  belongs_to :category, optional: true
  has_many :comments

  def self.job_level_of_interest
    interest_range = [(0..10), (11..20), (21..30), 
                      (31..40), (41..50), (51..60), 
                      (61..70), (71..80), (81..90), 
                      (91..100), (101..200)]
    count = interest_range.map { |range| Job.where(:level_of_interest => range).count }
    interest_range.zip(count).reverse
  end

  def self.top_three_companies
    interest_averages = Job.group(:company_id).average(:level_of_interest)
    interest_averages.sort_by {|k,v| v }.reverse.take(3)
  end

  def self.location_count
    group(:city).order('COUNT(id) DESC').count
  end
end
