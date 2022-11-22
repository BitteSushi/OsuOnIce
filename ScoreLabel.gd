extends Label

var score = 0

func _ready():
	
	get_node("../../Collectible").connect("hit",self,"handleScoreUp")

func handleScoreUp():
	score += 1
	text = "Score: %s" % score
