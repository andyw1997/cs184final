points = read_dae("dae/cow.dae")

poly_points = []

with open(filename) as file:
    start = False
    count = 0
    for line in file:
        if "<p>" in line:
            data = line.split()

            poly_points.append(int(data[0][3:]))

            for i in range(2, len(data), 2):
                poly_points.append(int[data[i]])

for i in range(0, len(poly_points), 3):
    points[i].neighbors.add(i + 1)
    points[i].neighbors.add(i + 2)

    points[i + 1].neighbors.add(i)
    points[i + 1].neighbors.add(i + 2)

    points[i + 2].neighbors.add(i + 1)
    points[i + 2].neighbors.add(i)

# do something with these points