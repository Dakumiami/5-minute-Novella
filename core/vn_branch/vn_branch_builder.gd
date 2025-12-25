#@abstract
class_name VN_BranchBuilder
extends RefCounted

#region Variables
var queue: Array[VN_Event] = []
var Positions = VN_PositionChangeEvent.Positions
#endregion


#region Basic
#func get_branch() -> NovelBranch:
	#new_queue()
	#var branch: NovelBranch = NovelBranch.new()
	#branch.queue = queue
	#return 


func question(text: String, choices: Dictionary[String, VN_Event]) -> VN_ChoiceEvent:
	var event: VN_ChoiceEvent = _create(VN_ChoiceEvent)
	event.question = text
	event.choices = choices
	return event

func update_memory(character: VN_CharacterData, opinion: int, about: VN_CharacterData) -> VN_MemoryChangeEvent:
	var event: VN_MemoryChangeEvent = _create(VN_MemoryChangeEvent)
	event.character = character
	event.opinion = opinion
	event.about = about
	return event

func flip_sprite(character: VN_CharacterData, flip: bool) -> VN_FlipSpriteEvent:
	var event: VN_FlipSpriteEvent = _create(VN_FlipSpriteEvent)
	event.character = character
	event.flip = flip
	return event

func animation(character: VN_CharacterData, emotion: int) -> VN_AnimationChangeEvent:
	var event: VN_AnimationChangeEvent = _create(VN_AnimationChangeEvent)
	event.character = character
	event.animation = emotion
	return event

func go_to_branch(path: String) -> VN_BranchChangeEvent:
	var event: VN_BranchChangeEvent = _create(VN_BranchChangeEvent)
	event.path = path
	return event

func narrative(text: String) -> VN_NarrativeEvent:
	var event: VN_NarrativeEvent = _create(VN_NarrativeEvent)
	event.speech = text
	return event

func speech(character: VN_CharacterData, text: String) -> VN_SpeechEvent:
	var event: VN_SpeechEvent = _create(VN_SpeechEvent)
	event.character = character
	event.speech = text
	return event

func position(character: VN_CharacterData, new_position: int) -> VN_PositionChangeEvent:
	var event: VN_PositionChangeEvent = _create(VN_PositionChangeEvent)
	event.character = character
	event.position = new_position
	return event

func go_to_scene(path: String) -> VN_SceneChangeEvent:
	var event: VN_SceneChangeEvent = _create(VN_SceneChangeEvent)
	event.path = path
	return event

func condition(on: Callable, do: VN_Event) -> VN_ConditionEvent:
	var event: VN_ConditionEvent = _create(VN_ConditionEvent)
	event.condition = on
	event.event = do
	return event

func change_backgroung(path: String) -> VN_ChangeBackground:
	var event: VN_ChangeBackground = _create(VN_ChangeBackground)
	event.path = path
	return event
#endregion



#region Helpers
func _create(obj: GDScript) -> VN_Event:
	var event: VN_Event = obj.new()
	queue.append(event)
	return event
#endregion
