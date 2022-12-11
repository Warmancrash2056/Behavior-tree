# Base class for all behvior tree nodes thats gets called. 
class_name Root_Behavior_Tree

extends Node

export var debug: = false

func has_bad_children():
	return true
	
func Update_Tick(delta : float , BlackBoard : BlackBoard , results : Behavior_Tree_Results) -> void:
	results.sucess()
	
func break_on_debug() -> void:
	if debug:
		# to get to the code you want to debug, hit F10 till you see
		# a behavior tree node's tick function call.  Then F11 into it.
		breakpoint 
	
