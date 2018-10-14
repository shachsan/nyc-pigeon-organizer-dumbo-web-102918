def nyc_pigeon_organizer(data)
  pigeon_list = Hash.new
  pigeons=[]
  attributes = data.keys

  data.each do |attr, attr_info|
    attr_info.each do |attr_detail, names|
      pigeons+=names
    end
  end
  unique_pigeons = pigeons.uniq

  unique_pigeons.each do |pigeon|
    attr_hash = Hash.new
    attributes.each do |att_name|
      attr_hash[att_name]= find_specific_attrs(data,pigeon,att_name)
      pigeon_list[pigeon]= attr_hash
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
