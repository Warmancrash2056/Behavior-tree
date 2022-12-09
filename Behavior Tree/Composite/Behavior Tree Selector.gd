extends Behavior_Tree_Base_Node

class_name Behavior_Tree_Selector
# extends Behavior_Base_Node

export var random: bool = false;
export var disabled: bool = false;

var last_results: int = -1
var last_children: = []

func update_tick(delta: float, BlackBoard: Blackboard, result : Behavior_Tree_Results) -> void:
	if has_bad_children():
		result.set_sucess()
		return
		
	if disabled:
		result.set_sucess()
		return
		
	for c in _get_children_():
		var bc : Behavior_Tree_Node = c 
		bc._break_on_debug_()
		bc.update_tick(delta, Blackboard)
		if !result.is_failed():
			break

# Shuffles the action after every action instance is called to the front of the behavior tree similiar to state machines. # 
func _get_children_() -> Array:
	var _children_ = _get_children_()
	
	if random:
		if last_results == Behavior_Tree_Results.IS_RUNNING:
			return last_children
			_children_.shuffle()
			last_children = _children_
			
	return _children_
