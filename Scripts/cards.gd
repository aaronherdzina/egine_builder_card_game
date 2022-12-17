extends Node
##################### IMPORTANT #####################
# card/ability/weapon dicts should be used to reference values only to avoid dups
# never change or apply these values to other dicts, just set any needed vars to..
# them within the file they are used, for example: in enemy.gb..
# there can be an enm_damage var, which could be; enm_damage = enm_damage_default + card_payload_example["damage"] = card_payload_example["weapon"]["damage"]
##################### IMPORTANT #####################

##### ABILITIES:
#### KEY consts to avoid issues with typos, or accidents using dmg instead damage, ect
# abilities have atk range and ability range, ability is the actual (how far this ability can be used) range..
# atk range is to represent if the ability buffs, or debuffs someones attack range
# all values are literal, if targeting an enmy to debuff
const CHAR_CARD = "char" # chars played onto field
const FOOD_CARD = "food"
const WATER_CARD = "water"
const HUNGER_CARD = "hunger"
const ID = "id"
const CHASSIS_CARD = "chassis"
const LEG_CARD = "leg"
const ARM_CARD = "arm"
const ENHANCEMENT_CARD = "enhancement" # usually require some other card 
const ABILITY_CARD = "ability"
const WEAPON_DAMAGE_TYPE = "impact" # impact, missile, fire, ect
const TROOP_CARD = "troop" # effect field chars
const MISC_CARD = "misc"
const TITLE = "title"
const ABL_TYPE = "ability_type"
const CARD_TYPE = "card_type"
const WEAPON_TYPE = "weapon_type"

const HEALTH = "health"
const DEFENSE = "defense"
const TOUGHNESS = "toughness"
const ATTACKS = "attacks"
const DAMAGE = "damage"
const ATTACK_RANGE = "attack_range"

const PIERCING = "piercing"
const BLEED = "bleed" # oil spill
const FLAMMABLE = "flammable"
const BURN = "burn"
const RUST = "rust"
const POISON = "poison"
const FREEZE = "freeze"
const STUN = "stun"
const OVERHUNGER = "overhunger"
const WEAPON = "weapon"

const FOOD = "food"
const FIRE = "fire"
const WATER = "water"
const IMPACT = "impact"
const BLADE = "blade"
const STEAM = "steam"
const ENERGY = "energy"
const MISSILE = "missile"
const EXPLOSION = "explosion"
const LEADER = "leader"
const SHIELD = "shield"
const ENEMIES = "enemies"
const ALLIES = "allies"
const SELF = "self"
const HUNGER_PRODUCTION = "hunger_production"
const FOOD_PRODUCTION = "food_production"
const ABILITY_RANGE = "ability_range"
const CARD_ACTION = "card_action"
const TARGET = "target"
const BUFF = "buff"
const DEBUFF = "debuff"
const CHASIS_ABL_1 = "chasis_ability_1"
const CHASIS_ABL_2 = "chasis_ability_2"
const CHASIS_ABL_3 = "chasis_ability_3"
const CHASIS_ABL_4 = "chasis_ability_4"
const CHASIS_ABL_5 = "chasis_ability_5"
const CHASIS_ABL_6 = "chasis_ability_6"
const CHASIS_ABL_7 = "chasis_ability_7"
const DESCRIPTION = ""
const CARD_WAIT_TIME = "card wait time"

const OVEREXTENDED = "overextended"
const COOLING = "cooling"
const HUNGER = "hunger"
const TAGS = "tags"
##
const VOLLEY = "volley"
const TAKE_AIM = "take aim"
const ARCHER_LEADER_ABILITY_1 = {TITLE: VOLLEY, ABL_TYPE: ATTACKS, ABILITY_RANGE: 3, DAMAGE: 2, PIERCING: true, TARGET: ENEMIES}
const ARCHER_LEADER_ABILITY_2 = {TITLE: TAKE_AIM, ABL_TYPE: BUFF, ABILITY_RANGE: 2, DAMAGE: 1, ATTACK_RANGE: 2, TARGET: ALLIES}

const FLURRY = "flurry"
const PARRY = "parry"
const SWORD_KNIGHT_LEADER_ABILITY_1 = {TITLE: FLURRY, ABL_TYPE: ATTACKS, ABILITY_RANGE: 1, DAMAGE: 5, PIERCING: true, BLEED: true, TARGET: ENEMIES}
const SWORD_KNIGHT_LEADER_ABILITY_2 = {TITLE: PARRY, ABL_TYPE: DEBUFF, DEFENSE: 10, TARGET: SELF}

const ADVANCE = "advance"
const CONTROL_FLANK = "control_flank"
const SPEAR_KNIGHT_LEADER_ABILITY_1 = {TITLE: ADVANCE, ABL_TYPE: BUFF, ABILITY_RANGE: 2, TOUGHNESS: 3, ATTACK_RANGE: 1, PIERCING: true, TARGET: ALLIES}
const SPEAR_KNIGHT_LEADER_ABILITY_2 = {TITLE: CONTROL_FLANK, ABL_TYPE: DEBUFF, ABILITY_RANGE: 3, ATTACK_RANGE: 1, TARGET: ENEMIES}

const IMG_PATH = "img_path"
#####
#####
const TABLEAU_LIMIT = "tableau_limit"
const HUNGER_LIMIT = "hunger_limit"
const CURRENT_HUNGER = "current_hunger"
const RIGHT_ARM_HEALTH = "right_arm_health"
const RIGHT_ARM_LIMIT = "right_arm_limit" 
const LEFT_ARM_HEALTH = "left_arm_health"
const LEFT_ARM_LIMIT = "left_arm_limit"
const LEG_LIMIT = "leg_limit"
#####

const LIGHT_CHASIS_COBRA = "light_cobra"
const LIGHT_COBRA_ABILITY_1 = "cobra_ability_1"
const LIGHT_COBRA_ABILITY_2 = "cobra_ability_2"
var card_light_cobra = {
	TITLE: LIGHT_CHASIS_COBRA,
	CARD_TYPE: CHAR_CARD,
	LEADER: false,
	HEALTH: 80,
	LEFT_ARM_HEALTH: 20,
	RIGHT_ARM_HEALTH: 20,
	CHASIS_ABL_1: LIGHT_COBRA_ABILITY_1, # process based on str elsewhere
	CHASIS_ABL_2: LIGHT_COBRA_ABILITY_2,
	LEFT_ARM_LIMIT: 3,
	RIGHT_ARM_LIMIT: 3,
	LEG_LIMIT: 3,
	TABLEAU_LIMIT: 8,
	IMG_PATH: false,
	HUNGER_LIMIT: 15, # adds to total hunger of player, over hungering adds overhunger cards to deck each turn and disable random parts
	ATTACK_RANGE: 0, # radius around character, or distance into enmy rank, 0-1 is adjacent
	DEFENSE: 10, # blocks dmg until depleted, regain after fight
	TOUGHNESS: 5, # blocks dmg until depleted, regain each round,
	DESCRIPTION: "Minimized Arms for reliable build"
}

const RECYCLE_ACTION = "recycle_action"

const WEAPON_CARD = "weapon_card"
const RIFLE = "rifle"
const SWORD = "sword"

# MISSILE
const PLASMA_RIFLE = "plasma rifle"
var card_plasma_rifle = {
	TITLE: PLASMA_RIFLE,
	CARD_TYPE: WEAPON_CARD,
	WEAPON_TYPE: RIFLE,
	WEAPON_DAMAGE_TYPE: FIRE + "_" + DAMAGE,
	ATTACKS: 5,
	DAMAGE: 2,
	HUNGER_PRODUCTION: 8,
	IMG_PATH: main.PLASMA_GUN,
	CARD_WAIT_TIME: .5,
	CARD_ACTION: "plasma_rifle_display_ability_1",
	RECYCLE_ACTION: "",
	DESCRIPTION: "Deals 1 additional damage for every Fire card attached and raises opponent Heat Production 1 for every 2 Fire cards attached.",
	TAGS: [FIRE, RIFLE, HUNGER]
}

const MISSILE_FLAK = "missile flak"
var card_missle_flak = {
	TITLE: MISSILE_FLAK,
	CARD_TYPE: WEAPON_CARD,
	WEAPON_TYPE: MISSILE,
	WEAPON_DAMAGE_TYPE: EXPLOSION + "_" + DAMAGE,
	ATTACKS: 5,
	DAMAGE: 2,
	HUNGER_PRODUCTION: 3,
	IMG_PATH: main.PLASMA_GUN,
	CARD_WAIT_TIME: .25,
	CARD_ACTION: "missile_flak_display_ability_1",
	RECYCLE_ACTION: "",
	DESCRIPTION: "Deals 1 additional damage to oppopnent Arm, Leg, and total health for each Missile card attached",
	TAGS: [MISSILE, EXPLOSION, HUNGER]
}

const IMPACT_LAUNCHER_ABILITY_1 = "impact_launcher_display_ability_1"
const IMPACT_LAUNCHER = "impact launcher"
var card_impact_launcher = {
	TITLE: IMPACT_LAUNCHER,
	CARD_TYPE: WEAPON_CARD,
	WEAPON_TYPE: RIFLE,
	WEAPON_DAMAGE_TYPE: IMPACT + "_" + DAMAGE,
	ATTACKS: 2,
	DAMAGE: 3,
	HUNGER_PRODUCTION: 5,
	IMG_PATH: main.PLASMA_GUN,
	CARD_WAIT_TIME: .75,
	CARD_ACTION: IMPACT_LAUNCHER_ABILITY_1,
	RECYCLE_ACTION: "",
	DESCRIPTION: "Damage is multiplied by amount of [IMPACT] cards attached",
	TAGS: [IMPACT, RIFLE]
}

const WEAPON_REMOVAL_BLADE = "weapon removal blade"
var card_weapon_removal_blade = {
	TITLE: WEAPON_REMOVAL_BLADE,
	CARD_TYPE: WEAPON_CARD,
	WEAPON_TYPE: BLADE,
	WEAPON_DAMAGE_TYPE: BLADE + "_" + DAMAGE,
	ATTACKS: 2,
	DAMAGE: 1,
	HUNGER_PRODUCTION: 1,
	IMG_PATH: main.PLASMA_GUN,
	CARD_WAIT_TIME: .15,
	CARD_ACTION: "weapon_removal_blade_display_ability_1",
	RECYCLE_ACTION: "",
	DESCRIPTION: "Deals damage to random opponent arm.\nIf total damage of all [BLADE] cards attached is greater than opponent Toughness and arm hit is at 50% or less health remove arm's first weapon.",
	TAGS: [BLADE]
}

const TREADS = "treads"
var card_treads = {
	TITLE: TREADS,
	CARD_TYPE: LEG_CARD,
	HUNGER_LIMIT: 3,
	HUNGER_PRODUCTION: 2,
	TABLEAU_LIMIT: 4, 
	DEFENSE: 15, # blocks dmg until depleted, regain after fight
	TOUGHNESS: 5, # blocks dmg until depleted, regain each round
	CARD_WAIT_TIME: .15,
	CARD_ACTION: "", # str name of func called elsewher
	RECYCLE_ACTION: "",
	IMG_PATH: false,
	DESCRIPTION: "",
	TAGS: []
}

const RIGHT_ARM_SALVO = "right_arm_salvo"
var card_ability_right_arm_salvo_1 = {
	TITLE: RIGHT_ARM_SALVO,
	CARD_TYPE: ABILITY_CARD,
	HUNGER_PRODUCTION: 5,
	CARD_WAIT_TIME: .15,
	CARD_ACTION: "activate_right_arm", # str name of func called elsewher
	RECYCLE_ACTION: "",
	IMG_PATH: false,
	DESCRIPTION: "Activate each right arm weapon.",
	TAGS: []
}

const LEFT_ARM_SALVO = "left_arm_salvo"
var card_ability_left_arm_salvo_1 = {
	TITLE: LEFT_ARM_SALVO,
	CARD_TYPE: ABILITY_CARD,
	HUNGER_PRODUCTION: 5,
	CARD_WAIT_TIME: .15,
	CARD_ACTION: "activate_left_arm", # str name of func called elsewher
	RECYCLE_ACTION: "",
	IMG_PATH: false,
	DESCRIPTION: "Activate each left arm weapon.",
	TAGS: []
}

const EMERGENCY_TRANSMISSIONS = "emergency transmissions"
var card_ability_emergency_transmission = {
	TITLE: EMERGENCY_TRANSMISSIONS,
	CARD_TYPE: ABILITY_CARD,
	HUNGER_PRODUCTION: 1,
	CARD_WAIT_TIME: .15,
	CARD_ACTION: "draw_2", # str name of func called elsewher
	RECYCLE_ACTION: "",
	IMG_PATH: main.BEAR_LIKE,
	DESCRIPTION: "Draw 2 cards",
	TAGS: []
}

const OPEN_FIRE = "open fire"
var card_ability_open_fire = {
	TITLE: OPEN_FIRE,
	CARD_TYPE: ABILITY_CARD,
	HUNGER_PRODUCTION: 1,
	CARD_WAIT_TIME: .15,
	CARD_ACTION: "open_fire_1_selected", # str name of func called elsewher
	RECYCLE_ACTION: "",
	IMG_PATH: main.LARGE_ELEPHANT,
	DESCRIPTION: "Activate first x weapon of cards from right to left arm equal to your [IMPACT]",
	TAGS: []
}

const SHIELDS_UP = "shields up"
var card_ability_shields_up = {
	TITLE: SHIELDS_UP,
	CARD_TYPE: ABILITY_CARD,
	HUNGER_PRODUCTION: 1,
	DEFENSE: 2,
	CARD_WAIT_TIME: .15,
	CARD_ACTION: "gain_defense", # str name of func called elsewher
	RECYCLE_ACTION: "",
	IMG_PATH: main.ROCK_FOX,
	DESCRIPTION: "Gain 5 Defense plus 1 for every attached [SHIELD]",
	TAGS: [SHIELD]
}

const DECK_LIMIT = 30
const DEFAULT_HAND_LIMIT = 3

const OPEN_FIRE_1_SELECTED = "open_fire_1_selected"

const CALL_REINFORCEMENTS = "call reinforcements"
const GAIN_START_DRAW_1 = "gain_start_draw_1"
var card_chassis_call_reinforcments = {
	TITLE: CALL_REINFORCEMENTS,
	CARD_TYPE: CHASSIS_CARD,
	HUNGER_PRODUCTION: 5,
	CARD_WAIT_TIME: .5,
	CARD_ACTION: GAIN_START_DRAW_1, # str name of func called elsewher
	RECYCLE_ACTION: "",
	IMG_PATH: main.TRIPPLE_ELEPHANT,
	DESCRIPTION: "Add 1 to your draw next turn",
	TAGS: [HEALTH]
}


const FORAGERS = "foragers"
const FORAGERS_1 = "foragers_1"
var card_foragers_1 = {
	TITLE: FORAGERS,
	CARD_TYPE: CHASSIS_CARD,
	FOOD_PRODUCTION: 2,
	HUNGER_PRODUCTION: 2,
	HEALTH: 5,
	CARD_WAIT_TIME: .5,
	CARD_ACTION: FORAGERS_1, # str name of func called elsewher
	RECYCLE_ACTION: "",
	IMG_PATH: main.BEAR_LIKE,
	DESCRIPTION: "Heal 5 and reduce [HUNGER PRODUCTION] by 2",
	TAGS: [HEALTH]
}

const WASTE_REDUCTION = "waste reduction"
const WASTE_REDUCTION_1 = "waste_reduction_1"
var card_waste_reduction = {
	# Vultrues 
	TITLE: WASTE_REDUCTION,
	CARD_TYPE: CHASSIS_CARD,
	HUNGER_PRODUCTION: 1,
	CARD_WAIT_TIME: .5,
	CARD_ACTION: WASTE_REDUCTION_1, # str name of func called elsewher
	RECYCLE_ACTION: "",
	IMG_PATH: false,
	DESCRIPTION: "Reduce [HUNGER PRODUCTION] by 1 + each [HUNGER] card in play on your side",
	TAGS: [HEALTH, COOLING]
}
const GROWING_HUNGER = "growing hunger"
const GROWING_HUNGER_1 = "growing_hunger_1"
var card_growing_hunger = {
	# Vultrues 
	TITLE: GROWING_HUNGER,
	CARD_TYPE: ABILITY_CARD,
	FOOD_PRODUCTION: 10,
	CARD_WAIT_TIME: .5,
	CARD_ACTION: GROWING_HUNGER_1, # str name of func called elsewher
	RECYCLE_ACTION: "",
	IMG_PATH: false,
	DESCRIPTION: "Increase Hunger by 10",
	TAGS: [HUNGER]
}
const FOOD_STOCK = "growing_hunger"
const FOOD_STOCK_1 = "food_stock_1"
var card_food_stock = {
	# Vultrues 
	TITLE: FOOD_STOCK,
	CARD_TYPE: ABILITY_CARD,
	FOOD_PRODUCTION: 2,
	CARD_WAIT_TIME: .5,
	CARD_ACTION: FOOD_STOCK_1, # str name of func called elsewher
	RECYCLE_ACTION: "",
	IMG_PATH: false,
	DESCRIPTION: "Decrease Hunger by 2",
	TAGS: [FOOD]
}
const OVEREXTENDED_CARD_TITLE = "overextended"
const OVEREXTENDED_1 = "overextended_1"
var card_overextended_stock = {
	# Vultrues 
	TITLE: OVEREXTENDED_CARD_TITLE,
	CARD_TYPE: FOOD_CARD,
	DAMAGE: 5,
	CARD_WAIT_TIME: .5,
	CARD_ACTION: OVEREXTENDED_1, # str name of func called elsewher
	RECYCLE_ACTION: "",
	IMG_PATH: false,
	DESCRIPTION: "Take 5 damage",
	TAGS: [FOOD]
}

var starting_deck = [card_treads, card_treads, card_waste_reduction, card_waste_reduction, card_waste_reduction,
					card_growing_hunger, card_growing_hunger, card_growing_hunger, card_ability_open_fire, card_ability_open_fire,
					card_plasma_rifle, card_plasma_rifle, card_ability_shields_up, card_ability_shields_up, card_ability_shields_up,
					card_impact_launcher, card_impact_launcher, card_foragers_1, card_foragers_1, card_ability_shields_up,
					card_food_stock, card_food_stock, card_food_stock, card_food_stock, card_food_stock,
					card_chassis_call_reinforcments, card_chassis_call_reinforcments, card_foragers_1, card_foragers_1, card_ability_shields_up ]

var impact_starting_deck = [card_treads, card_treads, card_waste_reduction, card_waste_reduction, card_waste_reduction,
					card_chassis_call_reinforcments, card_growing_hunger, card_growing_hunger, card_growing_hunger, card_impact_launcher,
					card_impact_launcher, card_food_stock, card_waste_reduction, card_waste_reduction, card_waste_reduction,
					card_impact_launcher, card_impact_launcher, card_food_stock, card_foragers_1, card_foragers_1,
					card_food_stock, card_food_stock, card_food_stock, card_food_stock, card_food_stock,
					card_chassis_call_reinforcments, card_chassis_call_reinforcments, card_foragers_1, card_foragers_1, card_foragers_1 ]

var hand = []
var hand_idx = 0
var tableau_idx = 0
var card_detail_list = []
var current_card_menu = "hand"
var card_expanded = false

var enm_hand = []
var enm_hand_idx = 0
var enm_tableau_idx = 0
var enm_card_detail_list = []
var player_display_turn = true
var waiting = false

func take_turn(is_player=true):
	if not waiting:
		waiting = true
		remove_all_cards_in_hand(is_player)
	
		if is_player:
			if meta.player_hand_limit > meta.player_hand_limit_max:
				meta.player_hand_limit = meta.player_hand_limit_max
			spawn_cards(meta.player_hand_limit)
			if meta.player_hand_limit > meta.player_hand_limit_default:
				meta.player_hand_limit = meta.player_hand_limit_default
			meta.player_turn = false
				
			var timer = Timer.new()
			var time = 1
			get_node("/root").add_child(timer)
			timer.set_wait_time(time)
			timer.set_one_shot(true)
			timer.start()
			yield(timer, "timeout")
			timer.queue_free()
			waiting = false
		else:
			play_all_display_card_actions(true)
			remove_all_cards_in_hand(false)
			var timer = Timer.new()
			var time = 4
			get_node("/root").add_child(timer)
			timer.set_wait_time(time)
			timer.set_one_shot(true)
			timer.start()
			yield(timer, "timeout")
			timer.queue_free()
			spawn_cards(4, false)
	
			var timer2 = Timer.new()
			var time2 = 3
			get_node("/root").add_child(timer2)
			timer2.set_wait_time(time2)
			timer2.set_one_shot(true)
			timer2.start()
			yield(timer2, "timeout")
			timer2.queue_free()
			play_all_display_card_actions(false)
			
			var timer3 = Timer.new()
			var time3 = 3
			get_node("/root").add_child(timer3)
			timer3.set_wait_time(time3)
			timer3.set_one_shot(true)
			timer3.start()
			yield(timer3, "timeout")
			timer3.queue_free()
			meta.player_turn = true
			for card in enm_hand:
				if card and main.checkIfNodeDeleted(card) == false:
					card.modulate = Color(.5, .5, .5, 1)
			waiting = false
			take_turn(meta.player_turn)



func play_all_display_card_actions(is_player=true):
	if get_node("/root").has_node("level"):
		var level = get_node("/root/level")
		if is_player and player_display_turn:
			for card in level.player_chassis_list:
				card.modulate = Color(.4, .4, 1, 1)
				expand_card_details(card)

				var should_stop = card_action(card.get_node("action").get_text(), is_player, "", card)
				level.update_text_overlays()
				if should_stop: return
				var timer = Timer.new()
				var time = float(card.get_node("timer").get_text())
				print("time " + str(time))
				get_node("/root").add_child(timer)
				timer.set_wait_time(time)
				timer.set_one_shot(true)
				timer.start()
				yield(timer, "timeout")
				timer.queue_free()
				card.modulate = Color(1, 1, 1, 1)

			for card in level.player_right_arm_list:
				card.modulate = Color(.4, .4, 1, 1)
				expand_card_details(card)

				var should_stop = card_action(card.get_node("action").get_text(), is_player, "", card)
				level.update_text_overlays()
				if should_stop: return
				var timer = Timer.new()
				get_node("/root").add_child(timer)
				timer.set_wait_time(float(card.get_node("timer").get_text()))
				timer.set_one_shot(true)
				timer.start()
				yield(timer, "timeout")
				timer.queue_free()
				card.modulate = Color(1, 1, 1, 1)

			for card in level.player_left_arm_list:
				card.modulate = Color(.4, .4, 1, 1)
				expand_card_details(card)
				
				var should_stop = card_action(card.get_node("action").get_text(), is_player, "", card)
				level.update_text_overlays()
				if should_stop: return
				var timer = Timer.new()
				get_node("/root").add_child(timer)
				timer.set_wait_time(float(card.get_node("timer").get_text()))
				timer.set_one_shot(true)
				timer.start()
				yield(timer, "timeout")
				timer.queue_free()
				card.modulate = Color(1, 1, 1, 1)

			for card in level.player_leg_list:
				card.modulate = Color(.4, .4, 1, 1)
				expand_card_details(card)

				var should_stop = card_action(card.get_node("action").get_text(), is_player, "", card)
				level.update_text_overlays()
				if should_stop: return
				var timer = Timer.new()
				get_node("/root").add_child(timer)
				timer.set_wait_time(float(card.get_node("timer").get_text()))
				timer.set_one_shot(true)
				timer.start()
				yield(timer, "timeout")
				timer.queue_free()
				card.modulate = Color(1, 1, 1, 1)
			player_display_turn = false
		# end of player logic
		else:
			# Enemy:
			for card in level.enemy_chassis_list:
				card.modulate = Color(.4, .4, 1, 1)
				expand_card_details(card)

				var should_stop = card_action(card.get_node("action").get_text(), is_player, "", card)
				level.update_text_overlays()
				if should_stop: return
				var timer = Timer.new()
				var time = float(card.get_node("timer").get_text())
				print("time " + str(time))
				get_node("/root").add_child(timer)
				timer.set_wait_time(time)
				timer.set_one_shot(true)
				timer.start()
				yield(timer, "timeout")
				timer.queue_free()
				card.modulate = Color(1, 1, 1, 1)

			for card in level.enemy_right_arm_list:
				card.modulate = Color(.4, .4, 1, 1)
				expand_card_details(card)

				var should_stop = card_action(card.get_node("action").get_text(), is_player, "", card)
				if should_stop: return
				level.update_text_overlays()
				var timer = Timer.new()
				get_node("/root").add_child(timer)
				timer.set_wait_time(float(card.get_node("timer").get_text()))
				timer.set_one_shot(true)
				timer.start()
				yield(timer, "timeout")
				timer.queue_free()
				card.modulate = Color(1, 1, 1, 1)

			for card in level.enemy_left_arm_list:
				card.modulate = Color(.4, .4, 1, 1)
				expand_card_details(card)
				
				var should_stop = card_action(card.get_node("action").get_text(), is_player, "", card)
				level.update_text_overlays()
				if should_stop: return
				var timer = Timer.new()
				get_node("/root").add_child(timer)
				timer.set_wait_time(float(card.get_node("timer").get_text()))
				timer.set_one_shot(true)
				timer.start()
				yield(timer, "timeout")
				timer.queue_free()
				card.modulate = Color(1, 1, 1, 1)

			for card in level.enemy_leg_list:
				card.modulate = Color(.4, .4, 1, 1)
				expand_card_details(card)

				var should_stop = card_action(card.get_node("action").get_text(), is_player, "", card)
				level.update_text_overlays()
				if should_stop: return
				var timer = Timer.new()
				get_node("/root").add_child(timer)
				timer.set_wait_time(float(card.get_node("timer").get_text()))
				timer.set_one_shot(true)
				timer.start()
				yield(timer, "timeout")
				timer.queue_free()
				card.modulate = Color(1, 1, 1, 1)
			player_display_turn = true


func apply_text_effect(text_type, text, is_player=true, card=null):
	# sTEXT_EFECT 
	if get_node("/root").has_node("level"):
		var level = get_node("/root/level")
		var hurt = "hurt"
		var hunger = "hunger"
		var normal = "normal"
		var healed = "healed"
		var burn = "burn"
		if text_type == hurt:
			var effect = main.TEXT_EFECT.instance()
			get_node("/root").call_deferred("add_child", effect)
			effect.get_node("anim_controller/text").set_text(str(text))
			if is_player:
				effect.position = level.get_node("text_cont/enemy_health_max_pos").global_position
			else:
				effect.position = level.get_node("text_cont/player_health_max_pos").global_position

			effect.get_node("anim").play(hurt)
		elif text_type == hunger:
			var effect = main.TEXT_EFECT.instance()
			get_node("/root").call_deferred("add_child", effect)
			effect.get_node("anim_controller/text").set_text(str(text))
			if is_player:
				effect.position = level.get_node("text_cont/player_hunger_pos").global_position
			else:
				effect.position = level.get_node("text_cont/enemy_hunger_pos").global_position

			effect.get_node("anim").play(hunger)


func card_action(act_str, is_player=true, avoid_recursion_str="", card=null):
	#
	# Change pulling card details from text boxes to storing in new attached script
	#
	#
	#
	#
	#
	#
	#
	#
	#
	#
	#
	

	act_str = act_str.to_lower()
	avoid_recursion_str = avoid_recursion_str.to_lower()
	if avoid_recursion_str == act_str:
		print("in card_action RECURSION: " + act_str + " " + avoid_recursion_str)
		return
	
	if get_node("/root").has_node("level"):
		var action_time = .5
		if card:
			expand_card_details(card)
			card.modulate = Color(.4, .4, 1, 1)
		var level = get_node("/root/level")
		print(str(card.get_node("tags").get_text().split(",")) + " act_str " + act_str + " avoid_recursion_str " + avoid_recursion_str)
		
		# will be print(card.tags)
		# 1 ############################################
		## make sure there is enough food and water to play card
		#
		if is_player: # EVENTUALLY REMOVE THIS CONDITOONAL 

			if is_player:
				if meta.current_player_hunger > meta.max_player_hunger:
					meta.current_player_hunger = 0
					meta.player_health -= meta.player_hunger_damage
					print("OVERHUNGERING")
					if card:
						card.modulate = Color(1, 1, 1, 1)
					return "stop"
			else:
				if meta.current_enemy_hunger > meta.max_enemy_hunger:
					meta.current_enemy_hunger = 0
					meta.enemy_health -= meta.enemy_hunger_damage
					print("ENM OVERHUNGERING")
					if card:
						card.modulate = Color(1, 1, 1, 1)
					return "stop"

			
			# 2 ############################################
			## Get info from played cards (may be changed)
			#
			
			var bonus_atks = meta.player_attacks_bonus
			var bonus_dmg = meta.player_damage_bonus
			var bonus_def = meta.player_health_bonus
			var bonus_toughness = meta.player_toughness_bonus
			var bonus_health = meta.player_defense_bonus
			var hunger_bonus = meta.player_hunger_production_bonus
			var water_bonus = meta.player_water_bonus
			if not is_player:
				bonus_atks = meta.enemy_attacks_bonus
				bonus_dmg = meta.enemy_damage_bonus
				bonus_def = meta.enemy_health_bonus
				bonus_toughness = meta.enemy_toughness_bonus
				bonus_health = meta.enemy_defense_bonus
				hunger_bonus = meta.enemy_hunger_production_bonus
				water_bonus = meta.enemy_water_bonus
			
			##### will be card.atks + bonus_atks
			var atks = int(card.get_node("detail_4").get_text()) + bonus_atks
			var dmg = int(card.get_node("detail_5").get_text()) + bonus_dmg 

			var health = int(card.get_node("detail_1").get_text()) + bonus_health
			var toughnes = int(card.get_node("detail_2").get_text()) + bonus_toughness
			var defense = int(card.get_node("detail_3").get_text()) + bonus_def

			var total_dmg = round(atks * dmg)

			var action_sub_time = (action_time*.33)
			var action_sub_shake_vel = 2

			##### will be card.hunger + hunger_bonus
			var hunger = int(card.get_node("detail_6").get_text()) + hunger_bonus

			meta.player_health += health
			meta.player_defense += defense
			meta.player_toughnes += toughnes
			if hunger > 0:
				if is_player:
					var leftover_food = meta.player_food - hunger
					if leftover_food > 0:
						meta.player_food -= hunger
					else:
						print("player out of food("+str(meta.player_food)+"), can't do " + act_str)
				else:
					var leftover_food = meta.enemy_food - hunger
					if leftover_food > 0:
						meta.enemy_food -= hunger
					else:
						print("enemy out of food ("+str(meta.enemy_food)+"), can't do " + act_str)
				main.cameraShake(.1, action_sub_time)
				apply_text_effect("hunger", "- " + str(hunger), is_player) #TEXT_EFECT

			# 3 ############################################
			## PROCESS ATKS/DAMAGE
			#
			if atks > 0:
				for atk in range(0, atks):
					# print("hunger: " +str(hunger) + " atks: " + str(atks) + " atk: " + str(atk))
					if dmg > 0:
						var timer = Timer.new()
						get_node("/root").add_child(timer)
						timer.set_wait_time(action_time)
						timer.set_one_shot(true)
						timer.start()
						yield(timer, "timeout")
						timer.queue_free()
						main.cameraShake(action_sub_shake_vel, action_sub_time)
						apply_text_effect("hurt", "- " + str(dmg), is_player) #TEXT_EFECT
						meta.enemy_health -= int(dmg)

			level.update_text_overlays()
			############################################
			#### Process Actions
			if act_str == OVEREXTENDED_1 and not "stop_" in avoid_recursion_str:
				card.modulate = Color(1, .2, .2, 1)
				apply_text_effect("hurt", "- " + str(dmg)) #TEXT_EFECT
				meta.enemy_health += int(dmg)
				
			elif act_str == FOOD_STOCK_1 and not "stop_" in avoid_recursion_str:
				card.modulate = Color(.2, 1, .2, 1)
				apply_text_effect("hunger", "- " + str(hunger)) #TEXT_EFECT
				meta.current_player_hunger -= hunger
			elif act_str == GROWING_HUNGER_1 and not "stop_" in avoid_recursion_str:
				card.modulate = Color(.2, 1, .2, 1)
				apply_text_effect("hunger", "+ " + str(hunger)) #TEXT_EFECT
				meta.current_player_hunger += hunger
			if act_str == GAIN_START_DRAW_1 and not "stop_" in avoid_recursion_str:
				meta.player_hand_limit += 1
				meta.current_salvage += 10
				apply_text_effect("hunger", "+ 10") #TEXT_EFECT
				meta.current_player_hunger += 10
			elif act_str == WASTE_REDUCTION_1 and not "stop_" in avoid_recursion_str:
				var total_hunger_count = 0
				print("WASTE_REDUCTION_1 " + str(WASTE_REDUCTION_1))
				for weapon_card in level.player_right_arm_list:
					for tag in weapon_card.get_node("tags").get_text().split(","):
						if tag == HUNGER:
							main.cameraShake(action_sub_shake_vel, action_sub_time)
							expand_card_details(weapon_card)
							total_hunger_count += 1
							var timer = Timer.new()
							get_node("/root").add_child(timer)
							timer.set_wait_time(action_time)
							timer.set_one_shot(true)
							timer.start()
							yield(timer, "timeout")
							timer.queue_free()
							apply_text_effect("hunger up", "- 1") #TEXT_EFECT
							break
				
				for weapon_card in level.player_left_arm_list:
					for tag in weapon_card.get_node("tags").get_text().split(","):
						if tag == HUNGER:
							main.cameraShake(action_sub_shake_vel, action_sub_time)
							expand_card_details(weapon_card)
							total_hunger_count += 1
							var timer = Timer.new()
							get_node("/root").add_child(timer)
							timer.set_wait_time(action_time)
							timer.set_one_shot(true)
							timer.start()
							yield(timer, "timeout")
							timer.queue_free()
							apply_text_effect("hunger up", "- 1") #TEXT_EFECT
							break
				
				for weapon_card in level.player_chassis_list:
					for tag in weapon_card.get_node("tags").get_text().split(","):
						if tag == HUNGER:
							main.cameraShake(action_sub_shake_vel, action_sub_time)
							expand_card_details(weapon_card)
							total_hunger_count += 1
							var timer = Timer.new()
							get_node("/root").add_child(timer)
							timer.set_wait_time(action_time)
							timer.set_one_shot(true)
							timer.start()
							yield(timer, "timeout")
							timer.queue_free()
							apply_text_effect("hunger up", "- 1") #TEXT_EFECT
							break
				
				for weapon_card in level.player_leg_list:
					for tag in weapon_card.get_node("tags").get_text().split(","):
						if tag == HUNGER:
							main.cameraShake(action_sub_shake_vel, action_sub_time)
							expand_card_details(weapon_card)
							total_hunger_count += 1
							var timer = Timer.new()
							get_node("/root").add_child(timer)
							timer.set_wait_time(action_time)
							timer.set_one_shot(true)
							timer.start()
							yield(timer, "timeout")
							timer.queue_free()
							apply_text_effect("hunger up", "- 1") #TEXT_EFECT
							break
				print(act_str + ": total_hunger_count: " + str(total_hunger_count))
				meta.current_player_hunger -= total_hunger_count
				level.update_text_overlays()
				if card:
					card.modulate = Color(1, 1, 1, 1)
				return

			elif act_str == IMPACT_LAUNCHER_ABILITY_1 and not "stop_" in avoid_recursion_str:
				# Activate first x weapon of cards from right to left arm equal to your [IMPACT]"
				for weapon_card in level.player_right_arm_list:
					var skill_impact_count = 0
					for tag in card.get_node("tags").get_text().split(","):
						if IMPACT == tag:
							main.cameraShake(.6, (action_time*.4))
							expand_card_details(weapon_card)
							#card_action(card.get_node("action").get_text(), is_player, "stop_"+act_str, card)
							skill_impact_count += 1
							meta.enemy_health -= int(dmg)
							var timer = Timer.new()
							get_node("/root").add_child(timer)
							timer.set_wait_time(action_time)
							timer.set_one_shot(true)
							timer.start()
							yield(timer, "timeout")
							timer.queue_free()
							apply_text_effect("hunger", "+ 1") #TEXT_EFECT
							break
					meta.enemy_health -= int(skill_impact_count)
					apply_text_effect("hurt", "- " + str(skill_impact_count)) #TEXT_EFECT

				for weapon_card in level.player_left_arm_list:
					var skill_impact_count = 0
					for tag in card.get_node("tags").get_text().split(","):
						if IMPACT == tag:
							main.cameraShake(.6, (action_time*.4))
							expand_card_details(weapon_card)
							#card_action(card.get_node("action").get_text(), is_player, "stop_"+act_str, card)
							skill_impact_count += 1
							var timer = Timer.new()
							get_node("/root").add_child(timer)
							timer.set_wait_time(action_time)
							timer.set_one_shot(true)
							timer.start()
							yield(timer, "timeout")
							timer.queue_free()
							apply_text_effect("hunger", "+ 1") #TEXT_EFECT
							break
					meta.enemy_health -= int(skill_impact_count)
					main.cameraShake(skill_impact_count*.5, (action_time*.4))
					apply_text_effect("hurt", "- " + str(skill_impact_count)) #TEXT_EFECT
			level.update_text_overlays()

		else: # EVENTUALLY REMOVE THIS CONDITOONAL 
			####
			#
			#
			### Enemy
			#
			#
			####
			if meta.current_enemy_hunger > meta.max_enemy_hunger:
				meta.current_enemy_hunger = 0
				meta.enemy_health -= meta.enemy_hunger_damage
				print("ENM OVERHUNGERING")
				if card:
					card.modulate = Color(1, 1, 1, 1)
				return "stop"

			# ACTIVATING cards applies basic stats if present on card like when player, 
			# and additional func called
			# spend hunger, multiply dmg by atk, ect
			var atks = int(card.get_node("detail_4").get_text()) + meta.enemy_attacks_bonus
			var dmg = int(card.get_node("detail_5").get_text()) + meta.enemy_damage_bonus 

			var health = int(card.get_node("detail_1").get_text()) + meta.enemy_health_bonus
			var toughnes = int(card.get_node("detail_2").get_text())  + meta.enemy_toughness_bonus
			var defense = int(card.get_node("detail_3").get_text()) + meta.enemy_defense_bonus
			
			meta.enemy_health += health
			meta.enemy_defense += defense
			meta.enemy_toughnes += toughnes

			var total_dmg = atks * dmg
			print("enm deals " + str(total_dmg) + " total_dmg")
			#
			#
			########
			var hunger = int(card.get_node("detail_6").get_text()) + meta.enemy_hunger_production_bonus
			if atks > 0:
				for atk in range(0, atks):
					# print("hunger: " +str(hunger) + " atks: " + str(atks) + " atk: " + str(atk))
					if dmg > 0:
						var timer = Timer.new()
						get_node("/root").add_child(timer)
						timer.set_wait_time(action_time)
						timer.set_one_shot(true)
						timer.start()
						yield(timer, "timeout")
						timer.queue_free()
						main.cameraShake(2, (action_time*.4))
						apply_text_effect("hurt", "- " + str(dmg), false) #TEXT_EFECT
						meta.player_health -= int(dmg)
					apply_text_effect("hunger", "+ " + str(hunger), false) #TEXT_EFECT
					meta.current_enemy_hunger += hunger
					level.update_text_overlays()
			else:
				if hunger > 0:
					meta.current_enemy_hunger -= hunger
					main.cameraShake(.6, (action_time*.4))
					apply_text_effect("hunger up", "- " + str(hunger), false) #TEXT_EFECT
				level.update_text_overlays()

			if act_str == OVEREXTENDED_1 and not "stop_" in avoid_recursion_str:
				card.modulate = Color(1, .2, .2, 1)
				apply_text_effect("hurt", "- " + str(dmg), false) #TEXT_EFECT
				meta.player_health += int(dmg)
			elif act_str == FOOD_STOCK_1 and not "stop_" in avoid_recursion_str:
				card.modulate = Color(.2, 1, .2, 1)
				apply_text_effect("hunger", "- " + str(hunger), false) #TEXT_EFECT
				meta.current_enemy_hunger -= hunger
			elif act_str == GROWING_HUNGER_1 and not "stop_" in avoid_recursion_str:
				card.modulate = Color(.2, 1, .2, 1)
				apply_text_effect("hunger", "+ " + str(hunger), false) #TEXT_EFECT
				meta.current_enemy_hunger += hunger
			elif act_str == GAIN_START_DRAW_1 and not "stop_" in avoid_recursion_str:
				meta.enemy_hand_limit += 1
				apply_text_effect("hunger", "+ 10", false) #TEXT_EFECT
				meta.current_enemy_hunger += 10
			elif act_str == WASTE_REDUCTION_1 and not "stop_" in avoid_recursion_str:
				var total_hunger_count = 0
				print("WASTE_REDUCTION_1 " + str(act_str))
				for weapon_card in level.enemy_right_arm_list:
					for tag in weapon_card.get_node("tags").get_text().split(","):
						if tag == HUNGER:
							main.cameraShake(.6, (action_time*.4))
							expand_card_details(weapon_card)
							total_hunger_count += 1
							var timer = Timer.new()
							get_node("/root").add_child(timer)
							timer.set_wait_time(action_time)
							timer.set_one_shot(true)
							timer.start()
							yield(timer, "timeout")
							timer.queue_free()
							apply_text_effect("hunger up", "- 1", false) #TEXT_EFECT
							break
				
				for weapon_card in level.enemy_left_arm_list:
					for tag in weapon_card.get_node("tags").get_text().split(","):
						if tag == HUNGER:
							main.cameraShake(.6, (action_time*.4))
							expand_card_details(weapon_card)
							total_hunger_count += 1
							var timer = Timer.new()
							get_node("/root").add_child(timer)
							timer.set_wait_time(action_time)
							timer.set_one_shot(true)
							timer.start()
							yield(timer, "timeout")
							timer.queue_free()
							apply_text_effect("hunger up", "- 1", false) #TEXT_EFECT
							break
				
				for weapon_card in level.enemy_chassis_list:
					for tag in weapon_card.get_node("tags").get_text().split(","):
						if tag == HUNGER:
							main.cameraShake(.6, (action_time*.4))
							expand_card_details(weapon_card)
							total_hunger_count += 1
							var timer = Timer.new()
							get_node("/root").add_child(timer)
							timer.set_wait_time(action_time)
							timer.set_one_shot(true)
							timer.start()
							yield(timer, "timeout")
							timer.queue_free()
							apply_text_effect("hunger up", "- 1", false) #TEXT_EFECT
							break
				
				for weapon_card in level.enemy_leg_list:
					for tag in weapon_card.get_node("tags").get_text().split(","):
						if tag == HUNGER:
							main.cameraShake(.6, (action_time*.4))
							expand_card_details(weapon_card)
							total_hunger_count += 1
							var timer = Timer.new()
							get_node("/root").add_child(timer)
							timer.set_wait_time(action_time)
							timer.set_one_shot(true)
							timer.start()
							yield(timer, "timeout")
							timer.queue_free()
							apply_text_effect("hunger up", "- 1", false) #TEXT_EFECT
							break
				print("enm total_hunger_count: " + str(total_hunger_count))
				meta.current_enemy_hunger -= total_hunger_count
				level.update_text_overlays()
				if card:
					card.modulate = Color(1, 1, 1, 1)
				return

			elif act_str == IMPACT_LAUNCHER_ABILITY_1 and not "stop_" in avoid_recursion_str:
				# Activate first x weapon of cards from right to left arm equal to your [IMPACT]"
				for weapon_card in level.enemy_right_arm_list:
					var skill_impact_count = 0
					for tag in card.get_node("tags").get_text().split(","):
						if IMPACT == tag:
							main.cameraShake(.6, (action_time*.4))
							expand_card_details(weapon_card)
							#card_action(card.get_node("action").get_text(), is_player, "stop_"+act_str, card)
							skill_impact_count += 1
							meta.player_health -= int(dmg)
							var timer = Timer.new()
							get_node("/root").add_child(timer)
							timer.set_wait_time(action_time)
							timer.set_one_shot(true)
							timer.start()
							yield(timer, "timeout")
							timer.queue_free()
							apply_text_effect("hunger", "+ 1", false) #TEXT_EFECT
							break
					meta.player_health -= int(skill_impact_count)
					main.cameraShake(skill_impact_count*.5, (action_time*.4))
					apply_text_effect("hurt", "- " + str(skill_impact_count), false) #TEXT_EFECT

				for weapon_card in level.enemy_left_arm_list:
					var skill_impact_count = 0
					for tag in card.get_node("tags").get_text().split(","):
						if IMPACT == tag:
							main.cameraShake(.6, (action_time*.4))
							expand_card_details(weapon_card)
							#card_action(card.get_node("action").get_text(), is_player, "stop_"+act_str, card)
							skill_impact_count += 1
							var timer = Timer.new()
							get_node("/root").add_child(timer)
							timer.set_wait_time(action_time)
							timer.set_one_shot(true)
							timer.start()
							yield(timer, "timeout")
							timer.queue_free()
							apply_text_effect("hunger", "+ 1", false) #TEXT_EFECT
							break
					meta.player_health -= int(skill_impact_count)
					main.cameraShake(skill_impact_count*.5, (action_time*.4))
					apply_text_effect("hurt", "- " + str(skill_impact_count), false) #TEXT_EFECT
					
				level.update_text_overlays()
		if card:
			card.modulate = Color(1, 1, 1, 1)
		level.update_text_overlays()
		reset_display_card_sizes()


func play_card(player_card_list, player_card_idx, is_player=true):
	# card_action(player_card_list[player_card_idx][CARD_ACTION], is_player, "")
	if is_player:
		if hand_idx >= 0 and hand_idx <= len(hand) - 1 and len(hand) > 0:
			if card_detail_list[hand_idx][CARD_TYPE] == ABILITY_CARD:
				hand[hand_idx].visible = false
				var level = get_node("/root/level")
				var should_stop = card_action(card_detail_list[player_card_idx][CARD_ACTION], is_player, "", hand[hand_idx])
				level.update_text_overlays()
				if should_stop: return
				var timer = Timer.new()
				get_node("/root").add_child(timer)
				timer.set_wait_time(float(card_detail_list[player_card_idx][CARD_WAIT_TIME]))
				timer.set_one_shot(true)
				timer.start()
				yield(timer, "timeout")
				timer.queue_free()
				hand[hand_idx].modulate = Color(1, 1, 1, 1)
			else:
				place_card_in_display(player_card_list, player_card_idx, is_player)
		else:
			print("whoops player, didn't play a card successfully")

	else:
		if player_card_idx >= 0 and player_card_idx <= len(player_card_list) - 1 and len(player_card_list) > 0:
			if enm_card_detail_list[player_card_idx][CARD_TYPE] == ABILITY_CARD:
				player_card_list[player_card_idx].visible = false
				var level = get_node("/root/level")
				var should_stop = card_action(enm_card_detail_list[player_card_idx][CARD_ACTION], is_player, "", player_card_list[player_card_idx])
				level.update_text_overlays()
				if should_stop: return
				var timer = Timer.new()
				get_node("/root").add_child(timer)
				timer.set_wait_time(float(enm_card_detail_list[player_card_idx][CARD_WAIT_TIME]))
				timer.set_one_shot(true)
				timer.start()
				yield(timer, "timeout")
				timer.queue_free()
				player_card_list[player_card_idx].modulate = Color(1, 1, 1, 1)
			else:
				place_card_in_display(player_card_list, player_card_idx, is_player)
		else:
			print("whoops enm, didn't play a card successfully")


func place_card_in_display(player_card_list, player_card_idx, is_player=false):
	if is_player:
		if hand_idx >= 0 and hand_idx <= len(hand) - 1 and len(hand) > 0:
			if card_detail_list[hand_idx][CARD_TYPE] == ABILITY_CARD:
				hand[hand_idx].visible = false
			else:
				var level = get_node("/root/level")
				var new_card = main.CARD.instance()
				new_card.set_scale(Vector2(.7, .7))
				get_node("/root").add_child(new_card)
				if card_detail_list[hand_idx][CARD_TYPE] == WEAPON_CARD:
					if len(level.player_right_arm_list) < level.player_right_arm_list_limit:
						level.player_right_arm_list.append(new_card)
					elif len(level.player_left_arm_list) < level.player_left_arm_list_limit:
						level.player_left_arm_list.append(new_card)
					else:
						print("no more room for weapon cards")
				elif card_detail_list[hand_idx][CARD_TYPE] == CHASSIS_CARD ||\
					 card_detail_list[hand_idx][CARD_TYPE] == HUNGER_CARD ||\
					 card_detail_list[hand_idx][CARD_TYPE] == FOOD_CARD:
					if len(level.player_chassis_list) < level.player_chassis_list_limit:
						level.player_chassis_list.append(new_card)
				elif card_detail_list[hand_idx][CARD_TYPE] == LEG_CARD:
					if len(level.player_leg_list) < level.player_leg_list_limit:
						level.player_leg_list.append(new_card)

				set_card_img(new_card, card_detail_list[hand_idx])
				update_display_card(new_card, card_detail_list[hand_idx])
				remove_card(hand[hand_idx])
				hand.remove(hand_idx)
				card_detail_list.remove(hand_idx)
				print("in place_card_in_display hand after card played: " + str(len(hand)) + " + card_detail_list: " + str(len(card_detail_list)))

			handle_cards_in_display()
			#update_display_card(new_card, card_payload)
		else:
			print("tableau list doesn't match?")
	else:
		# Is Enemy
		if player_card_idx >= 0 and player_card_idx <= len(player_card_list) - 1 and len(player_card_list) > 0:
			if enm_card_detail_list[player_card_idx][CARD_TYPE] == ABILITY_CARD:
				player_card_list[player_card_idx].visible = false
			else:
				var level = get_node("/root/level")
				var new_card = main.CARD.instance()
				new_card.set_scale(Vector2(.3, .3))
				get_node("/root").add_child(new_card)
				if enm_card_detail_list[player_card_idx][CARD_TYPE] == WEAPON_CARD:
					if len(level.enemy_right_arm_list) < level.enemy_right_arm_list_limit:
						level.enemy_right_arm_list.append(new_card)
					elif len(level.player_left_arm_list) < level.enemy_left_arm_list_limit:
						level.enemy_left_arm_list.append(new_card)
					else:
						print("no more room for weapon cards")
				elif enm_card_detail_list[player_card_idx][CARD_TYPE] == CHASSIS_CARD ||\
					 enm_card_detail_list[player_card_idx][CARD_TYPE] == HUNGER_CARD ||\
					 enm_card_detail_list[player_card_idx][CARD_TYPE] == FOOD_CARD:
					if len(level.enemy_chassis_list) < level.enemy_chassis_list_limit:
						level.enemy_chassis_list.append(new_card)
				elif enm_card_detail_list[player_card_idx][CARD_TYPE] == LEG_CARD:
					if len(level.enemy_leg_list) < level.enemy_leg_list_limit:
						level.enemy_leg_list.append(new_card)
				else:
					reset_display_card_sizes()

				set_card_img(new_card, enm_card_detail_list[player_card_idx])
				update_display_card(new_card, enm_card_detail_list[hand_idx])
				remove_card(player_card_list[player_card_idx])
				player_card_list.remove(player_card_idx)
				if player_card_idx >= 0 and player_card_idx < len(enm_hand) and len(enm_hand) > 0:
					enm_hand.remove(player_card_idx)
				enm_card_detail_list.remove(hand_idx)
				print("in place_card_in_display player_card_list after card played: " + str(len(player_card_list)) + " + card_detail_list: " + str(len(card_detail_list)))

			handle_cards_in_display()
			#update_display_card(new_card, card_payload)
		else:
			print("tableau list doesn't match?")

	#var card_payload = get_card_payload(rand_card)
	#var rand_card = get_random_card(starting_deck)
	#hand.append(new_card)
	#print("***hand: " + str(len(hand)))


	#print("***player_tableau_list: " + str(len(level.player_tableau_list)))
	#print("***enemy_tableau_list: " + str(len(level.enemy_tableau_list)))

	reset_display_card_sizes()

func reset_display_card_sizes():
	if get_node("/root").has_node("level"):
		var level = get_node("/root/level")
		var normal_size = Vector2(.5, .5)
		for card in level.player_chassis_list:
			card.set_scale(normal_size)
		for card in level.player_left_arm_list:
			card.set_scale(normal_size)
		for card in level.player_right_arm_list:
			card.set_scale(normal_size)
		for card in level.player_leg_list:
			card.set_scale(normal_size)
			
		for card in level.enemy_chassis_list:
			card.set_scale(normal_size)
		for card in level.enemy_left_arm_list:
			card.set_scale(normal_size)
		for card in level.enemy_right_arm_list:
			card.set_scale(normal_size)
		for card in level.enemy_leg_list:
			card.set_scale(normal_size)
	if card_expanded:
		card_expanded = false


func reset_hand_card_sizes():
	var normal_size = Vector2(1, 1)
	for card in hand:
		card.set_scale(normal_size)
	


func expand_card_details(chosen_card=false):
	if get_node("/root").has_node("level") and not card_expanded:
		card_expanded = true
		var level = get_node("/root/level")
		var current_location = Vector2(0, 0)
		var zoom_size = Vector2(1.7, 1.7)
		var smaller_zoom_size = Vector2(1.2, 1.2)
		var card_zoomed_location = Vector2(400, 900)
		var zoomed_idx = 200
		reset_display_card_sizes()
		level.reset_card_z_indexes()
		handle_cards_in_display()
		if chosen_card:
			chosen_card.z_index = zoomed_idx
			chosen_card.set_scale(smaller_zoom_size)
		elif level.list_navigation_idx >= 0:
			print("here? " + current_card_menu + " list_navigation_idx: " + str(level.list_navigation_idx))
			if current_card_menu == level.CHASSIS_MENU\
			   and len(level.player_chassis_list) > 0 and level.list_navigation_idx < len(level.player_chassis_list):
				level.player_chassis_list[level.list_navigation_idx].set_scale(zoom_size)
				level.player_chassis_list[level.list_navigation_idx].position = card_zoomed_location
				level.player_chassis_list[level.list_navigation_idx].z_index = zoomed_idx
			elif current_card_menu == level.LEFT_ARM_MENU\
			   and len(level.player_left_arm_list) > 0 and level.list_navigation_idx < len(level.player_left_arm_list):
				level.player_left_arm_list[level.list_navigation_idx].set_scale(zoom_size)
				level.player_left_arm_list[level.list_navigation_idx].position = card_zoomed_location
				level.player_left_arm_list[level.list_navigation_idx].z_index = zoomed_idx
			elif current_card_menu == level.RIGHT_ARM_MENU\
			   and len(level.player_right_arm_list) > 0 and level.list_navigation_idx < len(level.player_right_arm_list):
				level.player_right_arm_list[level.list_navigation_idx].set_scale(zoom_size)
				level.player_right_arm_list[level.list_navigation_idx].position = card_zoomed_location
				level.player_right_arm_list[level.list_navigation_idx].z_index = zoomed_idx
			elif current_card_menu == level.LEGS_MENU\
			   and len(level.player_leg_list) > 0 and level.list_navigation_idx < len(level.player_leg_list):
				level.player_leg_list[level.list_navigation_idx].set_scale(zoom_size)
				level.player_leg_list[level.list_navigation_idx].position = card_zoomed_location
				level.player_leg_list[level.list_navigation_idx].z_index = zoomed_idx
			else:
				current_card_menu = "hand"
	elif card_expanded:
		card_expanded = false
		handle_cards_in_display()


func card_container_navigation_controller(val, location="change"):
	reset_display_card_sizes()
	reset_hand_card_sizes()
	handle_cards_in_display()
	if location == "current":
			location = current_card_menu

	if get_node("/root").has_node("level"):
		var level = get_node("/root/level")
		if location == "change":
			if current_card_menu == "hand" :
				# If hand check all lists otherwise come back
				if len(level.player_chassis_list) > 0:
					current_card_menu = level.CHASSIS_MENU
				elif len(level.player_left_arm_list) > 0:
					current_card_menu = level.LEFT_ARM_MENU
				elif len(level.player_right_arm_list) > 0:
					current_card_menu = level.RIGHT_ARM_MENU
				elif len(level.player_leg_list) > 0:
					current_card_menu = level.LEGS_MENU
				else:
					current_card_menu = "hand"
			
			# if not in hand go to next non handd list if any or come back to hand
			elif current_card_menu == level.CHASSIS_MENU and len(level.player_left_arm_list) > 0:
				current_card_menu = level.LEFT_ARM_MENU
			elif current_card_menu == level.LEFT_ARM_MENU and len(level.player_right_arm_list) > 0:
				current_card_menu = level.RIGHT_ARM_MENU
			elif current_card_menu == level.RIGHT_ARM_MENU and len(level.player_leg_list) > 0:
				current_card_menu = level.LEGS_MENU
			elif current_card_menu == level.LEGS_MENU:
				current_card_menu = "hand"
			else:
				current_card_menu = "hand"

		elif location == "hand":
			change_hand_idx(val)
		elif location == level.CHASSIS_MENU\
		     or location == level.LEFT_ARM_MENU\
		     or location == level.RIGHT_ARM_MENU\
		     or location == level.LEGS_MENU:
				level.cycle_current_card_menu(val)
	else:
		location = "hand"

	print(current_card_menu)



func change_hand_idx(val=0):
	if get_node("/root").has_node("level"):
		var level = get_node("/root/level")
		level.reset_card_z_indexes()
	var idx = 1
	for card in hand:
		card.modulate = Color(.55, .55, .55, 1)
		card.z_index = idx + 120
		idx += 1
	hand_idx -= val
	if hand_idx < 0:
		hand_idx = len(hand) - 1 
	elif hand_idx >= len(hand):
		hand_idx = 0
	if len(hand) > 0 and hand[hand_idx] and main.checkIfNodeDeleted(hand[hand_idx]) == false:
		hand[hand_idx].modulate = Color(1, 1, 1, 1)
		hand[hand_idx].z_index = idx + 122
		expand_card_details(hand[hand_idx])


func set_card_img(new_card, card_payload):
	new_card.get_node("outer_art_container/sprite").visible = false
	new_card.get_node("inner_art_container/sprite").visible = false
	new_card.get_node("inner_art_container/background").visible = true
	if card_payload[CARD_TYPE] == WEAPON_CARD:
		new_card.get_node("inner_art_container/background").set_texture(main.CARD_RED_BACKGROUND_1)
	elif card_payload[CARD_TYPE] == LEG_CARD:
		new_card.get_node("inner_art_container/background").set_texture(main.CARD_GREY_BACKGROUND_1)
	elif card_payload[CARD_TYPE] == CHASSIS_CARD:
		new_card.get_node("inner_art_container/background").set_texture(main.CARD_GREY_BACKGROUND_1)
	elif card_payload[CARD_TYPE] == FOOD_CARD:
		new_card.get_node("inner_art_container/background").set_texture(main.CARD_GREEN_BACKGROUND_1)
	elif card_payload[CARD_TYPE] == WATER_CARD:
		new_card.get_node("inner_art_container/background").set_texture(main.CARD_BLUE_BACKGROUND_1)
	elif card_payload[CARD_TYPE] == HUNGER_CARD:
		new_card.get_node("inner_art_container/background").set_texture(main.CARD_RED_BACKGROUND_1)
	elif card_payload[CARD_TYPE] == ABILITY_CARD:
		new_card.get_node("inner_art_container/background").set_texture(main.CARD_YELLOW_BACKGROUND_1)
	else:
		new_card.get_node("inner_art_container/background").set_texture(main.CARD_RED_BACKGROUND_1)
	if card_payload[IMG_PATH]:
		new_card.get_node("inner_art_container/sprite").visible = true
		new_card.get_node("inner_art_container/sprite").set_texture(card_payload[IMG_PATH])


func spawn_cards(hand_limit, is_player=true, deck=impact_starting_deck):
	randomize()
	if is_player:
		hand = []
		card_detail_list = []
		var og_card_pos = Vector2(0, 0)
		for card in range(meta.player_hand_limit):
			var new_card = main.CARD.instance()
			new_card.z_index = 120
			get_node("/root").call_deferred("add_child", new_card)
			var rand_card = get_random_card(deck)
			var card_payload = get_card_payload(rand_card)
			card_payload[ID] = get_card_id()
			set_card_img(new_card, card_payload)
			update_display_card(new_card, card_payload)
			card_detail_list.append(rand_card)
			hand.append(new_card)
			if card == 0:
				new_card.position = Vector2(325 / (meta.player_hand_limit), 785)
				og_card_pos = new_card.position
			else:
				new_card.position = og_card_pos
				new_card.position.x += (card * 200)
				new_card.position.y = 785
				#Vector2((card * 175) + 400 / (hand_limit), 800)
			var timer = Timer.new()
			var time = .25
			print("time " + str(time))
			get_node("/root").add_child(timer)
			timer.set_wait_time(time)
			timer.set_one_shot(true)
			timer.start()
			yield(timer, "timeout")
			timer.queue_free()
			handle_cards_in_display()
	else:
		enm_hand = []
		enm_card_detail_list = []
		var og_card_pos = Vector2(0, 0)
		for card in range(hand_limit):
			var new_card = main.CARD.instance()
			new_card.z_index = 120
			get_node("/root").call_deferred("add_child", new_card)
			var rand_card = get_random_card(deck)
			var card_payload = get_card_payload(rand_card)
			card_payload[ID] = get_card_id()
			set_card_img(new_card, card_payload)
			update_display_card(new_card, card_payload)
			enm_card_detail_list.append(rand_card)
			enm_hand.append(new_card)
			if card == 0:
				new_card.position = Vector2(1000, 785)
				og_card_pos = new_card.position
				new_card.modulate = Color(.7, .2, .2, 1)
			else:
				new_card.position = og_card_pos
				new_card.position.x += (card * 200)
				new_card.position.y = 785
				new_card.modulate = Color(.7, .2, .2, 1)
			var timer = Timer.new()
			var time = .25
			print("time " + str(time))
			get_node("/root").add_child(timer)
			timer.set_wait_time(time)
			timer.set_one_shot(true)
			timer.start()
			yield(timer, "timeout")
			timer.queue_free()
			handle_cards_in_display()
		
		var timer = Timer.new()
		var time = 1.5
		print("time " + str(time))
		get_node("/root").add_child(timer)
		timer.set_wait_time(time)
		timer.set_one_shot(true)
		timer.start()
		yield(timer, "timeout")
		timer.queue_free()
		for i in range(len(enm_hand)):
			play_card(enm_hand, i, false)
		handle_cards_in_display()


func get_card_id():
	randomize()
	return str(stepify(rand_range(-4, 4) + rand_range(-4, 4), 0.022))


func get_random_card(deck):
	randomize()
	return deck[round(rand_range(0, len(deck) - 1))]


func get_card_payload(card):
	var card_payload = {CARD_TYPE: card[CARD_TYPE]}
	#### Upper card section details
	if CARD_WAIT_TIME in card:
		card_payload[CARD_WAIT_TIME] = card[CARD_WAIT_TIME]
		print("card_payload[CARD_WAIT_TIME] " + str(card_payload[CARD_WAIT_TIME]))
	if CARD_ACTION in card:
		card_payload[CARD_ACTION] = card[CARD_ACTION]
	if TITLE in card:
		card_payload[TITLE] = card[TITLE]
	if DESCRIPTION in card:
		card_payload[DESCRIPTION] = card[DESCRIPTION]
	if ATTACKS in card:
		card_payload[ATTACKS] = card[ATTACKS]
	if DAMAGE in card:
		card_payload[DAMAGE] = card[DAMAGE]
	if ATTACK_RANGE in card:
		card_payload[ATTACK_RANGE] = card[ATTACK_RANGE]
	if DEFENSE in card:
		card_payload[DEFENSE] = card[DEFENSE]
	if TOUGHNESS in card:
		card_payload[TOUGHNESS] = card[TOUGHNESS]
	if HEALTH in card:
		card_payload[HEALTH] = card[HEALTH]
	#####
	if PIERCING in card:
		card_payload[PIERCING] = card[PIERCING]
	if BLEED in card:
		card_payload[BLEED] = card[BLEED]
	if BURN in card:
		card_payload[BURN] = card[BURN]
	if RUST in card:
		card_payload[RUST] = card[RUST]
	if FREEZE in card:
		card_payload[FREEZE] = card[FREEZE]
	if STUN in card:
		card_payload[STUN] = card[STUN]
	if WEAPON in card:
		card_payload[WEAPON] = card[WEAPON]
	if OVERHUNGER in card:
		card_payload[OVERHUNGER] = card[OVERHUNGER]
	if FLAMMABLE in card:
		card_payload[FLAMMABLE] = card[FLAMMABLE]
	if POISON in card:
		card_payload[POISON] = card[POISON]
	if FIRE in card:
		card_payload[FIRE] = card[FIRE]
	if WATER in card:
		card_payload[WATER] = card[WATER]
	if IMPACT in card:
		card_payload[IMPACT] = card[IMPACT]
	if BLADE in card:
		card_payload[BLADE] = card[BLADE]
	if STEAM in card:
		card_payload[STEAM] = card[STEAM]
	if ENERGY in card:
		card_payload[ENERGY] = card[ENERGY]
	if MISSILE in card:
		card_payload[MISSILE] = card[MISSILE]
	if EXPLOSION in card:
		card_payload[EXPLOSION] = card[EXPLOSION]
	if LEADER in card:
		card_payload[LEADER] = card[LEADER]

	if FOOD_PRODUCTION in card:
		card_payload[FOOD_PRODUCTION] = card[FOOD_PRODUCTION]
	if ABILITY_RANGE in card:
		card_payload[ABILITY_RANGE] = card[ABILITY_RANGE]
	if SHIELD in card:
		card_payload[SHIELD] = card[SHIELD]
	if FOOD_PRODUCTION in card:
		card_payload[FOOD_PRODUCTION] = card[FOOD_PRODUCTION]
	if ABILITY_RANGE in card:
		card_payload[ABILITY_RANGE] = card[ABILITY_RANGE]
	if CARD_ACTION in card:
		card_payload[CARD_ACTION] = card[CARD_ACTION]

	if BUFF in card:
		card_payload[BUFF] = card[BUFF]
	if DEBUFF in card:
		card_payload[DEBUFF] = card[DEBUFF]

	if TARGET in card:
		card_payload[TARGET] = card[TARGET]
	if ENEMIES in card:
		card_payload[ENEMIES] = card[ENEMIES]
	elif ALLIES in card:
		card_payload[ALLIES] = card[ALLIES]
	elif SELF in card:
		card_payload[SELF] = card[SELF]
	
	elif IMG_PATH in card:
		card_payload[IMG_PATH] = card[IMG_PATH]

	if ID in card:
		card_payload[ID] = card[ID]
	if TAGS in card:
		card_payload[TAGS] = card[TAGS]
	return card_payload


func update_display_card(card_node, card_payload):
	# meant to be broad for cards that may not be a 'character'
	print(card_payload[CARD_TYPE])
	var sprite_node = card_node.get_node("inner_art_container/background")
	sprite_node.modulate = Color(1, 1, 1, 1)
	# if card_payload[CARD_TYPE] == CHAR_CARD:
	#	sprite_node.modulate = Color(1, 1, 1, 1)
	# elif card_payload[CARD_TYPE] == ABILITY_CARD:
	#	sprite_node.modulate = Color(.85, .85, 1, 1)
	# elif card_payload[CARD_TYPE] == WEAPON_CARD:
	#	sprite_node.modulate = Color(1, .85, .85, 1)
	# elif card_payload[CARD_TYPE] == LEG_CARD:
	#	sprite_node.modulate = Color(.85, 1, .85, 1)
	# elif card_payload[CARD_TYPE] == FOOD_CARD:
	#	sprite_node.modulate = Color(.35, 1, .35, 1)
	# elif card_payload[CARD_TYPE] == HUNGER_CARD:
	#	sprite_node.modulate = Color(.75, .5, .1, 1)
	
	# pass id from payload to card node for unique access when needed
	if ID in card_payload:
		card_node.get_node(ID).set_text(card_payload[ID])

	if card_payload[CARD_TYPE] == CHAR_CARD\
	   or card_payload[CARD_TYPE] == ABILITY_CARD\
	   or card_payload[CARD_TYPE] == LEG_CARD\
	   or card_payload[CARD_TYPE] == WEAPON_CARD\
	   or card_payload[CARD_TYPE] == CHASSIS_CARD\
	   or card_payload[CARD_TYPE] == HUNGER_CARD\
	   or card_payload[CARD_TYPE] == FOOD_CARD:
		#### Upper card section details
		if TAGS in card_payload:
			var tags = ""
			for tag in card_payload[TAGS]:
				tags += tag + ","
			card_node.get_node("tags").set_text(str(tags))

		if CARD_WAIT_TIME in card_payload:
			card_node.get_node("timer").set_text(str(card_payload[CARD_WAIT_TIME]))

		if CARD_ACTION in card_payload:
			card_node.get_node("action").set_text(card_payload[CARD_ACTION])
		if WEAPON_DAMAGE_TYPE in card_payload:
			card_node.get_node("detail_1").set_text(str(card_payload[WEAPON_DAMAGE_TYPE]))
		else:
			card_node.get_node("detail_1").set_text("")
		if DAMAGE in card_payload:
			card_node.get_node("detail_5").set_text(str(card_payload[DAMAGE]))
		else:
			card_node.get_node("detail_5").set_text("")
		if ATTACKS in card_payload:
			card_node.get_node("detail_4").set_text(str(card_payload[ATTACKS]))
			card_node.get_node("detail_4_5_operator").set_text("*")
		else:
			card_node.get_node("detail_4_5_operator").set_text("")
		if DEFENSE in card_payload:
			card_node.get_node("detail_3").set_text(str(card_payload[DEFENSE]))
		else:
			card_node.get_node("detail_3").set_text("")
		if TOUGHNESS in card_payload:
			card_node.get_node("detail_2").set_text(str(card_payload[TOUGHNESS]))
		else:
			card_node.get_node("detail_2").set_text("")


		if HEALTH in card_payload:
			card_node.get_node("detail_1").set_text(str(card_payload[HEALTH]))
		else:
			card_node.get_node("detail_1").set_text("")
			
		if FOOD_PRODUCTION in card_payload:
			card_node.get_node("detail_6").set_text(str(card_payload[FOOD_PRODUCTION]))
		else:
			card_node.get_node("detail_6").set_text("")
		#####
		var bottom_section_text = ""
		var title_text = card_payload[TITLE].to_upper()
		card_node.get_node("title").set_text(title_text)
		if DESCRIPTION in card_payload:
			bottom_section_text += card_payload[DESCRIPTION]+"\n"
		# if FOOD_PRODUCTION in card_payload:
		# 	bottom_section_text += FOOD_PRODUCTION.to_upper() + " " + str(card_payload[FOOD_PRODUCTION])
		if PIERCING in card_payload:
			bottom_section_text += PIERCING.to_upper() + " "
		if BLEED in card_payload:
			bottom_section_text += BLEED.to_upper() + " "
		if BURN in card_payload:
			bottom_section_text += BURN.to_upper() + " "
		if POISON in card_payload:
			bottom_section_text += BLEED.to_upper() + " "
		if FREEZE in card_payload:
			bottom_section_text += FREEZE.to_upper() + " "
		if STUN in card_payload:
			bottom_section_text += STUN.to_upper() + " "
		if OVERHUNGER in card_payload:
			bottom_section_text += OVERHUNGER.to_upper() + " "
		if WEAPON in card_payload:
			bottom_section_text += "\n"
			bottom_section_text += str(card_payload[WEAPON]).to_upper()

		card_node.get_node("text").set_text(bottom_section_text)
	elif card_payload[CARD_TYPE] == MISC_CARD:
		pass
	else:
		print("n/**Can't find card_payload[CARD_TYPE]: " + str(card_payload[CARD_TYPE]) +" **")


func handle_cards_in_display():
	if not get_node("/root").has_node("level"):
		print("no level??")
		return
	print("handle_cards_in_display??")
	var level = get_node("/root/level")
	var x = 0
	var y = 0
	var idx = 0
	var x_buffer = 80
	var y_buffer = 200
	for card in level.player_chassis_list:
		print("player_chassis_list moving: " + str(card.get_node("title").get_text()))
		var node_ref = level.get_node("tableau_container/chassis").global_position
		level.player_chassis_list[idx].position = node_ref
		level.player_chassis_list[idx].position.x += x_buffer * x
		level.player_chassis_list[idx].position.y += y_buffer * y
		idx += 1
		x += 1
		if x % 3 == 0:
			x = 0
			y += 1

	y = 0
	x = 0
	idx = 0

	for card in level.player_leg_list:
		print("player_leg_list moving: " + str(card.get_node("title").get_text()))
		var node_ref = level.get_node("tableau_container/legs").global_position
		level.player_leg_list[idx].position = Vector2(node_ref.x + (x_buffer * x), node_ref.y + (y_buffer * y))
		idx += 1
		x += 1
	y = 0
	x = 0
	idx = 0

	for card in level.player_right_arm_list:
		print("player_right_arm_list moving: " + str(card.get_node("title").get_text()))
		var node_ref = level.get_node("tableau_container/right_arm").global_position
		level.player_right_arm_list[idx].position = node_ref#Vector2(node_ref.x + (x_buffer * x), node_ref.y + (y_buffer * y))
		print("level.player_right_arm_list[idx] beofre " + str(level.player_right_arm_list[idx].position))
		level.player_right_arm_list[idx].position.y += (y_buffer * y)
		print("level.player_right_arm_list[idx] after " + str(level.player_right_arm_list[idx].position))
		y += 1
		idx += 1
	y = 0
	x = 0
	idx = 0

	for card in level.player_left_arm_list:
		print("player_left_arm_list moving: " + str(card.get_node("title").get_text()))
		var node_ref = level.get_node("tableau_container/left_arm").global_position
		level.player_left_arm_list[idx].position = node_ref#Vector2(node_ref.x + (x_buffer * x), node_ref.y + (y_buffer * y))
		level.player_left_arm_list[idx].position.y += (y_buffer * y)
		y += 1
		idx += 1


	#####
	#
	###  Enemy
	#
	#####
	y = 0
	x = 0
	idx = 0
	for card in level.enemy_chassis_list:
		print("enemy_chassis_list moving: " + str(card.get_node("title").get_text()))
		var node_ref = level.get_node("enemy_tableau_container/chassis").global_position
		level.enemy_chassis_list[idx].position = node_ref
		level.enemy_chassis_list[idx].position.x += x_buffer * x
		level.enemy_chassis_list[idx].position.y += y_buffer * y
		idx += 1
		x += 1
		if x % 3 == 0:
			x = 0
			y += 1

	y = 0
	x = 0
	idx = 0

	for card in level.enemy_leg_list:
		print("player_leg_list moving: " + str(card.get_node("title").get_text()))
		var node_ref = level.get_node("enemy_tableau_container/legs").global_position
		level.enemy_leg_list[idx].position = Vector2(node_ref.x + (x_buffer * x), node_ref.y + (y_buffer * y))
		idx += 1
		x += 1
	y = 0
	x = 0
	idx = 0

	for card in level.enemy_right_arm_list:
		print("enemy_right_arm_list moving: " + str(card.get_node("title").get_text()))
		var node_ref = level.get_node("enemy_tableau_container/right_arm").global_position
		level.enemy_right_arm_list[idx].position = node_ref
		level.enemy_right_arm_list[idx].position.y += (y_buffer * y)
		y += 1
		idx += 1
	y = 0
	x = 0
	idx = 0

	for card in level.enemy_left_arm_list:
		print("enemy_left_arm_list moving: " + str(card.get_node("title").get_text()))
		var node_ref = level.get_node("enemy_tableau_container/left_arm").global_position
		level.enemy_left_arm_list[idx].position = node_ref
		level.enemy_left_arm_list[idx].position.y += (y_buffer * y)
		y += 1
		idx += 1


func remove_card(card_node):
	if card_node and main.checkIfNodeDeleted(card_node) == false:
		card_node.visible = false
		card_node.queue_free()


func remove_all_cards():
	if get_node("/root").has_node("level"):
		var level = get_node("/root/level")
		level.player_tableau_list = []
	for card in get_tree().get_nodes_in_group("cards"):
		if card and main.checkIfNodeDeleted(card) == false:
			card.visible = false
			card.queue_free()


func remove_all_cards_in_hand(is_player):
	if is_player:
		for card in hand:
			if card and main.checkIfNodeDeleted(card) == false:
				card.visible = false
				card.queue_free()
	else:
		for card in enm_hand:
			if card and main.checkIfNodeDeleted(card) == false:
				card.visible = false
				card.queue_free()

		
##### AI/ENM:
#
#
#


func set_enm_deck():
	pass

func draw_cards():
	pass
