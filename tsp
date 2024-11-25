from itertools import permutations
import math
# Function to find the convex hull using brute force
def convex_hull(points):
    def orientation(p, q, r):
        return (q[1] - p[1]) * (r[0] - q[0]) - (q[0] - p[0]) * (r[1] - q[1])
    n = len(points)
    if n < 3:
        return []
    hull = []
    for i in range(n):
        for j in range(n):
            if i != j:
                for k in range(n):
                    if k != i and k != j:
                        if orientation(points[i], points[j], points[k]) < 0:
                            break
                else:
                    hull.append(points[i])
                    break
    return list(set(hull))
# Test case for convex hull
points = [(1, 1), (4, 6), (8, 1), (0, 0), (3, 3)]
hull = convex_hull(points)
print("Convex Hull:", hull)
# Function to calculate distance between two cities
def distance(city1, city2):
    return math.sqrt((city1[0] - city2[0]) ** 2 + (city1[1] - city2[1]) ** 2)
# Function to solve TSP using exhaustive search
def tsp(cities):
    min_distance = float('inf')
    shortest_path = []
    for perm in permutations(cities[1:]):
        current_path = [cities[0]] + list(perm) + [cities[0]]
        current_distance = sum(distance(current_path[i], current_path[i + 1]) for i in range(len(current_path) - 1))
        if current_distance < min_distance:
            min_distance = current_distance
            shortest_path = current_path
    return min_distance, shortest_path
# Test cases for TSP
test_case_1 = [(1, 2), (4, 5), (7, 1), (3, 6)]
test_case_2 = [(2, 4), (8, 1), (1, 7), (6, 3), (5, 9)]
# Results for test case 1
distance_1, path_1 = tsp(test_case_1)
print("Test Case 1:")
print("Shortest Distance:", distance_1)
print("Shortest Path:", path_1)
# Results for test case 2
distance_2, path_2 = tsp(test_case_2)
print("Test Case 2:")
print("Shortest Distance:", distance_2)
print("Shortest Path:", path_2)
