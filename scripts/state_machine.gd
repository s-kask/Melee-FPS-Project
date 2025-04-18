extends Node

@export
var startState: State
var currentState: State


#initialiserar state maskinen genom att ge vajre "child" state en referens
#till "parent" objectet som den tillhör och går in i default statet startState
func init(parent: Player) -> void:
	print("Initierar state machine med: ", parent)
	for child in get_children():
		print(" -> Initierar state: ", child.name)
		if child is State:
			child.parent = parent
		else:
			print(" ⚠️ Skippade ", child.name, "– inte en State")
	
	print("Startar med state: ", startState)
	change_state(startState)

#byt till ny state genom att först gå ut ur currentState
func change_state(newState: State) -> void:
	if currentState:
		currentState.exit()
		
	currentState = newState
	currentState.enter()

#gå igeno funcs för entity att anropa
#som tar hand om states as needed
func process_physics(delta: float) -> void:
	var newState = currentState.process_physics(delta)
	if newState:
		change_state(newState)

func process_input(event: InputEvent) -> void:
	var newState = currentState.process_input(event)
	if newState:
		change_state(newState)

func process_frame(delta: float) -> void:
	var newState = currentState.process_frame(delta)
	if newState:
		change_state(newState)
