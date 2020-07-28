class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def time_lapse(time)
    seconds = Time.now - time 
    minutes = seconds / 60
    hours = seconds / 360
    days = seconds / 8640
    if days >= 1
      "#{days.round(0)} days ago"
    elsif hours >= 1 && days < 1
      "#{hours.round(0)} hours ago"
    elsif hours < 1 && days < 1 && minutes >= 1
        "#{minutes.round(0)} minutes ago"
    else
        "#{seconds.round(0)} seconds ago"    
    end
  end

end
