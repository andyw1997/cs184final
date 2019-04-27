def read_dae(filename):
    points = {}
    with open(filename) as file:
        start = False
        count = 0
        for line in file:
            if start:
                if "float_array" in line:
                    start = False
                    continue

                nums = line.split()
                if len(nums) != 3:
                    print("help sir this line doesn't have 3 floats :(")
                points[count] = Point(float(nums[0]), float(nums[1]), float(nums[2]), count)

                count += 1
                
            elif "<float_array id=\"Geometry-Mesh-positions-array\"" in line:
                start = True

    return points