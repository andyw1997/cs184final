def fix_points(points):
    # for p in points:
    #     kill_weird_triangles(p, points)
    for p in points:
        fix_point(p, points)

def kill_weird_triangles(p, points):
    to_disconnect = []
    for n_id in p.neighbors:
        neighbor = points[n_id]
        triangle_count, other_point = count_num_neighboring_triangles(p, neighbor, points)
        if triangle_count == 1:
            other_edge_1 = count_num_neighboring_triangles(p, other_point, points)
            other_edge_2 = count_num_neighboring_triangles(neighbor, other_point, points)
            if other_edge_1[0] > 2 or other_edge_2[0] > 2:
                to_disconnect.append(neighbor)

    for neighbor in to_disconnect:
        disconnect(p, neighbor)

def count_num_neighboring_triangles(point_a, point_b, points):
    triangle_count = 0
    point = None
    for n_id in point_a.neighbors:
        if n_id != point_b.id:
            neighbor = points[n_id]
            if point_b.id in neighbor.neighbors:
                triangle_count += 1
                point = neighbor
    return triangle_count, neighbor

def fix_point(p, points):
    for n_id in p.neighbors:
        check_point_and_connect_closest_neighbors_from(points[n_id], p, points)

def check_point_and_connect_closest_neighbors_from(a, b, points):
    closest_points = [(999, None), (999, None)]
    triangle_count = 0
    a_id = a.id
    for n_id in a.neighbors:
        if n_id != a.id:
            neighbor = points[n_id]
            if a_id in neighbor.neighbors:
                triangle_count += 1
                continue
            closest_points = replace_if_smaller(closest_points, (sq_dist(a, neighbor), neighbor))

    # assert triangle_count <= 2, "Edge between {}, {} is part of {} triangles".format(a, b, triangle_count)
    assert len(a.neighbors) >= 3, "Point {} only has {} neighbors".format(a, len(a.neighbors))
    
    for i in range(2 - triangle_count):
        point = closest_points[i][1]
        connect(b, point)

def connect(a, b):
    a.neighbors.add(b.id)
    b.neighbors.add(a.id)

def disconnect(a, b):
    a.neighbors.remove(b.id)
    b.neighbors.remove(a.id)

def replace_if_smaller(list_of_points, new_point):
    for i in range(len(list_of_points)):
        if new_point[0] < list_of_points[i][0]:
            break
    if i >= 2:
        return list_of_points
    elif i == 1:
        return [list_of_points[0], new_point]
    else:
        return [new_point, list_of_points[0]]

def sq_dist(point_a, point_b):
    x = point_a.pos[0] - point_b.pos[0]
    y = point_a.pos[1] - point_b.pos[1]
    z = point_a.pos[2] - point_b.pos[2]
    return x*x + y*y + z*z