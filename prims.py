import numpy as np 
import heapq as pq
from scipy.spatial import KDTree

def runPrims(points, coords, countLim, nearestLim):
	allCoords = list(coords.keys())
	tree = KDTree(allCoords)
	queue = []
	inQueue = set([])
	inMST = set([])
	seedQueue(queue, tree, points, coords, inMST, inQueue, allCoords)
	
	edges = 0
	while len(queue) > 0:
		print(len(queue))
		v = pq.heappop(queue)[1]
		if v in inMST:
			continue

		distances, ndx = tree.query(v.pos, k=nearestLim)
		count = 0
		for i in range(1, len(ndx)):
			pos = ndx[i]
			if pos >= len(allCoords):
				continue
			dist = distances[i]
			point = coords[tuple(allCoords[pos])]
			if point in inMST and count < countLim:
				count+=1
				edges+=1
				point.neighbors.add(v.id)
				v.neighbors.add(point.id)
			else:
				pq.heappush(queue, (dist, point))
		inMST.add(v)
	print("points", len(points))
	
def seedQueue(queue, tree, points, coords, inMST, inQueue, allCoords):
	first = points[0]
	distances, ndx = tree.query(first.pos, k=7)
	second = coords[allCoords[ndx[1]]]
	third = coords[allCoords[ndx[2]]]

	first.neighbors.add(second.id)
	first.neighbors.add(third.id)
	inMST.add(first)
	second.neighbors.add(first.id)
	second.neighbors.add(third.id)
	inMST.add(second)
	third.neighbors.add(first.id)
	third.neighbors.add(second.id)
	inMST.add(third)

	for i in range(3, len(ndx)):
		pos = ndx[i]
		if pos >= len(allCoords):
			continue
		dist = distances[i]
		point = coords[tuple(allCoords[pos])]
		pq.heappush(queue, (dist, point))
		inQueue.add(point)
		