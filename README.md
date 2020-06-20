## Nim Search Algorithm

You can calculate the shortest distance in the Nim language.

It implements the Dijkstra and Bellmanford methods.

### install

```
nimble install nim-searches
```

### Bellman–Ford algorithm

```
import nim-searches

const bellmanTestData = [
    @[0.0, 1.0, 4.0], @[0.0, 2.0, 3.0], @[1.0, 2.0, 1.0], @[1.0, 3.0, 1.0],
    @[1.0, 4.0, 5.0], @[2.0, 5.0, 2.0], @[4.0, 6.0, 2.0], @[5.0, 4.0, 1.0],
    @[5.0, 6.0, 4.0]
]
let bellmanResult = nim_searches.bellman_ford(@bellmanTestData, 7)

assert bellmanResult == @[0.0, 4.0, 3.0, 5.0, 6.0, 5.0, 8.0]
```


### Dijkstra's algorithm

```
import nim-searches

const dijkstraTestData = @[
    @[@[1.0, 4.0], @[2.0, 3.0]],
    @[@[2.0, 1.0], @[3.0, 1.0], @[4.0, 5.0]],
    @[@[5.0, 2.0]],
    @[@[4.0, 3.0]],
    @[@[6.0, 2.0]],
    @[@[4.0, 1.0], @[6.0, 4.0]],
    @[]
]
let dijkstraResult = nim_searches.dijkstra(dijkstraTestData, 7)

assert dijkstraResult == @[0.0, 4.0, 3.0, 5.0, 6.0, 5.0, 8.0]
```