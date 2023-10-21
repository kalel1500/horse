extends Node

#Movimiento del player, ejes de movimiento.
var axis: Vector2

#Funcion par retornar la direccion pulsada
func get_axis() -> Vector2:
	axis.x = int(Input.is_action_pressed("ui_right")) - int(Input.is_action_pressed("ui_left"))
	axis.y = int(Input.is_action_pressed("ui_up")) - int(Input.is_action_pressed("ui_down"))
	return axis.normalized()
