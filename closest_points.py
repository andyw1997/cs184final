import postprocess as pp
from scipy.spatial import KDTree

def connect_closest(points, coords, num_connections = 5, leniency = 0.2):
    all_coords = list(coords.keys())
    tree = KDTree(all_coords)
    
    for i in range(len(all_coords)):
        point = all_coords[i]
        distances, neighbors = tree.query(point, k=num_connections + 1)
        max_dist = max(distances) * (1.0 + leniency)
        neighbors = tree.query_ball_point(point, max_dist)
        for pos in neighbors:
            if pos != i:
                neighbor = coords[tuple(all_coords[pos])]
                pp.connect(coords[point], neighbor)