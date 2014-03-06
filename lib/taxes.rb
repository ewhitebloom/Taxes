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
    tax_info = tax_data.find { |person| person[:first] + " " + person[:last] == name }
    calc = tax_info[:tax_paid].to_f - ((tax_info[:tax_rate].to_f * 0.01) * tax_info[:annual_income].to_f)
  end

  def format_currency(currency)
    sprintf('%.2f', currency)
  end

  def feedback(tax_calcs)
    formatted = format_currency(tax_calcs.abs)
    if tax_calcs > 0
      "#{@person} will receive a refund of $#{formatted}"
    else
      "#{@person} owes $#{formatted} in taxes"
    end

  end

end


# jane = Taxes.new('Jane Doe', 'taxes.csv')
# data = jane.tax_data

# calcs = jane.tax_calcs('Jane Doe', data)

# puts jane.feedback(calcs)


