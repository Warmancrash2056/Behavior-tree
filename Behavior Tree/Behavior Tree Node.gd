class_name Behavior_Tree_Node
extends Node

export var debug: bool = false

func has_bad_Children():
	return true
	
func Update_Tick( delta : float , BlackBoard: BlackBoard , result:Behavior ):
