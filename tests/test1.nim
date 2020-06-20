# This is just an example to get you started. You may wish to put all of your
# tests into a single file, or separate them into multiple `test1`, `test2`
# etc. files (better names are recommended, just make sure the name starts with
# the letter 't').
#
# To run these tests, simply execute `nimble test`.

import unittest
import nim_searches

test "bellman ford test":
  const bellmanTestData = [
    @[0.0, 1.0, 4.0], @[0.0, 2.0, 3.0], @[1.0, 2.0, 1.0], @[1.0, 3.0, 1.0],
    @[1.0, 4.0, 5.0], @[2.0, 5.0, 2.0], @[4.0, 6.0, 2.0], @[5.0, 4.0, 1.0],
    @[5.0, 6.0, 4.0]
  ]

  let bellmanResult = nim_searches.bellman_ford(@bellmanTestData, 7)
  check bellmanResult == @[0.0, 4.0, 3.0, 5.0, 6.0, 5.0, 8.0]

test "dijkstra test":
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
  check dijkstraResult == @[0.0, 4.0, 3.0, 5.0, 6.0, 5.0, 8.0]