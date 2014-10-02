require 'rails_helper'

describe Instrument, type: :model do
  context 'validations' do
    let(:instrument) { create :instrument, reference: 'MUL001' }

    it 'requires reference to be present' do
      expect(instrument).to validate_presence_of :reference
    end

    it 'requires description to be present' do
      expect(instrument).to validate_presence_of :description
    end

    it 'requires reference to be unique' do
      expect(instrument).to validate_uniqueness_of :reference
    end
  end
end
