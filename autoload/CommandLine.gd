extends Control
# I ideally want this to be able to work in any game

# Called when the node enters the scene tree for the first time.
func _ready():
	%CommandLineInput.clear()
	$".".visible = false
	
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

#what do I want
#press / to toggle the command line being active, only takes input while active
#press enter to send command, results in the debug output
#/ will not toggle if there is text being written

func _input(event):
	if Input.is_action_just_pressed("ui_commandLine"):
		if %CommandLineInput.text != "" and $".".visible == true:
			return
		setCommandLine(not getCommandLine())
	
	if Input.is_action_just_pressed("ui_enter"):
		submitCommand()
		
#toggle visibility
func getCommandLine()->bool:
	return $".".visible

func setCommandLine(_set : bool):
	$".".visible = _set
	if $".".visible:
		%CommandLineInput.grab_focus()
	if not $".".visible:
		%CommandLineInput.clear()
		%CommandLineInput.release_focus()
		
func submitCommand():
	var command = %CommandLineInput.text
	%CommandLineInput.clear()
	var regex = RegEx.new()
	regex.compile("^\\s+|\\s+$")
	var trimmed_command = regex.sub(command,"")
	interpretCommand(trimmed_command)
	
func sendDebugText(_text : String):
	%DebugOutput.text = %DebugOutput.text + "\n" + _text 
	pass

#this is only containing strings
const commands = ["test","scene"]
func interpretCommand(_command):
	var splitCommands : PackedStringArray
	splitCommands = _command.split(" ")
	var indices_to_remove = [] # an array to store the indices of empty strings
	for i in range(splitCommands.size()):
		if splitCommands[i] == "": # if the element is an empty string
			indices_to_remove.append(i) # add its index to the array
	for i in range(indices_to_remove.size() - 1, -1, -1): # iterate over the array in reverse order
		splitCommands.remove_at(indices_to_remove[i])
	if splitCommands.is_empty() or splitCommands == PackedStringArray([]):
		sendDebugText("Invalid Input")
		return
	if not commands.has(splitCommands[0]):
		sendDebugText("no command: " + splitCommands[0])
	if splitCommands[0] == "scene":
		if splitCommands.size() < 2:
			sendDebugText("command scene is missing scene target")
		else:
			change_scene_command(splitCommands[1])
	#here is a big ol thing that has each of the commands
func change_scene_command(_targetScene):
	var updatedPath = "res://" + _targetScene + ".tscn"
	if ResourceLoader.exists(updatedPath):
		get_tree().change_scene_to_file(updatedPath)
	else:
		sendDebugText(_targetScene + " is not a valid path (do not include res:// at start or .tscn at end)")



func _on_command_line_input_text_changed():
	if %CommandLineInput.text == "":
		return
	if %CommandLineInput.text[-1] == "\n":
		%CommandLineInput.clear()
	pass # Replace with function body.
