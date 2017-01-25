require 'yaml'

module TreeThinking
  class BinaryTreeFactory
    attr_reader :tree

    def self.from_yaml(path)
      new(YAML.load(File.read(path))).build!
    end

    def initialize(tree)
      @tree = tree
    end

    def build!
      btree = BinaryTree.new(name: tree['tree_key'])
      btree.tree = nodify(tree['nodes'])
      btree
    end

    private

    def nodify(attrs)
      BinaryTree::Node.new(
        attrs['feature_key'],
        attrs['operator'],
        attrs['threshold'],
        attrs['probability'],
        Hash[attrs.fetch('results', {}).map do |return_val, child_node|
          [return_val, nodify(child_node)]
        end]
      )
    end
  end
end
