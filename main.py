import sys
import random

class Point:
	def __init__(self, x, y, z, num):
		self.id = num
		self.pos = (x, y, z)
		self.neighbors = set([])

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
			meshList.append(p1)
			meshList.append(p2)
			meshList.append(p2)
			meshList.append(p3)
			meshList.append(p3)
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
			
	meshList, subCount = fixMistakes(meshList, triangles, mistakeEdges)
	return meshList, count - subCount

def fixMistakes(meshList, triangles, mistakes):
	badTriangles = set([])
	for tri in triangles:
		e1 = (tri[0], tri[1])
		e2 = (tri[1], tri[2])
		e3 = (tri[2], tri[0])
		e1r = (tri[1], tri[0])
		e2r = (tri[2], tri[1])
		e3r = (tri[0], tri[2])

		if (e1 in mistakes or e1r in mistakes) and (e2 in mistakes or e2r in mistakes) and (e3 in mistakes or e3r in mistakes):
			badTriangles.add(tri)

	newMeshList = []
	count = 0
	print(len(meshList))
	for i in range(0, len(meshList), 6):
		if meshList[i] == meshList[i + 2] or meshList[i + 2] == meshList[i + 4] or meshList[i] == meshList[i + 4]:
			print('WTF')
		candTri = tuple(sorted([meshList[i], meshList[i + 2], meshList[i + 4]]))
		if candTri not in badTriangles:
			newMeshList.extend(meshList[i:i+6])
		else:
			count += 1
	print(count)
	print(len(newMeshList))
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

if __name__ == '__main__':
	inputFile = sys.argv[1]
	outputFile = sys.argv[2]

	pointMap, coordMap = read_dae(inputFile)
	print("Done Read Dae")
	createGraph(pointMap, inputFile)
	print("Done Create Graph")
	meshList, count = genMeshList(pointMap)
	print("Done Gen Mesh List")
	writeMeshList(meshList, count, inputFile, outputFile)
	print("Done Write")
