extends Node

var char_names = ["Thief", "Brute", "Ranger", "Wizard", "Grunt"]

var current_level_cols = 10
var current_level_rows = 6
var default_level_cols = 10
var default_level_rows = 6

var player_turn = true
var occupied_tile_weight = 1000
var unccupied_tile_weight = 1
var wall_tile_weight = 2000
var current_player_food = 20
var max_player_hunger = 100 # auto loose if lack of food exceeds this 

var player_toughness_bonus = 0
var player_health_bonus = 0
var player_defense_bonus = 0
var player_hunger_production_bonus = 0
var player_food_production_bonus = 0
var player_water_bonus = 0
var player_attacks_bonus = 0
var player_damage_bonus = 0
var player_starving_damage = 5
var player_food_bonus = 0
var player_food = 10
var player_food_max = 0
var player_water_max = 0

var enemy_health_max = 100
var enemy_health = 100
var enemy_water = 30
var enemy_food = 30
var enemy_food_max = 0
var enemy_water_max = 0
var enemy_starving_damage = 5

var enemy_toughness_bonus = 0
var enemy_health_bonus = 0
var enemy_defense_bonus = 0
var enemy_hunger_production_bonus = 0
var enemy_food_production_bonus = 0
var enemy_food_bonus = 0
var enemy_water_bonus = 0
var enemy_attacks_bonus = 0
var enemy_damage_bonus = 0
var enemy_defense = 0
var enemy_toughnes = 0
var enemy_hand_limit = 2
var enemy_hand_limit_default = 2
var enemy_hand_limit_max = 6

var player_health = 100
var player_health_max = 100
var player_water = 10
var player_defense = 10
var player_toughness = 0
var player_hand_limit = 2
var player_hand_limit_default = 2
var player_hand_limit_max = 5
var current_salvage = 0
var current_char = {
	"move_distance": 2,
	"damage": 2,
	"attack": 2,
	"health": 10,
	"energy_max": 3
}

var player_burning = false
var enemy_burning = false
var enemy_current_burn_dmg = 0
var player_current_burn_dmg = 0
var player_bleeding = false
var enemy_bleeding = false
var enemy_current_bleed_dmg = 0
var player_current_bleed_dmg = 0
var current_enemy_deck = []
var current_player_deck = []

var area_food_per_turn = 5
var area_water_per_turn = 5
var area_biome = "null"

var riverlands_area = {
		Cards.CARD_BIOME: Cards.RIVERLANDS,
		Cards.FOOD: 4,
		Cards.WATER: 5,
		"food_bias": .4,
		"water_bias": .6
	}

var forest_area = {
		Cards.CARD_BIOME: Cards.FOREST,
		Cards.FOOD: 6,
		Cards.WATER: 3,
		"food_bias": .7,
		"water_bias": .3
	}

var savannah_area = {
		Cards.CARD_BIOME: Cards.SAVANNAH,
		Cards.FOOD: 4,
		Cards.WATER: 1,
		"food_bias": .9,
		"water_bias": .1
	}

var coastal_area = {
		Cards.CARD_BIOME: Cards.COASTAL,
		Cards.FOOD: 1,
		Cards.WATER: 8,
		"food_bias": .1,
		"water_bias": .9,
	}
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


### Cards


func action_phase():
	# when cards in tableau are played
	if get_node("/root").has_node("level"):
		var l = get_node("/root/level")
		if player_turn:
			for card in l.player_chassis_list:
				Cards.card_action(card[Cards.CARD_ACTION])


#########


func get_adjacent_tiles_in_distance(tile=null, distance=1, type="fill"):
	if not tile:
		return null
	var l = get_node("/root/level")
	var all_adjacent_tiles = []
	var tile_count = len(l.level_tiles)
	var tile_index = tile.index

	# Fill all adjacent
	# cross up down left right
	# star all directions but not inbetween tiles

	if type == "fill":
		for t in l.level_tiles:
			if t.col >= tile.col - distance and t.col <= tile.col + distance and\
			   t.row >= tile.row - distance and t.row <= tile.row + distance:
				all_adjacent_tiles.append(t)
	else:
		for i in range(1, distance+1):
# warning-ignore:unused_variable
			var point_neighbors = []
			#point_neighbors = l.level_astar.get_point_connections(tile.index)
			var above_tile_idx = tile_index - (l.current_rows * i)
			var above_right_tile_idx = tile_index - (l.current_rows * i) + i
			var above_left_tile_idx = tile_index - (l.current_rows * i) - i
	
			var right_tile_idx = tile_index + i
			var below_tile_idx = tile_index + (l.current_rows * i)
			var below_right_tile_idx = tile_index + (l.current_rows * i) + i
			var below_left_tile_idx = tile_index + (l.current_rows * i) - i
		
			var left_tile_idx = tile_index - i
			# print('above_tile_idx ' + str(above_tile_idx))
			if tile.col > - 1 + i and above_tile_idx >= 0 and above_tile_idx < tile_count and main.checkIfNodeDeleted(l.level_tiles[above_tile_idx]) == false:
				all_adjacent_tiles.append(l.level_tiles[above_tile_idx])
			if type == "fill" or type == "star":
				if tile.col > - 1 + i and tile.row < l.current_rows-i and above_right_tile_idx >= 0 and above_right_tile_idx < tile_count and main.checkIfNodeDeleted(l.level_tiles[above_right_tile_idx]) == false:
					all_adjacent_tiles.append(l.level_tiles[above_right_tile_idx])
		
				if tile.col > - 1 + i and tile.row > -1 + i and above_left_tile_idx >= 0 and above_left_tile_idx < tile_count and main.checkIfNodeDeleted(l.level_tiles[above_left_tile_idx]) == false:
					all_adjacent_tiles.append(l.level_tiles[above_left_tile_idx])
	
			if tile.row < l.current_rows-i and right_tile_idx >= 0 and right_tile_idx < tile_count and main.checkIfNodeDeleted(l.level_tiles[right_tile_idx]) == false:
				all_adjacent_tiles.append(l.level_tiles[right_tile_idx])
		
			if tile.col < l.current_cols-i and below_tile_idx >= 0 and below_tile_idx < tile_count and main.checkIfNodeDeleted(l.level_tiles[below_tile_idx]) == false:
				all_adjacent_tiles.append(l.level_tiles[below_tile_idx])
			
			if type == "fill" or type == "star":
				if tile.col > - 1 + i and tile.row < l.current_rows-i and below_right_tile_idx >= 0 and below_right_tile_idx < tile_count and main.checkIfNodeDeleted(l.level_tiles[below_right_tile_idx]) == false:
					all_adjacent_tiles.append(l.level_tiles[below_right_tile_idx])
		
				if tile.col > - 1 + i and tile.row > -1 + i and below_left_tile_idx >= 0 and below_left_tile_idx < tile_count and main.checkIfNodeDeleted(l.level_tiles[below_left_tile_idx]) == false:
					all_adjacent_tiles.append(l.level_tiles[below_left_tile_idx])
		
			if tile.row > -1 + i and left_tile_idx >= 0 and left_tile_idx < tile_count and main.checkIfNodeDeleted(l.level_tiles[left_tile_idx]) == false:
				all_adjacent_tiles.append(l.level_tiles[left_tile_idx])
		
	return all_adjacent_tiles


func get_closest_adjacent_tile(starting_node, target_node, random=false, is_player=false):
	""" Get closest tile based on adjacent tiles. target_node needs to be a tile """
	var lowest_cost = null
	var hold_tile = null
	var found_tile = null
	var target_tile = null
	var rand_list = []
	var player = get_node("/root/player")
	for n in target_node.neighbors:
		if n.can_move:
			if random:
				if not is_player and player and player.current_tile.index != n.index:
					rand_list.append(n)
				for next_n in n.neighbors:
					if not is_player and player and player.current_tile.index != next_n.index:
						rand_list.append(next_n)
			else:
				if hold_tile == null:
					hold_tile = n
				if lowest_cost == null or starting_node.global_position.distance_to(n.global_position) <= lowest_cost:
					lowest_cost = starting_node.global_position.distance_to(n.global_position)
					found_tile = n
	
	if random and len(rand_list) > 0:
		target_tile = rand_list[rand_range(0, len(rand_list))]
	elif found_tile != null:
		target_tile = found_tile
	elif hold_tile != null:
		target_tile = hold_tile

	return target_tile

"""
func get_closest_adjacent_tile(starting_node, target_node):
	// Get closest tile based on adjacent tiles. target_node needs to be a tile 
	var lowest_cost = null
	var hold_tile = null
	var found_tile = null
	var target_tile = null

	for n in target_node.neighbors:
		if n.can_move:
			if hold_tile == null:
				hold_tile = n
			if lowest_cost == null or starting_node.global_position.distance_to(n.global_position) <= lowest_cost:
				lowest_cost = starting_node.global_position.distance_to(n.global_position)
				found_tile = n

	if found_tile != null:
		target_tile = found_tile
	elif hold_tile != null:
		target_tile = hold_tile

	return target_tile
"""
