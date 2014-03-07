require 'rspec'

require_relative '../lib/taxes.rb'

describe Taxes do
  let(:person) { Taxes.new('Jane', 'Doe', 140000, 30000, 40) }
  let(:tax_calcs) { person.tax_calcs }
  let(:tolerance) { 0.0001 }

  it 'calculates tax absolute value for one person' do
   expect(tax_calcs).to be_within(tolerance).of(-26000.00)
 end

 it 'returns a refund or taxes owed' do

    expect(person.feedback(tax_calcs) == "Jane Doe owes $#{person.format_currency(tax_calcs.abs)} in taxes" )
  end
end

end
