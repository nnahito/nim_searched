proc bellman_ford*(edges: seq[seq[float64]], vertexNum: int): seq[float64] =
  ## use the Bellman-Ford method to find the shortest path.
  ## 
  ## edges ... [starting point, ending point, const]
  ## vertexNum ... Number of Vertices

  # Set higher value as the initial value (初期値として大きな値をセット)
  var destination: seq[float64]
  for i in 0..vertexNum - 1:
    destination.add(99999999.0)

  # Since the beginning of the array is the starting point, we set the cost to zero.(配列の最初はスタート地点なのでコストを0にする)
  destination[0] = float64(0)

  # Run as long as costs can be updated
  var changed = true
  while changed:
    changed = false

    # Calculate costs for each node
    for edge in edges:
      # Calculates as many nodes as extend from each vertex
      let edgeLen = len(edge)
      for node in 0..edgeLen - 1:
        if destination[int(edge[1])] > (destination[int(edge[0])] + edge[2]):
          destination[int(edge[1])] = destination[int(edge[0])] + edge[2]
          changed = true
  
  return destination
  

proc dijkstra*(edges: seq[seq[seq[float64]]], vertexNum: int): seq[float64] =
  ## use the Dijkstra method to find the shortest route.
  ## 
  ## edges ... [starting point, ending point, const]
  ## vertexNum ... Number of Vertices

  # Set higher value as the initial value (初期値として大きな値をセット)
  var destination: seq[float64]
  for i in 0..vertexNum - 1:
    destination.add(99999999.0)
  # Since the beginning of the array is the starting point, we set the cost to zero.(配列の最初はスタート地点なのでコストを0にする)
  destination[0] = float64(0)

  var queue: seq[int]
  for i in 0..vertexNum - 1:
    queue.add(i)
  
  while len(queue) > 0:
    # Find the lowest cost vertex
    var r = queue[0]
    for i in queue:
      if destination[i] < destination[r]:
        r = i

    let u = queue[queue.find(r)]
    queue.delete(queue.find(r))

    for edge in edges[u]:
      if destination[int(edge[0])] > (destination[u] + edge[1]):
        destination[int(edge[0])] = destination[u] + edge[1]

    
  return destination