class BinaryTree
  attr_accessor :root

  def insert_data(data)
    self.root = insert(data)
  end

  def insert(data, node = self.root)
    if node.nil?
      Node.new(data)
    else
      if data < node.data
        node.left = insert(data, node.left)
      else
        node.right = insert(data, node.right)
      end
      node
    end
  end

  def search(node = self.root)
  end

  def nodes(node = self.root)
    node_array = []

    if node.left
     node_array += nodes(node.left)
    end
    node_array << node
    if node.right 
     node_array += nodes(node.right)
    end

    node_array
  end

  def leaf_nodes(node = self.root)
  end

  def include?(name)
  end

  def find(name)
  end

  def delete(name, node = self.root)
  end
end