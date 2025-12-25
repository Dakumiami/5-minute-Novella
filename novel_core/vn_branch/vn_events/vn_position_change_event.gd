class_name VN_PositionChangeEvent
extends VN_Event

enum Positions{
	LEFT,
	LEFT_CENTER,
	CENTER,
	RIGHT_CENTER,
	RIGHT,
}

var character: VN_CharacterData = null
var position: int = Positions.CENTER
