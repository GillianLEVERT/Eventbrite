class Event < ApplicationRecord
    has_one_attached :event_picture
    before_validation :is_past?
    before_validation :is_positif_and_multiple_of_5?
    validates :start_date, presence: true
    validates :duration, presence: true
    validates :title, presence: true, length: { minimum: 5, maximum: 140 }
    validates :description, presence: true, length: { minimum: 20, maximum: 1000 }
    validates :price, presence: true, numericality: { greater_than: 0, less_than: 1001 }
    validates :location, presence: true
    has_many :attendances
    has_many :customers, class_name: 'User', through: :attendances
    belongs_to :admin, class_name: 'User'
  
    def is_past?
      if self.start_date == nil || self.start_date < Time.now
        return errors.add(:start_date, 'Invalid date')
      end
    end
  
    def is_positif_and_multiple_of_5?
      if self.duration == nil || self.duration < 0 || self.duration % 5 != 0
        return errors.add(:duration, 'Cant be ça, change moi ca de suite, batard(e)(non-binaire batard)')
      end
    end
  
    def end_date
      self.start_date + self.duration * 60
    end
  
    def display_date(date)
      date.strftime('le %d/%m/%Y à %H:%M')
    end
  
    
  end