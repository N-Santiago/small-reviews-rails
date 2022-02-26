class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def time_lapse(time)
    seconds = Time.now - time 
    minutes = seconds / 60
    hours = minutes / 60
    days = hours / 24
    years = days / 365
    if years >= 1
      "#{years.round(0)} years ago"
    elsif years < 1 && days >= 1
      "#{days.round(0)} days ago"
    elsif hours >= 1 && days < 1 && years < 1
      "#{hours.round(0)} hours ago"
    elsif years < 1 && hours < 1 && days < 1 && minutes >= 1
        "#{minutes.round(0)} minutes ago"
    else
        "#{seconds.round(0)} seconds ago"    
    end
  end

end
