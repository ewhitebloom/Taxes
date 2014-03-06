require 'rspec'

require_relative '../lib/taxes.rb'

describe Taxes do
  let(:person) { Taxes.new('Jane Doe', '../lib/taxes.csv') }
  let(:data) {  person.tax_data }
  let(:tax_calcs) { person.tax_calcs('Jane Doe', data) }

  it 'calculates tax absolute value for one person' do
   person.tax_calcs('Jane Doe', data)
 end

 it 'returns a refund or taxes owed' do
  if tax_calcs > 0.0
    expect(person.feedback(tax_calcs) == "Jane Doe will receive a refund of $#{formatted}")
  elsif tax_calcs < 0.0
    expect(person.feedback(tax_calcs) == "Jane doe owes $#{formatted} in taxes" )
  end
end

end
