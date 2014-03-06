require 'rspec'
require_relative '../lib/taxes.rb'

describe Taxes do
  let(:person) { Taxes.new(name, csv_file)}

  it 'calculates taxes owed or amount of refund' do
   person.taxes = person.tax_paid - person.annual_income * person.tax_rate
  end

  it 'returns a refund' do
   expect(person.tax_calcs.to be > 0 )
  end

  it 'returns taxes owed' do
   expect(person.tax_calcs.to be < 0 )
  end

end
