# The Ruby Gem

The ruby gem currently supports loading and applying a YAML decision tree.  The
following example is from the tests and shows how a YAML fixture file is parsed
into a `BinaryTree` object:

```ruby
tree = TreeThinking::BinaryTreeFactory.from_yaml('./spec/fixtures/simple_tree.yaml')
```

This tree can then be used to get a probability from an answer vector:

```ruby
tree.call({'likes_ice_cream' => 1, 'likes_chocolate' => 0})
#> 0.1
```
