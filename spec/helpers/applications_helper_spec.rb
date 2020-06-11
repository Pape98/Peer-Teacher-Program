require 'rails_helper'

RSpec.describe ApplicationsHelper, type: :helper do
  describe 'csce_classes' do
    it 'should return an array of the csce_classes' do
      expect(csce_classes).to eq(  [
        ['CSCE-110', 'CSCE-110'],
        ['CSCE-111', 'CSCE-111'],
        ['CSCE-121', 'CSCE-121'],
        ['CSCE-206', 'CSCE-206'],
        ['CSCE-221', 'CSCE-221'],
        ['CSCE-222', 'CSCE-222'],
        ['CSCE-312', 'CSCE-312'],
        ['CSCE-313', 'CSCE-313'],
        ['CSCE-314', 'CSCE-314'],
        ['CSCE-315', 'CSCE-315']
        ])
    end
  end
end
