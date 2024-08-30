extends Node

var state = ""
var nodeName = ""
var nodeLabel
var isFed = false
var feedBtn = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	nodeName = getNodeName()
	print("name: " + nodeName)
	labelUpdate()

func labelUpdate():
	match(nodeName):
		"SpouseSprite":
			state = StaticPlayerVariables.spouseState
			nodeLabel = $"../SpouseLabel"
			nodeLabel.text = "Spouse State: " + state
			feedBtn = $"../SpouseFeedBtn"
		"Child1Sprite":
			state = StaticPlayerVariables.child1State
			nodeLabel = $"../Child1Label"
			nodeLabel.text = "Child 1 State: " + state
			feedBtn = $"../Child1FeedBtn"
		"Child2Sprite":
			state = StaticPlayerVariables.child2State
			nodeLabel = $"../Child2Label"
			nodeLabel.text = "Child 2 State: " + state
			feedBtn = $"../Child2FeedBtn"
		"Child3Sprite":
			state = StaticPlayerVariables.child3State
			nodeLabel = $"../Child3Label"
			nodeLabel.text = "Child 3 State: " + state
			feedBtn = $"../Child3FeedBtn"

func stateUpdate():
	checkFeedBtn()
	if(!isFed):
		match(nodeName):
			"SpouseSprite":
				StaticPlayerVariables.spouseState = "Hungry"
			"Child1Sprite":
				StaticPlayerVariables.child1State = "Hungry"
			"Child2Sprite":
				StaticPlayerVariables.child2State = "Hungry"
			"Child3Sprite":
				StaticPlayerVariables.child3State = "Hungry"
	else:
		match(nodeName):
			"SpouseSprite":
				StaticPlayerVariables.spouseState = "Healthy"
			"Child1Sprite":
				StaticPlayerVariables.child1State = "Healthy"
			"Child2Sprite":
				StaticPlayerVariables.child2State = "Healthy"
			"Child3Sprite":
				StaticPlayerVariables.child3State = "Healthy"
	labelUpdate()

func checkFeedBtn():
	if(feedBtn.button_pressed):
		isFed = true
	else:
		isFed = false

func getNodeName():
	return get_name()
