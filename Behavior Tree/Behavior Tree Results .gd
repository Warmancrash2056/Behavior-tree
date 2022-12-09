class_name Behavior_Tree_Results

extends Reference
# Base class for pulling resoiurces throuhghout the system.
 # Read More in the docs {Reference Extension }


enum System_Check {
	Sucess,
	Failure,
	Running
	
}

var results: int = System_Check.Failure

var running_node: Node

func Set_Sucesss() -> void:
	results = System_Check.Sucess
	running_node = null
	
func Set_failure() -> void:
	results = System_Check.Failure
	running_node = null
	
func Set_Running(n:Node) -> void:
	results = System_Check.Running
	running_node = n
	
func Is_Suceeding() -> bool:
	return results == System_Check.Sucess
	
func Is_Failing() -> bool:
	return results == System_Check.Failure
	
func Is_Running() -> bool:
	return results == System_Check.Running
