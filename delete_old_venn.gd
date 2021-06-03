extends Node2D

var ticks_until_delete = 300
var n = Node2D.new()

func _physics_process(delta):
	ticks_until_delete -= 1
	if (ticks_until_delete <= 0):
		queue_free()
