require 'spec_helper'

RSpec.describe Graphs::Graph do
  describe '#ctor' do
    it 'creates graph with vertices' do
      harry = 'Harry Potter'
      vertex = Vertex.new(harry)
      expect(Graph.new([vertex]).vertices.first.value).to eq(harry)
    end
  end
end
