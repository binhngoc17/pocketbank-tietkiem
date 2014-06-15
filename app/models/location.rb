require 'csv'
class Location < ActiveRecord::Base
  belongs_to :provider

  def self.accessible_attributes
    ["address","service_time", "lng", "lat",
     "street_number", "local_political",
     "sublocality_political", "route",
     "country_political", "administrative_area_level_1_political",
     "administrative_area_level_2_political",
     "name", "type"]
  end

  def self.import(file)
    spreadsheet = open_spreadsheet(file)

    header = spreadsheet[0]
    (1..spreadsheet.count-1).each do |i|
      row = Hash[[header, spreadsheet[i]].transpose]
      location = find_by_id(row["id"]) || new
      location.attributes = row.to_hash.slice(*accessible_attributes)
      location.save!
    end
  end

  def self.open_spreadsheet(file)
    case File.extname(file.original_filename)
      when ".csv" then ::CSV.read(file.path)
      when ".xls" then Excel.new(file.path, nil, :ignore)
      when ".xlsx" then Excelx.new(file.path, nil, :ignore)
      else raise "Unknown file type: #{file.original_filename}"
    end
  end

end
