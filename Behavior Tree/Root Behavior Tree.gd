class_name Root_behavior_Tree
# Root script thats calls single actions into the front of the tree. every update_tick
extends Node

enum Sync_Type{
	Idle,
	Physics
}

export var Root_Agent: NodePath;

export var BlackBoard : NodePath;

export var Visibilty_Notifier: NodePath;

export (Sync_Type) var _Sync_Type_ := Sync_Type.Physics; 

var _Root_Agent : Node

var _BlackBoard: BlackBoard

var _Current_Runnng_Node : Node

func _ready():
	set_process(false)
	set_physics_process(false)
	# Set Process enables or disables the tick rate or prcces under certain circumstances. #
	
	var Error := false
	
	if BlackBoard:
		_BlackBoard = get_node_or_null(BlackBoard) # Similiar to get_node(). but does not log an error when no path is available.
	if !_BlackBoard:
		printerr("Behavior Tree: Must have valid Blackboard.")
		Error = true
		
	if Root_Agent:
		_Root_Agent = get_node(Root_Agent)
	if !Root_Agent: 
		printerr("Behavior Tree Must have a valid Agent.")
		Error = true
		
	# Calls blackbaord to get action that is called by the agent
	_BlackBoard.Agent_From_BlackBoard_Script = _Root_Agent
	
	# Deals with notifying if the ai is detected on screen 
	if !Error and Visibilty_Notifier:
		var Visibility_Notify : VisibilityNotifier2D = get_node_or_null(Visibilty_Notifier)
		if !Visibility_Notify:
			printerr("BehaviorTree: must have valid visibility notifier (if set)")
			Error = true
		else: 
			# Screen Notifiers. 
			Visibility_Notify.connect("screen_entered" , self , "on_screen_entered")
			Visibility_Notify.connect("screen_exited" , self , "on_screen_exited")
			
		if Error or !Validate_Children():
			print("Behavior Tree: Encountered Error: Behavior Tree Will Not Procees. Check Children")
			return
		
		# Activates physics processing if there are no errors present in the script return false turning off physics processing.
		if _Sync_Type_ == Sync_Type.Idle:
			set_process(true)
		else: 
			set_physics_process(true)
			
func Validate_Children() -> bool:
	if get_child_count() != 1:
		printerr("Exactly one child is needed to activate Behavior Tree.")
		return false
	return true
		
	
	 
			

