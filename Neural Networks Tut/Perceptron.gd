extends Node
class_name Perceptron


var weights: PackedFloat32Array
var learning_rate: float = 0.1

func _init():
	weights.resize(2)
	for i in range(weights.size()):
		weights[i] = randf_range(-1, 1)


func guess(inputs: PackedFloat32Array) -> int:
	var sum: float = 0.0
	for i in range(inputs.size()):
		sum += inputs[i]*weights[i]
	
	if sum >= 0:
		sum = 1
	else:
		sum = -1
	#sum = sin(sum)
	return sum
	

func train(inputs: PackedFloat32Array, target: int):
	var guess: int = guess(inputs)
	var error: int = target - guess
	
	for i in range(weights.size()):
		weights[i] += error * inputs[i] * learning_rate
