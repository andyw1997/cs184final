import sys
import random
import prims
import closest_points
import postprocess
import wenyuan

class Point:
	def __init__(self, x, y, z, num):
		self.id = num
		self.pos = (x, y, z)
		self.neighbors = set([])
	def __eq__(self, other):
		return other != None and self.id == other.id
	def __lt__(self, other):
		return self.id < other.id
	def __hash__(self):
		return hash(self.pos)
	def addNeighbor(self, other):
		self.neighbors.add(other.id)
		other.neighbors.add(self.id)
	def hasNeighbor(self, other):
		return self.id in other.neighbors and other.id in self.neighbors

def read_dae(filename):
	points = []
	coordMap = {}
	with open(filename) as file:
		start = False
		count = 0
		for line in file:
			if start:
				if "</float_array" in line:
					start = False
					break

				nums = line.split()
				if len(nums) != 3:
					print("help sir this line doesn't have 3 floats :(")
				newPoint = Point(float(nums[0]), float(nums[1]), float(nums[2]), count)
				points.append(newPoint)
				coordMap[(float(nums[0]), float(nums[1]), float(nums[2]))] = newPoint
				count += 1
				
			elif "<float_array" in line and "positions" in line:
				start = True

	return points, coordMap

def createGraph(points, filename):
	poly_points = []
	with open(filename) as file:
		start = False
		count = 0
		for line in file:
			if "<p>" in line:

				data = line.replace("<p> ", "").replace("<p>", "").replace("</p>", "").split()

				for i in range(0, len(data), 2):
					poly_points.append(int(data[i]))

	for i in range(0, len(poly_points), 3):
		points[poly_points[i]].neighbors.add(poly_points[i + 1])
		points[poly_points[i]].neighbors.add(poly_points[i + 2])

		points[poly_points[i + 1]].neighbors.add(poly_points[i])
		points[poly_points[i + 1]].neighbors.add(poly_points[i + 2])

		points[poly_points[i + 2]].neighbors.add(poly_points[i + 1])
		points[poly_points[i + 2]].neighbors.add(poly_points[i])


def genMeshList(pointMap):

	meshList = []
	firstEdge = (0, random.sample(pointMap[0].neighbors, 1)[0])
	triangles = set([])
	edges = set([firstEdge])
	mistakeEdges = set([])
	queue = [firstEdge]
	count = 0
	while len(queue) > 0:
		edge = queue.pop(0)
		p1 = edge[0]
		p2 = edge[1]
		p3 = -1

		triangle = tuple(sorted([p1, p2, p3]))
		for neighbor in pointMap[p1].neighbors:
			if neighbor in pointMap[p2].neighbors:
				p3 = neighbor
				triangle = tuple(sorted([p1, p2, p3]))
				if triangle not in triangles:
					break

		if triangle not in triangles:
			if (p1, p2) in edges:
				mistakeEdges.add((p1, p2))
			if (p2, p3) in edges:
				mistakeEdges.add((p2, p3))
			if (p3, p1) in edges:
				mistakeEdges.add((p3, p1))
		
			meshList.append(p1)
			meshList.append(1)
			meshList.append(p2)
			meshList.append(2)
			meshList.append(p3)
			meshList.append(3)
			edges.add((p1, p2))
			edges.add((p2, p3))
			edges.add((p3, p1))

			triangles.add(triangle)
			count += 1

			if (p3, p2) not in edges and (p3, p2) not in queue:
				queue.append((p3, p2))
			if (p2, p1) not in edges and (p2, p1) not in queue:
				queue.append((p2, p1))
			if (p1, p3) not in edges and (p1, p3) not in queue:
				queue.append((p1, p3))
			
	#meshList, subCount = fixMistakes(meshList, triangles, mistakeEdges)
	return meshList, count

def fixMistakes(meshList, triangles, mistakes):
	badTriangles = set([])
	for tri in triangles:
		e1 = (tri[0], tri[1])
		e2 = (tri[1], tri[2])
		e3 = (tri[2], tri[0])
		e1r = (tri[1], tri[0])
		e2r = (tri[2], tri[1])
		e3r = (tri[0], tri[2])

		badCount = 0
		if (e1 in mistakes or e1r in mistakes):
			badCount +=1
		if (e2 in mistakes or e2r in mistakes):
			badCount +=1
		if (e3 in mistakes or e3r in mistakes):
			badCount +=1
		
		if badCount > 2:
			badTriangles.add(tri)

	newMeshList = []
	count = 0
	print("num elems in meshList", len(meshList) / 6)
	for i in range(0, len(meshList), 6):
		if meshList[i] == meshList[i + 2] or meshList[i + 2] == meshList[i + 4] or meshList[i] == meshList[i + 4]:
			print('WTF')
		candTri = tuple(sorted([meshList[i], meshList[i + 2], meshList[i + 4]]))
		if candTri not in badTriangles:
			newMeshList.extend(meshList[i:i+6])
		else:
			count += 1
	print("num mistakes", count)
	print("num elems in newMeshList", len(newMeshList) / 6)
	return newMeshList, count

def writeMeshList(meshList, count, inFile, outFile):
	orig = open(inFile, "r")
	mod = open(outFile, "w+")

	for line in orig:
		if "<polylist" in line:
			mod.write('<polylist material="Material-Default" count="' + str(count) + '">\n')
		elif "<vcount>" in line:
			mod.write('<vcount>')
			for i in range(count):
				mod.write('3 ')
			mod.write('</vcount>\n')
		elif "<p>" in line:
			mod.write('<p>')
			for vertex in meshList:
				mod.write(str(vertex) + " ")
			mod.write('</p>\n')
		else:
			mod.write(line)

def checkManifolds(meshList):
	edges = {}
	singleManifold = 0
	doubleManifold = 0
	tripleManifold = 0
	for i in range(0, len(meshList), 6):
		e1 = (min(meshList[i], meshList[i+2]), max(meshList[i], meshList[i+2]))
		e2 = (min(meshList[i], meshList[i+4]), max(meshList[i], meshList[i+4]))
		e3 = (min(meshList[i+4], meshList[i+2]), max(meshList[i+4], meshList[i+2]))

		if e1 in edges.keys():
			edges[e1] += 1
		else:
			edges[e1] = 1

		if e2 in edges.keys():
			edges[e2] += 1
		else:
			edges[e2] = 1

		if e3 in edges.keys():
			edges[e3] += 1
		else:
			edges[e3] = 1

	for i in range(0, len(meshList), 6):
		e1 = (min(meshList[i], meshList[i+2]), max(meshList[i], meshList[i+2]))
		e2 = (min(meshList[i], meshList[i+4]), max(meshList[i], meshList[i+4]))
		e3 = (min(meshList[i+4], meshList[i+2]), max(meshList[i+4], meshList[i+2]))
		badEdges = 0
		if edges[e1] > 2:
			badEdges += 1
		if edges[e2] > 2:
			badEdges += 1
		if edges[e3] > 2:
			badEdges += 1

		if badEdges == 1:
			singleManifold += 1
		if badEdges == 2:
			doubleManifold +=1
		if badEdges == 3:
			tripleManifold +=1

	print("single", singleManifold)
	print("double", doubleManifold)
	print("triple", tripleManifold)
	count = 0
	for edge in edges.keys():
		if edges[edge] > 2:
			count+=1
	print(count)

if __name__ == '__main__':
	inputFile = sys.argv[1]
	outputFile = sys.argv[2]

	pointMap, coordMap = read_dae(inputFile)
	print("Done Read Dae")
	# closest_points.connect_closest(pointMap, coordMap, 6, 0.2)
	wenyuan.create_mesh(pointMap)
	# prims.runPrims(pointMap, coordMap, 10, 100)
	#createGraph(pointMap, inputFile)
	print("Done Create Graph")
	meshList, count = genMeshList(pointMap)
	print("Done Gen Mesh List")
	#checkManifolds(meshList)
	writeMeshList(meshList, count, inputFile, outputFile)
	print("Done Write")