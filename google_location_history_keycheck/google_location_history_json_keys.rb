
require "rubygems"
require "json"

file = File.open("LocationHistory.json", "r")
json = JSON.parse( file.read )

all_location_keys = Array.new
all_activity_keys = Array.new
all_activiti_keys = Array.new
all_extra_keys = Array.new
json['locations'].each do |location|
  all_location_keys = all_location_keys | location.keys
  if location['activitys']
    location['activitys'].each do |activity|
      all_activity_keys = all_activity_keys | activity.keys
      if activity['activities']
        activity['activities'].each do |act|
          all_activiti_keys = all_activiti_keys | act.keys
        end
      end
      if activity['extras']
        activity['extras'].each do |extra|
          all_extra_keys = all_extra_keys | extra.keys
        end
      end
      
    end
  end
end 
 
puts "Location Keys: " + all_location_keys.to_s
puts "Activitys Keys: " + all_activity_keys.to_s
puts "Activities Keys: " + all_activiti_keys.to_s
puts "Extras Keys: " + all_extra_keys.to_s
