require 'spec_helper'

RSpec.describe ApiWrapperSkeleton::Helpers do
  describe '.camelize_string' do
    let(:expected_transformations) do
      {
        'thing' => 'Thing',
        'another_thing' => 'AnotherThing',
        'URL_thing' => 'URLThing'
      }
    end

    it 'returns a camel-cased string' do
      expected_transformations.each do |original, expected|
        result = ApiWrapperSkeleton::Helpers.camelize_string(original)

        expect(result).to eq expected
      end
    end
  end
end
