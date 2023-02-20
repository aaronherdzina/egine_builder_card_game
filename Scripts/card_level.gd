extends Node2D

var player_tableau_list = []

var player_chassis_list = []
var player_leg_list = []
var player_right_arm_list = []
var player_left_arm_list = []

var hand = []
var enm_hand = []
var player_discard = []
var enemy_discard = []
var enemy_chassis_list = []
var enemy_leg_list = []
var enemy_right_arm_list = []
var enemy_left_arm_list = []

var enemy_chassis_list_limit = 10
var enemy_leg_list_limit = 5
var enemy_right_arm_list_limit = 2
var enemy_left_arm_list_limit = 2

var current_menu = "deck"
var lists_idx_max = 4
var lists_idx = 4
var list_navigation_idx = 1

var player_chassis_list_limit = 5
var player_leg_list_limit = 5
var player_right_arm_list_limit = 2
var player_left_arm_list_limit = 1

var right_arm_idx = 0
var left_arm_idx = 0
var chassis_arm_idx = 0
var leg_idx = 0

const CHASSIS_MENU = "chassis menu"
const LEFT_ARM_MENU = "left arm menu"
const RIGHT_ARM_MENU = "right arm menu"
const LEGS_MENU = "legs menu"


func cycle_active_menu_lists(val):
	lists_idx += val
	if lists_idx == 1:
		player_chassis_list[list_navigation_idx]
	list_navigation_idx = 1


func play_card(card_list, card_idx, is_player=true):
	# card_action(player_card_list[player_card_idx][CARD_ACTION], is_player, "")

	var can_afford = false
	print("card_idx " + str(card_idx) + " card_list " + str(card_list))
	if card_idx >= 0 and card_idx <= len(card_list) - 1 and len(card_list) > 0:
		can_afford = Cards.can_afford_card(card_list[card_idx], is_player)
		if not can_afford:
			print("is_player: " +str(is_player)+" can't afford " + card_list[card_idx].title)
			return "stop"
	if is_player:
		#if Cards.waiting:
		#	return "stop"
		if card_idx >= 0 and card_idx <= len(card_list) - 1 and len(card_list) > 0:
			if len(card_list) == 1 and card_idx > 0:
				card_idx = 0
			Cards.waiting = true
			if card_list[card_idx].card_type != Cards.ABILITY_CARD:
				Cards.place_card_in_display(card_list, card_idx, is_player)
			else:
				var should_stop_play = Cards.card_action(card_list[card_idx].card_action, is_player, "", card_list[card_idx])
				print("should_stop_play " + str(should_stop_play))
				card_list[card_idx].get_node("AnimationPlayer").play("remove")
	
			if card_idx >= 0 and card_idx < len(card_list):
				card_list.remove(card_idx)
			Cards.hand_idx = 0
			update_text_overlays()
			yield(get_tree().create_timer(1.0), "timeout")
			Cards.waiting = false
		else:
			print("whoops player, didn't play a card successfully. card_idx: "+str(card_idx))

	else:
		if card_idx >= 0 and card_idx <= len(card_list) -1 and len(card_list) > 0:
			if len(card_list) == 1 and card_idx > 0:
				card_idx = 0
			if card_list[card_idx].card_type != Cards.ABILITY_CARD:
				Cards.place_card_in_display(card_list, card_idx, is_player)
			else:
				var should_stop_play = Cards.card_action(card_list[card_idx].card_action, is_player, "", card_list[card_idx])
				print("enm should_stop_play " + str(should_stop_play))
				card_list[card_idx].get_node("AnimationPlayer").play("remove")
				#card_list[card_idx].visible = false
			if card_idx >= 0 and card_idx < len(card_list):
				card_list.remove(card_idx)
			update_text_overlays()
		else:
			print("whoops enm, didn't play a card successfully")
	if is_player:
		Cards.hand_idx = 0
	reset_display()


func remove_all_cards_in_hand(is_player):
	if is_player:
		for card in hand:
			if card and main.checkIfNodeDeleted(card) == false:
				card.visible = false
				card.queue_free()
		hand = []
	else:
		for card in enm_hand:
			if card and main.checkIfNodeDeleted(card) == false:
				card.visible = false
				card.queue_free()
		enm_hand = []


func get_random_card(deck, is_player):
	randomize()
	print("get_random_card with deck size of " + str(len(deck)))
	if len(deck) <= 0:
		if is_player:
			print("deck swap " + str(len(player_discard)))
			deck = player_discard
		else:
			print("deck swap " + str(len(enemy_discard)))
			deck = enemy_discard
	var idx = 0
	for card in deck:
		if not card and idx >= 0 and idx < len(deck) - 1\
		or main.checkIfNodeDeleted(card) == true and idx >= 0 and idx < len(deck) - 1:
			print("removing bad card: " + str(deck[idx]) + " at pos: " + str(idx))
			deck.remove(idx)
		idx += 1
	var rand_idx = round(rand_range(0, len(deck) - 1))
	if rand_idx < 0 or rand_idx >= len(deck):
		if len(deck) > 0:
			rand_idx = len(deck)-1
		else:
			rand_idx = 0
	if len(deck) > 0:
		var choice_idx = rand_idx if deck[rand_idx] and main.checkIfNodeDeleted(deck[rand_idx]) == false else 0
		var final_choice = deck[choice_idx]
		print("deck before: " +str(len(deck)) + " choice_idx: " + str(choice_idx))
		deck.remove(choice_idx)
		print("deck after: " +str(len(deck)) + " choice: " + str(final_choice))
		return final_choice
	else:
		print("deck 0")
		#var choice = Cards.negative_cards_weighted[rand_range(0, len(Cards.negative_cards_weighted) - 1)]
		return false


func reset_display():
	reset_display_card_sizes()
	reset_hand_card_sizes()
	handle_cards_in_display()


func card_container_navigation_controller(val, location="change"):
	if location == "current":
			location = Cards.current_card_menu

	reset_display()
	if location == "change":
		if Cards.current_card_menu == "hand" :
			# If hand check all lists otherwise come back
			if len(player_chassis_list) > 0:
				Cards.current_card_menu = CHASSIS_MENU
			elif len(player_left_arm_list) > 0:
				Cards.current_card_menu = LEFT_ARM_MENU
			elif len(player_right_arm_list) > 0:
				Cards.current_card_menu = RIGHT_ARM_MENU
			elif len(player_leg_list) > 0:
				Cards.current_card_menu = LEGS_MENU
			else:
				Cards.current_card_menu = "hand"
		
		# if not in hand go to next non handd list if any or come back to hand
		elif Cards.current_card_menu == CHASSIS_MENU and len(player_left_arm_list) > 0:
			Cards.current_card_menu = LEFT_ARM_MENU
		elif Cards.current_card_menu == LEFT_ARM_MENU and len(player_right_arm_list) > 0:
			Cards.current_card_menu = RIGHT_ARM_MENU
		elif Cards.current_card_menu == RIGHT_ARM_MENU and len(player_leg_list) > 0:
			Cards.current_card_menu = LEGS_MENU
		elif Cards.current_card_menu == LEGS_MENU:
			Cards.current_card_menu = "hand"
		else:
			Cards.current_card_menu = "hand"

	elif location == "hand":
		change_hand_idx(val)
	elif location == CHASSIS_MENU\
	     or location == LEFT_ARM_MENU\
	     or location == RIGHT_ARM_MENU\
	     or location == LEGS_MENU:
			cycle_current_card_menu(val)

	print(Cards.current_card_menu)


func change_hand_idx(val=0):
	reset_card_z_indexes()
	var idx = 1
	for card in hand:
		if card and main.checkIfNodeDeleted(card) == false:
			card.modulate = Color(.55, .55, .55, 1)
			card.z_index = idx + 120
		idx += 1
	Cards.hand_idx -= val
	if Cards.hand_idx < 0:
		Cards.hand_idx = len(hand) - 1
	elif Cards.hand_idx >= len(hand):
		Cards.hand_idx = 0
	if Cards.hand_idx < 0:
		Cards.hand_idx = 0
	if len(hand) > 0 and hand[Cards.hand_idx] and Cards.hand_idx < len(hand) and main.checkIfNodeDeleted(hand[Cards.hand_idx]) == false:
		var can_afford = Cards.can_afford_card(hand[Cards.hand_idx])
		hand[Cards.hand_idx].modulate = Color(1, 1, 1, 1)
		if can_afford:
			hand[Cards.hand_idx].z_index = idx + 520
			expand_card_details(hand[Cards.hand_idx])
		else:
			hand[Cards.hand_idx].z_index = idx + 520
			expand_card_details(hand[Cards.hand_idx])
			print("Can't afford card " + str(hand[Cards.hand_idx]))
	print("hand len: " + str(len(hand)))


func remove_all_cards():
	player_tableau_list = []
	for card in get_tree().get_nodes_in_group("cards"):
		if card and main.checkIfNodeDeleted(card) == false:
			card.removing = true
			card.visible = false
			card.call_deferred("queue_free")


func start_level():
	randomize()
	meta.current_player_deck = Cards.all_decks[rand_range(0, len(Cards.all_decks))]
	meta.current_enemy_deck = Cards.all_decks[rand_range(0, len(Cards.all_decks))]
	meta.enemy_health = meta.enemy_health_max
	meta.player_health = meta.player_health_max
	meta.enemy_food = Cards.starting_food
	meta.enemy_water = Cards.starting_water
	meta.player_food = Cards.starting_food
	meta.player_water = Cards.starting_water
	remove_all_cards_in_hand(true)
	remove_all_cards_in_hand(false)
	remove_all_cards()
	player_tableau_list = []
	player_chassis_list = []
	player_leg_list = []
	player_right_arm_list = []
	player_left_arm_list = []
	enemy_chassis_list = []
	enemy_leg_list = []
	enemy_right_arm_list = []
	enemy_left_arm_list = []
	hand = []
	enm_hand = []
	Cards.set_area_bonuses()
	reset_card_z_indexes()
	update_text_overlays()
	

func reset_display_cards():
	reset_display_card_sizes()


func reset_hand_card_sizes():
	var normal_size = Cards.STANDARD_CARD_SCALE
	for card in hand:
		if card and main.checkIfNodeDeleted(card) == false:
			card.set_scale(normal_size)


func handle_cards_in_display():
	var x = 0
	var y = 0
	var idx = 0
	var x_buffer = 150
	var y_buffer = 200
	for card in player_chassis_list:
		var node_ref = get_node("tableau_container/chassis").global_position
		player_chassis_list[idx].position = node_ref
		player_chassis_list[idx].position.x += x_buffer * x
		player_chassis_list[idx].position.y += y_buffer * y
		card.set_scale(Cards.STANDARD_DISPLAY_CARD_SCALE)
		idx += 1
		x += 1
		if x % 3 == 0:
			x = 0
			y += 1
	y = 0
	x = 0
	idx = 0
	for card in player_leg_list:
		var node_ref = get_node("tableau_container/legs").global_position
		player_leg_list[idx].position = Vector2(node_ref.x + (x_buffer * x), node_ref.y + (y_buffer * y))
		card.set_scale(Cards.STANDARD_DISPLAY_CARD_SCALE)
		idx += 1
		x += 1
	y = 0
	x = 0
	idx = 0

	for card in player_right_arm_list:
		var node_ref = get_node("tableau_container/right_arm").global_position
		player_right_arm_list[idx].position = Vector2(node_ref.x + (x_buffer * x), node_ref.y + (y_buffer * y))
		card.set_scale(Cards.STANDARD_DISPLAY_CARD_SCALE)
		idx += 1
		y += 1
		if idx % 4 == 0:
			x += 1
			
	y = 0
	x = 0
	idx = 0

	for card in player_left_arm_list:
		var node_ref = get_node("tableau_container/left_arm").global_position
		player_left_arm_list[idx].position = Vector2(node_ref.x + (x_buffer * x), node_ref.y + (y_buffer * y))
		card.set_scale(Cards.STANDARD_DISPLAY_CARD_SCALE)
		idx += 1
		y += 1
		if idx % 4 == 0:
			x += 1

	#####
	#
	###  Enemy
	#
	#####
	y = 0
	x = 0
	idx = 0
	for card in enemy_chassis_list:
		var node_ref = get_node("enemy_tableau_container/chassis").global_position
		enemy_chassis_list[idx].position = node_ref
		enemy_chassis_list[idx].position.x += x_buffer * x
		enemy_chassis_list[idx].position.y += y_buffer * y
		card.set_scale(Cards.STANDARD_DISPLAY_CARD_SCALE)
		idx += 1
		x += 1
		if x % 4 == 0:
			x = 0
			y += 1

	y = 0
	x = 0
	idx = 0

	for card in enemy_leg_list:
		var node_ref = get_node("enemy_tableau_container/legs").global_position
		enemy_leg_list[idx].position = Vector2(node_ref.x + (x_buffer * x), node_ref.y + (y_buffer * y))
		card.set_scale(Cards.STANDARD_DISPLAY_CARD_SCALE)
		idx += 1
		x += 1
	y = 0
	x = 0
	idx = 0

	for card in enemy_right_arm_list:
		var node_ref = get_node("enemy_tableau_container/right_arm").global_position
		enemy_right_arm_list[idx].position = Vector2(node_ref.x + (x_buffer * x), node_ref.y + (y_buffer * y))
		card.set_scale(Cards.STANDARD_DISPLAY_CARD_SCALE)
		idx += 1
		y += 1
		if idx % 4 == 0:
			x +=1
	y = 0
	x = 0
	idx = 0

	for card in enemy_left_arm_list:
		var node_ref = get_node("enemy_tableau_container/left_arm").global_position
		enemy_left_arm_list[idx].position = Vector2(node_ref.x + (x_buffer * x), node_ref.y + (y_buffer * y))
		card.set_scale(Cards.STANDARD_DISPLAY_CARD_SCALE)
		idx += 1
		y += 1
		if idx % 4 == 0:
			x += 1
	reset_display_card_sizes()


func expand_card_details(chosen_card=false):
	if get_node("/root").has_node("level"):
		var level = get_node("/root/level")
		if not Cards.card_expanded:
			Cards.card_expanded = true
			var current_location = Vector2(0, 0)
			var zoom_size = Vector2(.9, .9)
			var smaller_zoom_size = Vector2(.8, .8)
			var card_zoomed_location = Vector2(500, 600)
			var zoomed_idx = 2500
			reset_card_z_indexes()
			reset_display_card_sizes()
			reset_hand_card_sizes()
			handle_cards_in_display()
			if chosen_card:
				chosen_card.z_index = zoomed_idx
				chosen_card.set_scale(smaller_zoom_size)
			elif list_navigation_idx >= 0:
				print("here? " + Cards.current_card_menu + " list_navigation_idx: " + str(list_navigation_idx))
				if Cards.current_card_menu == CHASSIS_MENU\
				   and len(player_chassis_list) > 0 and list_navigation_idx < len(player_chassis_list):
					player_chassis_list[list_navigation_idx].set_scale(zoom_size)
					player_chassis_list[list_navigation_idx].position = card_zoomed_location
					player_chassis_list[list_navigation_idx].z_index = zoomed_idx
				elif Cards.current_card_menu == LEFT_ARM_MENU\
				   and len(player_left_arm_list) > 0 and list_navigation_idx < len(player_left_arm_list):
					player_left_arm_list[list_navigation_idx].set_scale(zoom_size)
					player_left_arm_list[list_navigation_idx].position = card_zoomed_location
					player_left_arm_list[list_navigation_idx].z_index = zoomed_idx
				elif Cards.current_card_menu == level.RIGHT_ARM_MENU\
				   and len(player_right_arm_list) > 0 and list_navigation_idx < len(level.player_right_arm_list):
					player_right_arm_list[list_navigation_idx].set_scale(zoom_size)
					player_right_arm_list[list_navigation_idx].position = card_zoomed_location
					player_right_arm_list[list_navigation_idx].z_index = zoomed_idx
				elif Cards.current_card_menu == LEGS_MENU\
				   and len(player_leg_list) > 0 and list_navigation_idx < len(player_leg_list):
					player_leg_list[list_navigation_idx].set_scale(zoom_size)
					player_leg_list[list_navigation_idx].position = card_zoomed_location
					player_leg_list[list_navigation_idx].z_index = zoomed_idx
				else:
					Cards.current_card_menu = "hand"
		else:
			Cards.card_expanded = false
			handle_cards_in_display()

func reset_display_card_sizes():
	var normal_size = Cards.STANDARD_DISPLAY_CARD_SCALE
	var idx = 0
	for card in player_chassis_list:
		card.set_scale(normal_size)
		idx += 1
	
	idx = 0
	for card in player_left_arm_list:
		card.set_scale(normal_size)
		idx += 1
	
	idx = 0
	for card in player_right_arm_list:
		card.set_scale(normal_size)
		idx += 1
	
	idx = 0
	for card in player_leg_list:
		card.set_scale(normal_size)
		idx += 1
	
	
	idx = 0
	for card in enemy_chassis_list:
		card.set_scale(normal_size)
		idx += 1
	
	idx = 0
	for card in enemy_left_arm_list:
		card.set_scale(normal_size)
		idx += 1
	
	idx = 0
	for card in enemy_right_arm_list:
		card.set_scale(normal_size)
		idx += 1

	idx = 0
	for card in enemy_leg_list:
		card.set_scale(normal_size)
		card.z_index += idx
		idx += 1
	idx = 0
	if Cards.card_expanded:
		Cards.card_expanded = false



func update_text_overlays():
	var min_val = 0
	$ui.animate_value(meta.player_health-min_val, meta.player_health)
	$ui.animate_value(meta.player_food-min_val, meta.player_food, 'food')
	$ui.animate_value(meta.player_water-min_val, meta.player_water, 'water')

	$ui.animate_value(meta.enemy_health-min_val, meta.enemy_health, 'health', false)
	$ui.animate_value(meta.enemy_food-min_val, meta.enemy_food, 'food', false)
	$ui.animate_value(meta.enemy_water-min_val, meta.enemy_water, 'water', false)

	get_node("/root/level").get_node("text_cont/enemy_health").set_text(str(meta.enemy_health))
	get_node("/root/level").get_node("text_cont/enemy_hunger").set_text(str(meta.enemy_food))
	get_node("/root/level").get_node("text_cont/enemy_water").set_text(str(meta.enemy_water))
	get_node("/root/level").get_node("text_cont/player_health").set_text(str(meta.player_health))
	get_node("/root/level").get_node("text_cont/player_hunger").set_text(str(meta.player_food))
	get_node("/root/level").get_node("text_cont/player_defense").set_text(str(meta.player_defense))
	get_node("/root/level").get_node("text_cont/player_toughness").set_text(str(meta.player_toughness))
	get_node("/root/level").get_node("text_cont/player_water").set_text(str(meta.player_water))
	get_node("/root/level").get_node("text_cont/player_dmg_turn").set_text(str(Cards.player_damage_taken_turn))
	get_node("/root/level").get_node("text_cont/enemy_dmg_turn").set_text(str(Cards.enemy_damage_taken_turn))


func reset_card_z_indexes():
	for card in player_chassis_list:
		card.modulate = Color(.75, .75, .75, 1)
		card.set_scale(Cards.STANDARD_DISPLAY_CARD_SCALE)
		card.get_node("text").visible = false
		card.get_node("tags").visible = false
		card.get_node("action").visible = false
		card.z_index = 1
	for card in player_right_arm_list:
		card.modulate = Color(.75, .75, .75, 1)
		card.set_scale(Cards.STANDARD_DISPLAY_CARD_SCALE)
		card.get_node("text").visible = false
		card.get_node("tags").visible = false
		card.get_node("action").visible = false
		card.z_index = 1
	for card in player_left_arm_list:
		card.modulate = Color(.75, .75, .75, 1)
		card.set_scale(Cards.STANDARD_DISPLAY_CARD_SCALE)
		card.get_node("text").visible = false
		card.get_node("tags").visible = false
		card.get_node("action").visible = false
		card.z_index = 1
	for card in player_leg_list:
		card.modulate = Color(.75, .75, .75, 1)
		card.set_scale(Cards.STANDARD_DISPLAY_CARD_SCALE)
		card.get_node("text").visible = false
		card.get_node("tags").visible = false
		card.get_node("action").visible = false
		card.z_index = 1

	for card in enemy_chassis_list:
		if card and main.checkIfNodeDeleted(card) == false and not card.removing:
			card.modulate = Color(.75, .75, .75, 1)
			card.set_scale(Cards.STANDARD_DISPLAY_CARD_SCALE)
			card.get_node("text").visible = false
			card.get_node("tags").visible = false
			card.get_node("action").visible = false
			card.z_index = 1
	for card in enemy_right_arm_list:
		if card and main.checkIfNodeDeleted(card) == false and not card.removing:
			card.modulate = Color(.75, .75, .75, 1)
			card.set_scale(Cards.STANDARD_DISPLAY_CARD_SCALE)
			card.get_node("text").visible = false
			card.get_node("tags").visible = false
			card.get_node("action").visible = false
			card.z_index = 1
	for card in enemy_left_arm_list:
		if card and main.checkIfNodeDeleted(card) == false and not card.removing:
			card.modulate = Color(.75, .75, .75, 1)
			card.set_scale(Cards.STANDARD_DISPLAY_CARD_SCALE)
			card.get_node("text").visible = false
			card.get_node("tags").visible = false
			card.get_node("action").visible = false
			card.z_index = 1
	for card in enemy_leg_list:
		if card and main.checkIfNodeDeleted(card) == false and not card.removing:
			card.modulate = Color(.75, .75, .75, 1)
			card.set_scale(Cards.STANDARD_DISPLAY_CARD_SCALE)
			card.get_node("text").visible = false
			card.get_node("tags").visible = false
			card.get_node("action").visible = false
			card.z_index = 1


func cycle_current_card_menu(val):
	""" Deck card navigation logic in Cards.gd Think about moving here """
	list_navigation_idx += val
	current_menu = Cards.current_card_menu
	
	reset_card_z_indexes()
	if current_menu == CHASSIS_MENU and len(player_chassis_list) > 0:
		if list_navigation_idx < 0:
			list_navigation_idx = len(player_chassis_list) - 1
		elif list_navigation_idx >= len(player_chassis_list):
			list_navigation_idx = 0
		player_chassis_list[list_navigation_idx].modulate = Color(1, 1, 1, 1)
		player_chassis_list[list_navigation_idx].set_scale(Cards.STANDARD_CARD_SCALE)
		player_chassis_list[list_navigation_idx].get_node("text").visible = true
		player_chassis_list[list_navigation_idx].get_node("tags").visible = true
		player_chassis_list[list_navigation_idx].get_node("action").visible = true
		player_chassis_list[list_navigation_idx].z_index = 5

	elif current_menu == LEFT_ARM_MENU and len(player_left_arm_list) > 0:
		if list_navigation_idx < 0:
			list_navigation_idx = len(player_left_arm_list) - 1
		elif list_navigation_idx >= len(player_left_arm_list):
			list_navigation_idx = 0
		player_left_arm_list[list_navigation_idx].modulate = Color(1, 1, 1, 1)
		player_left_arm_list[list_navigation_idx].set_scale(Cards.STANDARD_CARD_SCALE)
		player_left_arm_list[list_navigation_idx].get_node("text").visible = true
		player_left_arm_list[list_navigation_idx].get_node("tags").visible = true
		player_left_arm_list[list_navigation_idx].get_node("action").visible = true
		player_left_arm_list[list_navigation_idx].z_index = 5

	elif current_menu == RIGHT_ARM_MENU and len(player_right_arm_list) > 0:
		if list_navigation_idx < 0:
			list_navigation_idx = len(player_right_arm_list) - 1
		elif list_navigation_idx >= len(player_right_arm_list):
			list_navigation_idx = 0
		player_right_arm_list[list_navigation_idx].modulate = Color(1, 1, 1, 1)
		player_right_arm_list[list_navigation_idx].set_scale(Cards.STANDARD_CARD_SCALE)
		player_right_arm_list[list_navigation_idx].get_node("text").visible = true
		player_right_arm_list[list_navigation_idx].get_node("tags").visible = true
		player_right_arm_list[list_navigation_idx].get_node("action").visible = true
		player_right_arm_list[list_navigation_idx].z_index = 5

	elif current_menu == LEGS_MENU and len(player_leg_list) > 0:
		if list_navigation_idx < 0:
			list_navigation_idx = len(player_leg_list) - 1
		elif list_navigation_idx >= len(player_leg_list):
			list_navigation_idx = 0
		player_leg_list[list_navigation_idx].modulate = Color(1, 1, 1, 1)
		player_leg_list[list_navigation_idx].set_scale(Cards.STANDARD_CARD_SCALE)
		player_leg_list[list_navigation_idx].get_node("text").visible = true
		player_leg_list[list_navigation_idx].get_node("tags").visible = true
		player_leg_list[list_navigation_idx].get_node("action").visible = true
		player_leg_list[list_navigation_idx].z_index = 5
	else:
		print("current_menu is " + str(current_menu))


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
