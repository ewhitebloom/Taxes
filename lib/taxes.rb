require 'CSV'

class Taxes

  def initialize(first, last, annual_income, tax_paid, tax_rate)
    @first = first
    @last = last
    @annual_income = annual_income
    @tax_paid = tax_paid
    @tax_rate = tax_rate
  end

  def tax_calcs
    @tax_paid.to_f - ((@tax_rate.to_f * 0.01) * @annual_income.to_f)
  end

  def format_currency(currency)
    sprintf('%.2f', currency)
  end

  def feedback(tax_calcs)
    formatted = format_currency(tax_calcs.abs)
    if tax_calcs > 0
      "#{@first+ " "+ @last} will receive a refund of $#{formatted}"
    else
      "#{@first+ " "+ @last} owes $#{formatted} in taxes"
    end
  end

end

people = []
CSV.foreach( 'taxes.csv', headers: true) do |row|
  people << Taxes.new(row["first_name"], row["last_name"], row["annual_income"], row["tax_paid"], row["tax_rate"])
end

def brains(people_objects)
  stuff = []
  people_objects.each { |person| stuff << person.feedback(person.tax_calcs) }
  stuff
end

feed = brains(people)
feed.each{ |person_feedback| puts person_feedback }
