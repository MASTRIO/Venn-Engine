# Extends
extends Node2D

# Variables
export var amount_to_rotate = 10
export var amount_to_move = 0
var times_diagram_created = 0
var base
var new_pos
var diagram_rotation

# _ready function
func _ready():
	# Variables
	base = get_node("VennDiagram")
	new_pos = base.position.x
	diagram_rotation = 0
	var times_to_generate = 100
	# While Loop
	while (true):
		yield(get_tree().create_timer(0.03), "timeout")
		create_new_diagram()
		times_to_generate -= 1

func create_new_diagram():
	# Variables
	var scene = preload("res://venn.tscn")
	var node = scene.instance()
	# Code
	new_pos += amount_to_move
	node.set_position(Vector2(new_pos, base.position.y))
	diagram_rotation += amount_to_rotate
	node.set_rotation(diagram_rotation)
	node.add_to_group("Diagrams")
	add_child(node)
	# Completed loop
	times_diagram_created += 1
	#print("Created Venn Diagram no.", times_diagram_created)
