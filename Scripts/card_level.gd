extends Node2D

var player_tableau_list = []

var player_chassis_list = []
var player_leg_list = []
var player_right_arm_list = []
var player_left_arm_list = []

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

var player_chassis_list_limit = 10
var player_leg_list_limit = 5
var player_right_arm_list_limit = 2
var player_left_arm_list_limit = 2

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


func update_text_overlays():
	get_node("/root/level").get_node("text_cont/enemy_health").set_text(str(meta.enm_total_health))
	get_node("/root/level").get_node("text_cont/enemy_heat").set_text(str(meta.current_enm_heat))
	get_node("/root/level").get_node("text_cont/enemy_heat_max").set_text(str(meta.max_enm_heat))
	get_node("/root/level").get_node("text_cont/player_health").set_text(str(meta.player_health))
	get_node("/root/level").get_node("text_cont/player_heat").set_text(str(meta.current_player_heat))
	get_node("/root/level").get_node("text_cont/player_heat_max").set_text(str(meta.max_player_heat))
	


func cycle_current_card_menu(val):
	""" Deck card navigation logic in Cards.gd Think about moving here """
	list_navigation_idx += val
	current_menu = Cards.current_card_menu
	
	for card in player_chassis_list:
		card.modulate = Color(.75, .75, .75, .85)
		card.set_scale(Vector2(.5, .5))
		card.get_node("text").visible = false
		card.z_index = 1
	for card in player_right_arm_list:
		card.modulate = Color(.75, .75, .75, .85)
		card.set_scale(Vector2(.5, .5))
		card.get_node("text").visible = false
		card.z_index = 1
	for card in player_left_arm_list:
		card.modulate = Color(.75, .75, .75, .85)
		card.set_scale(Vector2(.5, .5))
		card.get_node("text").visible = false
		card.z_index = 1
	for card in player_leg_list:
		card.modulate = Color(.75, .75, .75, .85)
		card.set_scale(Vector2(.5, .5))
		card.get_node("text").visible = false
		card.z_index = 1

	if current_menu == CHASSIS_MENU and len(player_chassis_list) > 0:
		if list_navigation_idx < 0:
			list_navigation_idx = len(player_chassis_list) - 1
		elif list_navigation_idx >= len(player_chassis_list):
			list_navigation_idx = 0
		player_chassis_list[list_navigation_idx].modulate = Color(1, 1, 1, 1)
		player_chassis_list[list_navigation_idx].set_scale(Vector2(1, 1))
		player_chassis_list[list_navigation_idx].get_node("text").visible = true
		player_chassis_list[list_navigation_idx].z_index = 5

	elif current_menu == LEFT_ARM_MENU and len(player_left_arm_list) > 0:
		if list_navigation_idx < 0:
			list_navigation_idx = len(player_left_arm_list) - 1
		elif list_navigation_idx >= len(player_left_arm_list):
			list_navigation_idx = 0
		player_left_arm_list[list_navigation_idx].modulate = Color(1, 1, 1, 1)
		player_left_arm_list[list_navigation_idx].set_scale(Vector2(1, 1))
		player_left_arm_list[list_navigation_idx].get_node("text").visible = true
		player_left_arm_list[list_navigation_idx].z_index = 5

	elif current_menu == RIGHT_ARM_MENU and len(player_right_arm_list) > 0:
		if list_navigation_idx < 0:
			list_navigation_idx = len(player_right_arm_list) - 1
		elif list_navigation_idx >= len(player_right_arm_list):
			list_navigation_idx = 0
		player_right_arm_list[list_navigation_idx].modulate = Color(1, 1, 1, 1)
		player_right_arm_list[list_navigation_idx].set_scale(Vector2(1, 1))
		player_right_arm_list[list_navigation_idx].get_node("text").visible = true
		player_right_arm_list[list_navigation_idx].z_index = 5

	elif current_menu == LEGS_MENU and len(player_leg_list) > 0:
		if list_navigation_idx < 0:
			list_navigation_idx = len(player_leg_list) - 1
		elif list_navigation_idx >= len(player_leg_list):
			list_navigation_idx = 0
		player_leg_list[list_navigation_idx].modulate = Color(1, 1, 1, 1)
		player_leg_list[list_navigation_idx].set_scale(Vector2(1, 1))
		player_leg_list[list_navigation_idx].get_node("text").visible = true
		player_leg_list[list_navigation_idx].z_index = 5
	else:
		print("current_menu is " + str(current_menu))


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
