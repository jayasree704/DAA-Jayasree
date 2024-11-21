def binary_search(arr, key):
    left, right = 0, len(arr) - 1
    comparisons = 0
    
    while left <= right:
        mid = left + (right - left) // 2
        comparisons += 1
        
        if arr[mid] == key:
            return mid, comparisons
        elif arr[mid] < key:
            left = mid + 1
        else:
            right = mid - 1
            
    return -1, comparisons
# Test cases
arrays = [
    ([5, 10, 15, 20, 25, 30, 35, 40, 45], 20),
    ([10, 20, 30, 40, 50, 60], 50),
    ([21, 32, 40, 54, 65, 76, 87], 32)
]
for arr, key in arrays:
    index, comparisons = binary_search(arr, key)
    print(f"Input: N={len(arr)}, a[]={arr}, search key={key} => Output: {index}, Comparisons: {comparisons}")
