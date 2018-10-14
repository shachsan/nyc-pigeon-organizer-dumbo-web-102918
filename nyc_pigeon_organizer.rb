def nyc_pigeon_organizer(data)
  pigeon_list = Hash.new {|h,k| h[k] = h.class.new(&h.default_proc) }
  pigeons=[]
  attributes = data.keys


  data.each do |attr, attr_info|
    attr_info.each do |attr_detail, names|
      pigeons+=names
    end
  end
  unique_pigeons = pigeons.uniq

  unique_pigeons.each do |pigeon|
    attributes.each do |att_name|
      pigeon_list[pigeon][att_name]=find_specific_attrs(data,pigeon,att_name)
    end
  end
  pigeon_list
end

def find_specific_attrs(data,pigeon,att_name)
  specific_arr=[]
  data.each do |attr, attr_info|
    if attr == att_name
      attr_info.each do |attr_detail, names|
        if names.include?(pigeon)
          specific_arr << attr_detail.to_s
        end
      end
    end
  end

  return specific_arr
end

pigeon_data = {
  :color => {
    :purple => ["Theo", "Peter Jr.", "Lucky"],
    :grey => ["Theo", "Peter Jr.", "Ms. K"],
    :white => ["Queenie", "Andrew", "Ms. K", "Alex"],
    :brown => ["Queenie", "Alex"]
  },
  :gender => {
    :male => ["Alex", "Theo", "Peter Jr.", "Andrew", "Lucky"],
    :female => ["Queenie", "Ms. K"]
  },
  :lives => {
    "Subway" => ["Theo", "Queenie"],
    "Central Park" => ["Alex", "Ms. K", "Lucky"],
    "Library" => ["Peter Jr."],
    "City Hall" => ["Andrew"]
  }
}

p nyc_pigeon_organizer(pigeon_data)
