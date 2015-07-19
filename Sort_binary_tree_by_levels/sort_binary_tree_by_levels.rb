class TreeNode
  attr_accessor :left
  attr_accessor :right
  attr_accessor :value
end

def tree_by_levels(node)
  stack=[]
  stack.push node if node
  stack.each do |n|
    stack.push n.left if n.left
    stack.push n.right if n.right
  end
  stack.map!(&:value)
end

def tree_by_levels(node)
  tree_list, path = [], []

  while node
    tree_list << node.value
    path << node.left if node.left
    path << node.right if node.right
    node = path.shift
  end

  tree_list
end

### Test

root = TreeNode.new
root.value = 0

n1 = TreeNode.new
n1.value = 1

n2 = TreeNode.new
n2.value = 2

n3 = TreeNode.new
n3.value = 3

n4 = TreeNode.new
n4.value = 4

root.left = n1
root.right = n2
n1.right = n3
n2.left = n4

puts "Correct!" if tree_by_levels(root) == [0, 1, 2, 3, 4]
