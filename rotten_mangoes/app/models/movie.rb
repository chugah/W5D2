class Movie < ActiveRecord::Base
  
  attr_accessible :description, :director, :poster_image_url, 
                  :release_date, :runtime_in_minutes, :title
  
  
  validates :title, presence: true
  validates :director, presence: true
  validates :runtime_in_minutes, numericality: {only_integer: true}
  validates :poster_image_url, presence: true
  validate :release_date_is_in_the_past
  
  protected
  
  def release_date_is_in_the_past
    if release_date.present?
      errors.add(:release_date, "should be in the past") if release_date > Time.current
    end
  end 
end
