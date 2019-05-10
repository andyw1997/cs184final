import numpy as np 
import heapq as pq
from scipy.spatial import KDTree
import math
import operator

class Edge:
	def __init__(self, pointA, pointB, pointC, direction):
		self.a = min(pointA, pointB)
		self.b = max(pointA, pointB)
		self.third = pointC
		self.dir = direction
	def __eq__(self, other):
		return (self.a == other.a and self.b == other.b 
			and self.third == other.third)
	def __hash__(self):
		return hash(self.a)
	def angle_between(self, other):
		return angle(self.dir, other.dir, True)

def angle(v1, v2, acute):
	# v1 is your firsr vector
	# v2 is your second vector
	# print(v1)
	# print(v2)
	# angle = 0
	angle = np.arccos(np.dot(v1, v2) / (np.linalg.norm(v1) * np.linalg.norm(v2)))
	if acute == True:
		return angle
	else:
		return 2 * np.pi - angle

def dis(pointA, pointB = None):
	# find distance between two points
	if pointB is None:
		return 0

	xSquare = pow((pointA.pos[0] - pointB.pos[0]), 2)
	ySquare = pow((pointA.pos[1] - pointB.pos[1]), 2)
	zSquare = pow((pointA.pos[2] - pointB.pos[2]), 2)
	return math.sqrt(xSquare + ySquare + zSquare)

def find_midpoint(pointA, pointB):
	result = []
	for i in range(3):
		result.append((pointA[i] + pointB[i]) / 2)
	return list(result)

def find_diff(pointA, pointB):
	# B - A   so A -> B
	result = []
	for i in range(3):
		result.append(pointB[i] - pointA[i])

	return result

def find_closest_neighbor(pointA, points, exclude_points = [], pointB = None):
	distances = {}
	for p in points:
		if p != pointA and p != pointB and p.id not in exclude_points:
			distance = dis(p, pointA)
			distance += dis(p, pointB)
			
		else:
			distance = float("inf")

		distances[p.id] = distance

	sorted_distance = sorted(distances.items(), key = operator.itemgetter(1))

	return sorted_distance[0], sorted_distance[1]

def find_direction(points, p1_id, p2_id, third_id):
	midpoint = find_midpoint(list(points[p1_id].pos),
	list(points[p2_id].pos))
	return find_diff(midpoint, list(points[third_id].pos))


def find_first_triangle_edges(points):
	# get a line first
	closest_neighbor, _ = find_closest_neighbor(points[0], points)
	closest_neighbor_id = closest_neighbor[0]
	points[0].addNeighbor(points[closest_neighbor_id])
	third_point, _ = find_closest_neighbor(points[0], points, [], points[closest_neighbor_id])
	third_point_id = third_point[0]
	points[0].addNeighbor(points[third_point_id])
	points[closest_neighbor_id].addNeighbor(points[third_point_id])

	pending_edges = []

	mesh = [0, closest_neighbor_id, third_point_id]

	# print("the first triangle: ", mesh)

	for i in range(3):
		edge_index_1 = mesh[(i + 1) % 3]
		edge_index_2 = mesh[(i + 2) % 3]
		third_index = mesh[i]

		# midpoint = find_midpoint(list(points[edge_index_1].pos),
		# 	list(points[edge_index_2].pos))
		# direction = find_diff(midpoint, list(points[third_index].pos))
		direction = find_direction(points, edge_index_1, edge_index_2, third_index)
		edge = Edge(edge_index_1, edge_index_2, third_index, direction)

		pending_edges.append(edge)

	return pending_edges

def process_closest_point(points, edge, point_id, pending_edges, visited_edges):
	points[edge.a].addNeighbor(points[point_id])
	points[edge.b].addNeighbor(points[point_id])

	direction = find_direction(points, edge.a, point_id, edge.b)
	new_edge_1 = Edge(point_id, edge.a, edge.b, direction)

	if (new_edge_1.angle_between(edge) < (np.pi / 180) * 90):
		return None

	if new_edge_1 not in pending_edges and new_edge_1 not in visited_edges:
		# print("add edge 1")
		pending_edges.append(new_edge_1)

	direction = find_direction(points, edge.b, point_id, edge.a)
	new_edge_2 = Edge(point_id, edge.b, edge.a, direction)

	if new_edge_2 not in pending_edges and new_edge_2 not in visited_edges:
		# print("add edge 2")
		pending_edges.append(new_edge_2)

	return pending_edges


def process_next_edge(points, pending_edges, visited_edges):
	edge = pending_edges.pop(0)
	visited_edges.add(edge)
	# fix me if the result is bad
	exclude_points = [edge.third]
	found = False

	while not found:
		point_1_tuple, point_2_tuple = find_closest_neighbor(points[edge.a], points, exclude_points, points[edge.b])
		point_id = point_1_tuple[0]

		# print(point_id)
		if point_id not in exclude_points:
			pending_edges_temp = process_closest_point(points, edge, 
				point_id, pending_edges, visited_edges)
			if pending_edges_temp == None:
				exclude_points.append(point_id)
			else:
				pending_edges = pending_edges_temp
				found = True

	
	# point_id = point_2_tuple[0]

	# if point_id not in exclude_points:
	# 	pending_edges = process_closest_point(points, edge, point_id, pending_edges)

	return pending_edges, visited_edges

def create_mesh(points):
	pending_edges = find_first_triangle_edges(points)
	visited_edges = set([])
	# print(len(points))

	while pending_edges and len(pending_edges) < 3000:
		pending_edges, visited_edges = process_next_edge(points, pending_edges, visited_edges)
		print("length of pending_edges: ", len(pending_edges))
		print("length of visited_edges: ", len(visited_edges))












