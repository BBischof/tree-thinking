module TreeThinking
  class BinaryTree
    attr_reader :name
    attr_accessor :tree

    Node = Struct.new(:feature_key, :operator, :threshold, :probablity, :results)

    def initialize(name: nil)
      @name = name
    end

    def call(answer_vector)
      node = self.tree

      while node.probablity.nil? do
        node = node.results.fetch(decision(node, answer_vector))
      end

      node.probablity
    end

    private

    def decision(node, answer_vector)
      case node.operator
      when '=' then answer_vector[node.feature_key] == node.threshold
      when '>' then answer_vector[node.feature_key] > node.threshold
      when '<' then answer_vector[node.feature_key] < node.threshold
      when '>=' then answer_vector[node.feature_key] >= node.threshold
      when '<=' then answer_vector[node.feature_key] <= node.threshold
      else
        answer_vector[node.feature_key] <= node.threshold
      end
    end
  end
end
