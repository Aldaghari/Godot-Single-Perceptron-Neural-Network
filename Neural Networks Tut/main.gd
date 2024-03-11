extends Node2D

signal wait

const ICON = preload("res://icon.tscn")

var perceptron: Perceptron
var points: Array[Point] = []


func _ready():
	# preceptron
	perceptron = Perceptron.new()
	# point
	points.resize(100)
	create_points()
	
	intial_guess()
	
	

func _process(delta):
	if Input.is_action_just_pressed("run"):
		train()

func create_points():
	for i in range(points.size()):
		points[i] = Point.new()
		

func intial_guess():
	for i in range(points.size()):
		var inputs: PackedFloat32Array = [points[i].x, points[i].y]
		var label: int = points[i].label
		var guess: int = perceptron.guess(inputs)
		
		var icon = ICON.instantiate()
		icon.global_position = Vector2(inputs[0], inputs[1])
		if guess == label:
			icon.set_self_modulate(Color("5daa3b"))
		add_child(icon)
		

func train():
	for i in range(points.size()):
		#await get_tree().create_timer(0.1).timeout
		
		var inputs: PackedFloat32Array = [points[i].x, points[i].y]
		var label: int = points[i].label
		var guess: int = perceptron.guess(inputs)
		perceptron.train(inputs, label)
		
		var icon = ICON.instantiate()
		icon.global_position = Vector2(inputs[0], inputs[1])
		if guess == label:
			icon.set_self_modulate(Color("5daa3b"))
			
		add_child(icon)
