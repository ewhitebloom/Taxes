require 'rspec'

require_relative '../lib/taxes.rb'

describe Taxes do
  let(:person) { Taxes.new("Jane Doe", '../lib/taxes.csv') }
  let(:data) {  person.tax_data }

  it 'calculates tax absolute value for one person' do
   person.tax_calcs("Jane Doe", data)
 end

 it 'returns a refund' do
  expect(person.tax_calcs(@person, @csv_file).to be > 0 )
 end

 it 'returns taxes owed' do
   expect(person.tax_calcs(@person, @csv_file).to be < 0 )
 end

end
