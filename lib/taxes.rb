require 'pry'
require 'CSV'


class Taxes


def initialize(person, csv_file)
  @person = person
  @csv_file = csv_file
end

def tax_data
    counter = 0
    people = []
    CSV.foreach( @csv_file, headers: true) do |row|
      people[counter] = {}
      people[counter][:first] = "#{row[0]}"
      people[counter][:last] = "#{row[1]}"
      people[counter][:annual_income] = "#{row[2]}"
      people[counter][:tax_paid] = "#{row[3]}"
      people[counter][:tax_rate] = "#{row[4]}"
      counter += 1
    end
    people
end

def tax_calcs(name, tax_data)
  tax_info = tax_data.find |person| do
    person[:first] + person[:last] == name
    binding.pry
  end
end

end


jane = Taxes.new('Jane Doe', 'taxes.csv')
data = jane.tax_data

puts jane.tax_calcs('Jane Doe', data)


