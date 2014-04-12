require 'rspec'
require_relative '../app'

describe StringParser do

  let(:string)        { 'bananas' }
  let(:pattern)       { 'ans' }
  let(:semi_pattern)  { 'axys' }
  let(:wrong_pattern) { 'xyz' }

  context 'when string contains pattern' do
    before do
      @parser = StringParser.new(string, pattern)
    end

    describe '#parse_string' do
      it 'returns a string based on the whole pattern' do
        expect(@parser.parse).to eq 'aaannsb'
      end
    end
  end

  context 'when string contains pattern partially' do
    before do
      @parser = StringParser.new(string, semi_pattern)
    end

    it 'returns a string based just in the matching letters' do
      expect(@parser.parse).to eq 'aaasbnn'
    end
  end

  context 'when string does not contain patter' do
    before do
      @parser = StringParser.new(string, wrong_pattern)
    end

    it 'returns nil' do
      expect(@parser.parse).to be_nil
    end
  end
end

