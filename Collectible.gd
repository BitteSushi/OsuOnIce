extends Area2D

signal hit

var is_player_inside

var CollectibleType

func _ready():
	randomize()
	teleportiere()
	
func _process(delta):
	DifferentCollectibleThinies()

func DifferentCollectibleThinies():
	if(Input.is_action_just_pressed("Collectible_W") && is_player_inside && (CollectibleType == "W")):
		emit_signal("hit")
		$AnimationPlayer.stop(true)
		teleportiere()
		verschwinde()
	
	elif(Input.is_action_just_pressed("Collectible_A") && is_player_inside && (CollectibleType == "A")):
		emit_signal("hit")
		$AnimationPlayer.stop(true)
		teleportiere()
		verschwinde()
	
	elif(Input.is_action_just_pressed("Collectible_S") && is_player_inside && (CollectibleType == "S")):
		emit_signal("hit")
		$AnimationPlayer.stop(true)
		teleportiere()
		verschwinde()
	
	elif(Input.is_action_just_pressed("Collectible_D") && is_player_inside && (CollectibleType == "D")):
		emit_signal("hit")
		$AnimationPlayer.stop(true)
		teleportiere()
		verschwinde()

func teleportiere():	
	var x_range = Vector2(100, 924) # Windowsize minus 100 for Collectiblesize
	var y_range = Vector2(100, 500)
	
	var random_x = randi() % int(x_range[1]- x_range[0]) + 1 + x_range[0] 
	var random_y =  randi() % int(y_range[1]-y_range[0]) + 1 + y_range[0]
	var random_pos = Vector2(random_x, random_y)
	
	# lege Art (Sprite in zusammenhang vom Imput) fest (W,A,S,D)
	
	var Collectibles = ["W", "A", "S", "D"]
	# get random "Collectibles"
	var tempRand = rand_range(0,Collectibles.size())
	CollectibleType = Collectibles[tempRand]
	
	position=random_pos
	
	# Change SpriteFrame according to Array
	$Sprite.frame = tempRand

func verschwinde():
	$AnimationPlayer.play("Verschwinden")

func _on_Collectible_area_entered(area):
	is_player_inside = true

func _on_Collectible_area_exited(area):
	is_player_inside = false

###############################################

enum CollectibleClass {
	W,
	A,
	S,
	D
}

export(CollectibleClass) var Collectibles = CollectibleClass.A


func CollectibleA():
	var inputAction = "Collectible_A"
	var whatAnimatedSprite = $AnimationPlayer.play("Verschwinden")

###############################################
