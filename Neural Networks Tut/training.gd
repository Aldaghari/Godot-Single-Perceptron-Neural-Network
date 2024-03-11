extends Node

class_name Point


var x: float = 0.0
var y: float = 0.0
var label: int = 0

func _init():
	x = randf_range(0.0, ProjectSettings.get_setting("display/window/size/viewport_width"))
	y = randf_range(0.0, ProjectSettings.get_setting("display/window/size/viewport_height"))
	
	if (x > y):
		label = 1
	else:
		label = -1
		
