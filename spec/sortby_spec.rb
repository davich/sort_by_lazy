require_relative '../lib/sortby'

describe Sortby do
  describe '.sort_by' do
    let(:names) do
      [
        %w[erlangga],
        %w[david carlin],
        %w[david abc],
        %w[david rider 2],
        %w[david rider 3],
        %w[david rider 1],
        %w[angel]
      ]
    end
    let(:first_lambda) { ->(x){ x.fetch(0) } }
    let(:second_lambda) { ->(x){ x.fetch(1) } }
    let(:third_lambda) { ->(x){ x.fetch(2) } }
    let(:fourth_lambda) { ->(x){ x.fetch(3) } }

    it 'sorts names' do
      result = Sortby.sort_by(names, first_lambda, second_lambda, third_lambda, fourth_lambda)
      expect(result).to eq(names.sort)
    end
  end
end
