import sys

class Point:
    def __init__(self, x, y, z, num, normal):
        self.id = num
        self.normal = normal
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
    usedPoints = set([])
    meshList = []
    edges = set([])
    count = 0
    for num in range(len(pointMap)):
        point = pointMap[num]
        first = num
        usedNeighbors = set([])
        for neighbor in point.neighbors:
            second = neighbor
            for secondNeighbor in pointMap[neighbor].neighbors:
                if secondNeighbor in point.neighbors and secondNeighbor not in usedNeighbors:
                    if not (first in usedPoints or second in usedPoints or secondNeighbor in usedPoints):
                        edge1 = (first, second)
                        edge2 = (second, secondNeighbor)
                        edge3 = (secondNeighbor, first)
                        if not(edge1 in edges or edge2 in edges or edge3 in edges):
                            meshList.append(first)
                            meshList.append(first)
                            meshList.append(second)
                            meshList.append(second)
                            meshList.append(secondNeighbor)
                            meshList.append(secondNeighbor)
                            print(first, second, secondNeighbor)
                            edges.add(edge1)
                            edges.add(edge2)
                            edges.add(edge3)
                        else:
                            meshList.append(secondNeighbor)
                            meshList.append(secondNeighbor)
                            meshList.append(second)
                            meshList.append(second)
                            meshList.append(first)
                            meshList.append(first)
                            print(secondNeighbor, second, first)
                            edges.add((first, secondNeighbor))
                            edges.add((secondNeighbor, second))
                            edges.add((second, first))
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

if __name__ == '__main__':
    inputFile = sys.argv[1]
    outputFile = sys.argv[2]

    pointMap = read_dae(inputFile, "Geometry-mesh001-positions-array")
    createGraph(pointMap, inputFile)
    meshList, count = genMeshList(pointMap)
    writeMeshList(meshList, count, inputFile, outputFile)
