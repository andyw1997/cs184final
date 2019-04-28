import sys
import random

class Point:
	def __init__(self, x, y, z, num):
		self.id = num
		self.pos = (x, y, z)
		self.neighbors = set([])

def read_dae(filename, array_name = "Geometry-Mesh-positions-array"):
	points = []
	with open(filename) as file:
		start = False
		count = 0
		for line in file:
			if start:
				if "float_array" in line:
					start = False
					break

				nums = line.split()
				if len(nums) != 3:
					print("help sir this line doesn't have 3 floats :(")
				points.append(Point(float(nums[0]), float(nums[1]), float(nums[2]), count))
				count += 1
				
			elif "<float_array id=\"{}\"".format(array_name) in line:
				start = True

	return points

def createGraph(points, filename):
	poly_points = []
	with open(filename) as file:
		start = False
		count = 0
		for line in file:
			if "<p>" in line:
				data = line.split()

				poly_points.append(int(data[0][3:]))

				for i in range(2, len(data), 2):
					poly_points.append(int(data[i]))

  
	print(len(poly_points) % 3)
	print(len(points))
	for i in range(0, len(poly_points), 3):
		print(poly_points[i:i+3])
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
	queue = [firstEdge]
	count = 0
	while len(queue) > 0:
		print(count)
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
			
	return meshList, count

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

	pointMap = read_dae(inputFile, "Geometry-mesh001-positions-array")
	createGraph(pointMap, inputFile)
	meshList, count = genMeshList(pointMap)
	writeMeshList(meshList, count, inputFile, outputFile)
