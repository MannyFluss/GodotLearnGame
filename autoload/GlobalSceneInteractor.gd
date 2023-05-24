extends Node

#for functions that specifically try to inject/ interact with the scene (should not store anything)

func attemptFunctionCall(path : NodePath, funcName : String, args := [] ):
	var targetNode = get_tree().root.get_node_or_null(path)
	if targetNode == null:
		print_debug("failed to get node at path: " + String(path))
		return null
	var return_value
	if args == []:
		return_value = targetNode.call(funcName)
	else:
		return_value = targetNode.call(funcName,args)
	
	return return_value
