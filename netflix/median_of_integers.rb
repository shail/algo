# We can use a max heap on the left side to represent the elements that are less than the effective median
# and a min heap on the right side to represent eleemnts that are greater
#
# We process an incoming element, the number of elements differ atmost by 1, when the heaps contain the same
# number of elements each, we pick average of heaps root data, when heaps are not balanced, we select
# effective median from the root of heap containing more elements
