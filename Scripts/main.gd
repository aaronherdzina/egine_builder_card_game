extends Node

const debug = true # for dev

# CARDS
const CARD = preload("res://Scenes/card.tscn")

const CARD_COASTAL_BACKGROUND_1 = preload("res://Sprites/cards/light_blue_boat_nc.png")
const CARD_COASTAL_BACKGROUND_2 = preload("res://Sprites/cards/light_blue_weapon_nc.png")
const CARD_COASTAL_BACKGROUND_3 = preload("res://Sprites/cards/light_blue_ability_nc.png")
const CARD_GREY_BACKGROUND_1 = preload("res://Sprites/cards/dark_boat_nc.png")
const CARD_GREY_BACKGROUND_2 = preload("res://Sprites/cards/dark_weapon_nc.png")
const CARD_GREY_BACKGROUND_3 = preload("res://Sprites/cards/dark_ability_nc.png")
const CARD_RIVERLANDS_BACKGROUND_1 = preload("res://Sprites/cards/dark_boat_nc.png")
const CARD_RIVERLANDS_BACKGROUND_2 = preload("res://Sprites/cards/dark_weapon_nc.png")
const CARD_RIVERLANDS_BACKGROUND_3 = preload("res://Sprites/cards/dark_ability_nc.png")
const CARD_FOREST_BACKGROUND_1 = preload("res://Sprites/cards/forest_boat_nc.png")
const CARD_FOREST_BACKGROUND_2 = preload("res://Sprites/cards/forest_weapon_nc.png")
const CARD_FOREST_BACKGROUND_3 = preload("res://Sprites/cards/forest_ability_nc.png")
const CARD_SAVANNHA_BACKGROUND_1 = preload("res://Sprites/cards/red_boat_nc.png")
const CARD_SAVANNHA_BACKGROUND_2 = preload("res://Sprites/cards/red_weapon_nc.png")
const CARD_SAVANNHA_BACKGROUND_3 = preload("res://Sprites/cards/red_ability_nc.png")

## Card sprites
const TRIPPLE_ELEPHANT = preload("res://Sprites/char/Card-game-8.png")
const BEAR_LIKE = preload("res://Sprites/char/bear thingy.png")
const ELEPHANT_OUTLINE = preload("res://Sprites/char/elephant outline.png")
const SMALL_ELEPHANT = preload("res://Sprites/char/Card-game-10.png")
const ROCK_FOX = preload("res://Sprites/char/Card-game-11.png")
const PLASMA_GUN = preload("res://Sprites/char/gun bear.png")
const PIRANHA = preload("res://Sprites/char/piranha card.png")

const WINDOW_FIX = preload("res://Sprites/char/window_fix.png")
const SQUID_WINDOW_FIX = preload("res://Sprites/cards_nc/autonomous_repair_nc.png")
const RATIONS = preload("res://Sprites/cards_nc/rations_nc.png")
const MESSAGE_BOTTLE = preload("res://Sprites/cards_nc/message_bottle_nc.png")
const HAND_GUN = preload("res://Sprites/char/hand_gun.png")
const FLYING_CUTLASS = preload("res://Sprites/cards_nc/flying_cutlass_nc.png")

const FOOD_STOCK = preload("res://Sprites/cards_nc/food_stock_new_color.png")
const SMALL_FOOD_STOCK = preload("res://Sprites/cards_nc/food_stock_light_nc.png")
const LARGE_FOODD_BASKET = preload("res://Sprites/cards_nc/food_stock_new_color.png")
const CANNON = preload("res://Sprites/cards_nc/color_light_cannon_nc.png")
const DOUBLE_CANNON = preload("res://Sprites/char/double cannon.png")
const INFILTRATOR = preload("res://Sprites/char/infiltrator.png")

######
# LEVEL
const COASTAL_BACKDROP = preload("res://Sprites/UI/water backdrop.png")
const WHITE_BACKDROP = preload("res://Sprites/UI/white backdrop.png")
const RIVERLANDS_BACKDROP = preload("res://Sprites/UI/water backdrop.png")
const SAVANNAH_BACKDROP = preload("res://Sprites/UI/savanha backdrop.png")
const FOREST_BACKDROP = preload("res://Sprites/UI/forest backdrop.png")

#


const TEXT_EFECT = preload("res://Scenes/text_effect.tscn")

# TILES
const BASIC_TILE = preload("res://Sprites/tiles/basic/gridrpgBasic.png")
const WALL_TILE = preload("res://Sprites/tiles/basic/gridrpgWall.png")
const MOUNTAIN_TILE = preload("res://Sprites/tiles/basic/gridrpgBasic.png")
#######


const LEVEL = preload("res://Scenes/level.tscn")
const TILE = preload("res://Scenes/tile.tscn")
const ENEMY = preload("res://Scenes/enemy.tscn")
const PLAYER = preload("res://Scenes/player.tscn")

#### SAVE LOAD VARS
var game_name = 'game_name'
var playerFilepath = "user://" + str(game_name) + "_playerData_.data"
var dataFilepath = "user://" + str(game_name) + "_gameData_.data"
# Game data like preferred settings, global stats like playTime, gloal/continous scoring, e.c.t, ..
var gameData = {

	}

# Player specific settings like score, class, health e.c.t..
var playerData = {
	}
#### END OF SAVE LOAD VARS

#### MENU VARS
const popupMenu = preload("res://Scenes/popupMenu.tscn")
var holdMenu = null
var waitToProcessMenuClick = false
var optionsMenu = null
var confirmOptionMenu = null
var goToMainMenu = false
var shouldQuit = false

var shaking = false

var current_screen = 'main_menu'
#### END OF MENU VARS

#### CONTROLLER
var useController = true
var controllerCursorObj = false
#### END OF CONTROLLER

#### MAIN READY/PROCESS
#func _ready():
#	pass


#func _process(delta):
#	pass
#### END OF MAIN READY/PROCESS



#### SAVE LOAD FUNCS
var debug_remove_save_file = false

func loadGameData(onlyGameData=false):
	print("loading...")
	var file = File.new()
	if file.file_exists(dataFilepath) and not debug_remove_save_file:
		file.open(dataFilepath, File.READ)
		gameData = file.get_var()
		file.close()
		print("loaded " + str(dataFilepath))
	elif debug_remove_save_file and game_name in dataFilepath:
		var dir = Directory.new()
		dir.remove(dataFilepath)
		print('removed save dataFilepath, does it exist? ' + str(file.file_exists(dataFilepath)))
	else:
		print(str(dataFilepath) + " not found.")
	pass

func loadPlayerData(onlyGameData=false):
	print("loading...")
	var file = File.new()
	if file.file_exists(playerFilepath):
		file.open(playerFilepath, File.READ)
		playerData = file.get_var()
		file.close()
		print("loaded " + str(playerFilepath))
	else:
		print(str(playerFilepath) + " not found.")
	pass

func saveGameData():
	print("Saving... " + str(dataFilepath))
	var file = File.new()
	file.open(dataFilepath, File.WRITE)
	file.store_var(gameData)
	file.close()
	print("saved " + str(dataFilepath))
	pass

func savePlayerData():
	print("Saving... " + str(playerFilepath))
	var file = File.new()
	file.open(dataFilepath, File.WRITE)
	file.store_var(playerData)
	file.close()
	print("Saved " + str(playerFilepath))
	pass
#### END OF SAVE LOAD FUNCS



#### INPUT FUNCS #MOVE TO INPUT ONLY NODE/SCRIPT
func _input(event):
   # Mouse in viewport coordinates
	if Input.is_action_pressed("ui_quit"): 
		handle_main_menu_input("ui_quit")
	if Input.is_action_pressed("start"): 
		if current_screen == 'main_menu':
			handle_main_menu_input("start")
		elif current_screen == "battle":
			handle_in_battle_input("start")
	if Input.is_action_pressed("back"):
		if current_screen == "battle":
			handle_in_battle_input("back")
	if Input.is_action_pressed("up"):
		if current_screen == "battle":
			handle_in_battle_input("up")
	if Input.is_action_pressed("down"):
		if current_screen == "battle":
			handle_in_battle_input("down")
	if Input.is_action_pressed("left"):
		if current_screen == "battle":
			handle_in_battle_input("left")
	if Input.is_action_pressed("right"):
		if current_screen == "battle":
			handle_in_battle_input("right")
	if Input.is_action_pressed("spacebar"):
		if current_screen == "battle":
			handle_in_battle_input("spacebar")


func handle_in_battle_input(action):
	# var level = get_node("/root/level")
	if action == "spacebar":
		if not Cards.waiting:
			if not get_node("/root").has_node("level"):
				var level = main.LEVEL.instance()
				get_node("/root").add_child(level)
				level.start_level()
			
			Cards.call_deferred("take_turn", meta.player_turn)
	elif action == "start":
		if not Cards.waiting:
			if get_node("/root").has_node("level"):
				var level = get_node("/root/level")
				if Cards.current_card_menu != "hand":
					level.expand_card_details()
				else:
					level.play_card(level.hand, Cards.hand_idx)
					level.handle_cards_in_display()
	elif action == "back": 
		if meta.player_turn:
			var player = get_node("/root/player")
			player.reset_turn()
	elif action == "up": 
		if not Cards.waiting:
			if get_node("/root").has_node("level"):
				var level = get_node("/root/level")
				level.card_container_navigation_controller(0)
				level.card_container_navigation_controller(1, "current")
	elif action == "down": 
		if not Cards.waiting:
			if get_node("/root").has_node("level"):
				var level = get_node("/root/level")
				level.card_container_navigation_controller(0)
				level.card_container_navigation_controller(-1, "current")
	elif action == "right": 
		if not Cards.waiting:
			if get_node("/root").has_node("level"):
				var level = get_node("/root/level")
				level.card_container_navigation_controller(-1, "current")
	elif action == "left": 
		if not Cards.waiting:
			if get_node("/root").has_node("level"):
				var level = get_node("/root/level")
				level.card_container_navigation_controller(1, "current")


func handle_main_menu_input(action):
	if action == "start":
		#Cards.spawn_cards({"hand_limit": 5})
		#Cards.handle_cards_in_display()
		
		#var l = LEVEL.instance()
		#get_node("/root").add_child(l)
		#l.spawn_premade_tiles(l.test_lvl)
		
		current_screen = 'battle'
	elif action == "ui_quit":
		if not waitToProcessMenuClick:
			waitToProcessMenuClick = true
			for btns in get_tree().get_nodes_in_group("btnsToRemove"):
				btns.queue_free()
			holdMenu = main.instancer(popupMenu, null, true, "btnsToRemove")
			# Adding wait to avoid multi clicks
			var timer = Timer.new()
			timer.set_wait_time(.5)
			timer.set_one_shot(true)
			addToParent(timer, null, true)
			timer.start()
			yield(timer, "timeout")
			timer.queue_free()
			# end of wait
			waitToProcessMenuClick = false
#### END OF INPUT FUNCS


#### HELPER FUNCS
func checkIfNodeDeleted(nodeToCheck, eraseNode=false):
	if nodeToCheck != null\
		&& nodeToCheck\
		and not 'Deleted' in str(nodeToCheck)\
		and not 'Object:0' in str(nodeToCheck)\
		and not '[Deleted]' in str(nodeToCheck)\
		and not '[Deleted Object]' in str(nodeToCheck):
		return false
	if eraseNode:
		print('should erase? ' + str(nodeToCheck))
	return true


# add nodes to check wether we should allowing clicking
func canClick(nodesAsStrIfDefinedClickIsFalse=[], parentToCheck=get_node("/root")):
	for node in nodesAsStrIfDefinedClickIsFalse:
		if parentToCheck.has_node(node):
			return false
	return true


func saveAndQuit(shouldSave=true):
	if shouldSave:
		pass
	get_tree().quit()


func cameraShake(mag, length):
	randomize()
	if not get_node("/root").has_node("level") or not get_node("/root/level").has_node("cam"):
		print("leaving cam shake early??")
		return
	var cam = get_node("/root/level/cam")
	var timeToShake = length
	while timeToShake > 0:
		shaking = true
		var pos = Vector2()
		pos.x = rand_range(-mag, mag)
		pos.y = rand_range(-mag, mag)
		cam.position = pos
		timeToShake -= get_process_delta_time()

		var timer = Timer.new()
		get_node("/root").add_child(timer)
		timer.set_wait_time(.015)
		timer.set_one_shot(true)
		timer.start()
		yield(timer, "timeout")
		timer.queue_free()


func instancer(objToInstance=null, parent=null, addDeferred=false, addToThisGroup=null, returnObj=true):
	# Check for accurate data
	if objToInstance != null:
		var newObj = objToInstance.instance()

		## add Specific parent or swap to root
		addToParent(newObj, parent, addDeferred)
		
		## add this obj to group if we wanted to
		if addToThisGroup != null:
			newObj.add_to_group(addToThisGroup)
		
		# Return Object back
		if returnObj:
			return newObj

	# Give feedback for issues
	else:
		print("Failed object is: " + str(objToInstance))


func addToParent(objRecievingParent=null, parent=null, addDeferred=false):
	var root = get_tree().get_root()
	# Check for accurate data
	if objRecievingParent != null:

		## If no parent given use root node
		if parent == null:
			parent = root

			### check if it already has  parent
			if not objRecievingParent.get_parent():

				#### Check if calling deferred or not
				if addDeferred:
					parent.call_deferred("add_child", objRecievingParent)
				else:
					parent.add_child(objRecievingParent)

	# Give feedback for issues
	else:
		print("Failed attempting to add a parent to: " + str(objRecievingParent))

#### END OF HELPER FUNCS
