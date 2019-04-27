class Point:
	def __init__(self, x, y, z, num):
		self.id = num
		self.pos = (x, y, z)
		self.neighbors = set([])

def genMeshList(pointMap):
	usedPoints = set([])
	meshList = []
	count = 0
	for num, point in pointMap.items():
		first = num
		usedNeighbors = set([])
		for neighbor in point.neighbors:
			second = neighbor
			for secondNeighbor in neighbor.neighbors:
				if secondNeighbor in point.neighbors and secondNeighbor not in usedNeighbors:
					if not (first in usedPoints or second in usedPoints or secondNeighbor in usedPoints):
						meshList.append(first)
						meshList.append(0)
						meshList.append(second)
						meshList.append(0)
						meshList.append(third)
						meshList.append(0)
						count += 1
			usedNeighbors.add(neighbor)
		usedPoints.add(num)

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