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
const RIVERLANDS = "riverlands"
const COASTAL = "coastal"
const SAVANNAH = "savannah"
const FOREST = "forest"

const RARITY = "rarity"
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
const WATER_PRODUCTION = "water_production"
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

const CARD_BIOME = "card_biome"
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
	RARITY: 1,
	HEALTH: 80,
	LEFT_ARM_HEALTH: 20,
	RIGHT_ARM_HEALTH: 20,
	CHASIS_ABL_1: LIGHT_COBRA_ABILITY_1, # process based on str elsewhere
	CHASIS_ABL_2: LIGHT_COBRA_ABILITY_2,
	HUNGER_PRODUCTION: 0,
	WATER_PRODUCTION: 0,
	LEFT_ARM_LIMIT: 2,
	RIGHT_ARM_LIMIT: 1,
	LEG_LIMIT: 5,
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

const HEAVY = "heavy"
const MEDIUM = "medium"
const LIGHT = "light"
# MISSILE
const WOODLANDS_WATCHER = "woodlands watcher"
const WOODLANDS_WATCHER_ABILITY = "burning_strike"

var card_woodlands_watcher = {
	TITLE: WOODLANDS_WATCHER,
	RARITY: 1,
	CARD_TYPE: WEAPON_CARD,
	CARD_BIOME: FOREST,
	WEAPON_TYPE: HEAVY,
	WEAPON_DAMAGE_TYPE: FIRE + "_" + DAMAGE,
	ATTACKS: 1,
	DAMAGE: 40,
	HUNGER_PRODUCTION: 20,
	WATER_PRODUCTION: 4,
	IMG_PATH: main.BEAR_LIKE,
	CARD_WAIT_TIME: 1.5,
	CARD_ACTION: WOODLANDS_WATCHER_ABILITY,
	RECYCLE_ACTION: "",
	DESCRIPTION: "",
	TAGS: [FIRE, FOREST, IMPACT]
}

const MAN_OF_WAR = "man of war"
const MAN_OF_WAR_ABILITY = "man_of_war_ability"
var card_man_of_war = {
	TITLE: MAN_OF_WAR,
	RARITY: .8,
	CARD_TYPE: WEAPON_CARD,
	CARD_BIOME: COASTAL,
	WEAPON_TYPE: LIGHT,
	WEAPON_DAMAGE_TYPE: WATER + "_" + DAMAGE,
	ATTACKS: 3,
	DAMAGE: 10,
	HUNGER_PRODUCTION: 5,
	WATER_PRODUCTION: 20,
	IMG_PATH: main.PLASMA_GUN,
	CARD_WAIT_TIME: 1.25,
	CARD_ACTION: MAN_OF_WAR_ABILITY,
	RECYCLE_ACTION: "",
	DESCRIPTION: "Deals 1 additional damage to oppopnent Arm, Leg, and total health for each COASTAL card attached",
	TAGS: [WATER, COASTAL]
}

const TOWERING_ELEPHANT_ABILITY_1 = "towering_elephant_display_ability_1"
const TOWERING_ELEPHANT = "Towering Elephant"
var card_towering_elephant = {
	TITLE: TOWERING_ELEPHANT,
	RARITY: 1,
	CARD_TYPE: WEAPON_CARD,
	CARD_BIOME: SAVANNAH,
	WEAPON_TYPE: RIFLE,
	WEAPON_DAMAGE_TYPE: IMPACT + "_" + DAMAGE,
	ATTACKS: 2,
	DAMAGE: 20,
	HUNGER_PRODUCTION: 30,
	WATER_PRODUCTION: 3,
	IMG_PATH: main.LARGE_ELEPHANT,
	CARD_WAIT_TIME: 3,
	CARD_ACTION: TOWERING_ELEPHANT_ABILITY_1,
	RECYCLE_ACTION: "",
	DESCRIPTION: "Additional damage equal to [DAMAGE] * total [IMPACT] cards attached",
	TAGS: [IMPACT, SAVANNAH]
}

const STALKING_PYTHON = "stalking python"
const STALKING_PYTHON_ABILITY = "stalking_python_ability"
var card_stalking_python = {
	TITLE: STALKING_PYTHON,
	RARITY: .7,
	CARD_TYPE: WEAPON_CARD,
	CARD_BIOME: RIVERLANDS,
	WEAPON_TYPE: MEDIUM,
	WEAPON_DAMAGE_TYPE: POISON + "_" + DAMAGE,
	ATTACKS: 2,
	DAMAGE: 15,
	HUNGER_PRODUCTION: 2,
	WATER_PRODUCTION: 2,
	IMG_PATH: main.PLASMA_GUN,
	CARD_WAIT_TIME: 1,
	CARD_ACTION: STALKING_PYTHON_ABILITY,
	RECYCLE_ACTION: "",
	DESCRIPTION: "",
	TAGS: [RIVERLANDS, IMPACT, POISON]
}

const TREADS = "treads"
var card_treads = {
	TITLE: TREADS,
	RARITY: 1,
	CARD_TYPE: LEG_CARD,
	CARD_BIOME: COASTAL,
	HUNGER_LIMIT: 3,
	HUNGER_PRODUCTION: 5,
	WATER_PRODUCTION: 1,
	TABLEAU_LIMIT: 4, 
	DEFENSE: 15, # blocks dmg until depleted, regain after fight
	TOUGHNESS: 5, # blocks dmg until depleted, regain each round
	CARD_WAIT_TIME: .15,
	CARD_ACTION: "", # str name of func called elsewher
	RECYCLE_ACTION: "",
	IMG_PATH: false,
	DESCRIPTION: "",
	TAGS: [COASTAL]
}

const RIGHT_ARM_SALVO = "right_arm_salvo"
var card_ability_right_arm_salvo_1 = {
	TITLE: RIGHT_ARM_SALVO,
	RARITY: 1,
	CARD_TYPE: ABILITY_CARD,
	CARD_BIOME: " ",
	HUNGER_PRODUCTION: 15,
	WATER_PRODUCTION: 15,
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
	RARITY: 1,
	CARD_TYPE: ABILITY_CARD,
	CARD_BIOME: " ",
	HUNGER_PRODUCTION: 15,
	WATER_PRODUCTION: 15,
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
	RARITY: 1,
	CARD_TYPE: ABILITY_CARD,
	CARD_BIOME: FOREST,
	HUNGER_PRODUCTION: 5,
	WATER_PRODUCTION: 1,
	CARD_WAIT_TIME: .75,
	CARD_ACTION: "draw_2", # str name of func called elsewher
	RECYCLE_ACTION: "",
	IMG_PATH: main.BEAR_LIKE,
	DESCRIPTION: "Draw 2 cards",
	TAGS: [FOREST]
}

const STAMPEDE = "stampede"
var card_ability_stampede = {
	TITLE: STAMPEDE,
	RARITY: 1,
	CARD_TYPE: ABILITY_CARD,
	HUNGER_PRODUCTION: 10,
	WATER_PRODUCTION: 2,
	ATTACKS: 4,
	DAMAGE: 5,
	CARD_BIOME: SAVANNAH,
	CARD_WAIT_TIME: 3,
	CARD_ACTION: "", # str name of func called elsewher
	RECYCLE_ACTION: "",
	IMG_PATH: main.TRIPPLE_ELEPHANT,
	DESCRIPTION: "",
	TAGS: [IMPACT, SAVANNAH]
}

const SAND_STORM = "sand storm"
var card_sand_storm = {
	TITLE: SAND_STORM,
	RARITY: .7,
	CARD_TYPE: CHASSIS_CARD,
	HUNGER_PRODUCTION: 10,
	WATER_PRODUCTION: 2,
	ATTACKS: 2,
	DAMAGE: 2,
	DEFENSE: 5,
	CARD_BIOME: SAVANNAH,
	CARD_WAIT_TIME: 3,
	CARD_ACTION: SAND_STORM, # str name of func called elsewher
	RECYCLE_ACTION: "",
	IMG_PATH: "",
	DESCRIPTION: "",
	TAGS: [IMPACT, SAVANNAH]
}

const SUDDEN_RAIN = "sudden rain"
var card_ability_sudden_rain = {
	TITLE: SUDDEN_RAIN,
	RARITY: .9,
	CARD_TYPE: ABILITY_CARD,
	HUNGER_PRODUCTION: 0,
	WATER_PRODUCTION: 0,
	WATER: 10,
	CARD_BIOME: RIVERLANDS,
	CARD_WAIT_TIME: .25,
	CARD_ACTION: SUDDEN_RAIN, # str name of func called elsewher
	RECYCLE_ACTION: "",
	IMG_PATH: main.ROCK_FOX,
	DESCRIPTION: "",
	TAGS: [WATER, RIVERLANDS]
}


const GROWTH = "growth"
var card_ability_growth = {
	TITLE: GROWTH,
	RARITY: 1,
	CARD_TYPE: ABILITY_CARD,
	HUNGER_PRODUCTION: 0,
	WATER_PRODUCTION: 0,
	HEALTH: 25,
	CARD_BIOME: FOREST,
	CARD_WAIT_TIME: .5,
	CARD_ACTION: GROWTH, # str name of func called elsewher
	RECYCLE_ACTION: "",
	IMG_PATH: main.BEAR_LIKE,
	DESCRIPTION: "",
	TAGS: [HEALTH, FOREST]
}


const TOXIN_COATED = "toxin coated"
var card_ability_toxin_coated = {
	TITLE: TOXIN_COATED,
	RARITY: .8,
	CARD_TYPE: ABILITY_CARD,
	HUNGER_PRODUCTION: 0,
	WATER_PRODUCTION: 0,
	DEFENSE: 20,
	CARD_BIOME: COASTAL,
	CARD_WAIT_TIME: .5,
	CARD_ACTION: TOXIN_COATED, # str name of func called elsewher
	RECYCLE_ACTION: "",
	IMG_PATH: main.PIRANHA,
	DESCRIPTION: "",
	TAGS: [DEFENSE, COASTAL]
}


const QUICK_SAND = "quick sand"
var card_quick_sand = {
	TITLE: QUICK_SAND,
	RARITY: .9,
	CARD_TYPE: CHASSIS_CARD,
	HUNGER_PRODUCTION: 7,
	WATER_PRODUCTION: 7,
	CARD_BIOME: RIVERLANDS,
	ATTACKS: 1,
	DAMAGE: 5,
	TOUGHNESS: 5,
	CARD_WAIT_TIME: 1,
	CARD_ACTION: QUICK_SAND, # str name of func called elsewher
	RECYCLE_ACTION: "",
	IMG_PATH: "",
	DESCRIPTION: "",
	TAGS: [RIVERLANDS, IMPACT]
}

const POISONOUS_AMPIBIANS = "poisonous amphibians"
var card_ability_poisonous_amphibians = {
	TITLE: POISONOUS_AMPIBIANS,
	RARITY: 1,
	CARD_TYPE: ABILITY_CARD,
	CARD_BIOME: RIVERLANDS,
	HUNGER_PRODUCTION: 3,
	WATER_PRODUCTION: 5,
	ATTACKS: 1,
	DAMAGE: 15,
	CARD_WAIT_TIME: 1,
	RECYCLE_ACTION: "",
	IMG_PATH: main.PIRANHA,
	DESCRIPTION: "Often unseen lurking along rivers",
	TAGS: [RIVERLANDS, POISON]
}

const VULTURES = "vultures"
var card_vultures = {
	TITLE: VULTURES,
	RARITY: 1,
	CARD_TYPE: CHASSIS_CARD,
	CARD_BIOME: SAVANNAH,
	HUNGER_PRODUCTION: 2,
	WATER_PRODUCTION: 0,
	ATTACKS: 1,
	DAMAGE: 3,
	CARD_WAIT_TIME: 1,
	RECYCLE_ACTION: "",
	IMG_PATH: false,
	DESCRIPTION: "Needs little to survive",
	TAGS: [SAVANNAH]
}

const GRIZZLY_STRIKE = "grizzly strike"
var card_ability_grizzly_strike = {
	TITLE: GRIZZLY_STRIKE,
	RARITY: 1,
	CARD_TYPE: ABILITY_CARD,
	CARD_BIOME: FOREST,
	HUNGER_PRODUCTION: 50,
	WATER_PRODUCTION: 20,
	ATTACKS: 1,
	DAMAGE: 30,
	CARD_WAIT_TIME: 1,
	RECYCLE_ACTION: "",
	IMG_PATH: main.BEAR_LIKE,
	DESCRIPTION: " ",
	TAGS: [FOREST]
}



const SHORELINE_PIRANHA  = "shorline piranha"
var card_ability_shoreline_piranha= {
	TITLE: SHORELINE_PIRANHA,
	RARITY: 1,
	CARD_TYPE: ABILITY_CARD,
	CARD_BIOME: COASTAL,
	HUNGER_PRODUCTION: 3,
	WATER_PRODUCTION: 7,
	ATTACKS: 1,
	HEALTH: 10,
	DAMAGE: 15,
	CARD_WAIT_TIME: 1,
	RECYCLE_ACTION: "",
	IMG_PATH: main.PIRANHA,
	DESCRIPTION: " ",
	TAGS: [COASTAL, WATER]
}


const HARDEN = "harden"
var card_ability_harden = {
	TITLE: HARDEN,
	RARITY: 1,
	CARD_TYPE: ABILITY_CARD,
	CARD_BIOME: COASTAL,
	HUNGER_PRODUCTION: 3,
	WATER_PRODUCTION: 3,
	DEFENSE: 10,
	CARD_WAIT_TIME: .15,
	CARD_ACTION: "gain_defense", # str name of func called elsewher
	RECYCLE_ACTION: "",
	IMG_PATH: main.ROCK_FOX,
	DESCRIPTION: "",
	TAGS: [SHIELD, COASTAL, DEFENSE]
}

const DECK_LIMIT = 30
const DEFAULT_HAND_LIMIT = 3

const OPEN_FIRE_1_SELECTED = "open_fire_1_selected"

const CALL_REINFORCEMENTS = "call reinforcements"
const GAIN_START_DRAW_1 = "gain_start_draw_1"
var card_chassis_call_reinforcments = {
	TITLE: CALL_REINFORCEMENTS,
	RARITY: 1,
	CARD_TYPE: CHASSIS_CARD,
	CARD_BIOME: COASTAL,
	HUNGER_PRODUCTION: 4,
	WATER_PRODUCTION: 1,
	CARD_WAIT_TIME: .5,
	CARD_ACTION: GAIN_START_DRAW_1, # str name of func called elsewher
	RECYCLE_ACTION: "",
	IMG_PATH: main.TRIPPLE_ELEPHANT,
	DESCRIPTION: "Add 1 to your draw next turn",
	TAGS: [COASTAL]
}


const FORAGERS = "foragers"
const FORAGERS_1 = "foragers_1"
var card_foragers_1 = {
	TITLE: FORAGERS,
	RARITY: 1,
	CARD_TYPE: CHASSIS_CARD,
	FOOD_PRODUCTION: 5,
	CARD_BIOME: FOREST,
	WATER_PRODUCTION: 3,
	HUNGER_PRODUCTION: 0,
	HEALTH: 3,
	CARD_WAIT_TIME: .35,
	CARD_ACTION: FORAGERS_1, # str name of func called elsewher
	RECYCLE_ACTION: "",
	IMG_PATH: main.BEAR_LIKE,
	DESCRIPTION: "+ 3 Health and + 5 Food",
	TAGS: [HEALTH, FOOD, FOREST]
}

const WASTE_REDUCTION = "waste reduction"
const WASTE_REDUCTION_1 = "waste_reduction_1"
var card_waste_reduction = {
	TITLE: WASTE_REDUCTION,
	RARITY: 1,
	CARD_TYPE: CHASSIS_CARD,
	CARD_BIOME: SAVANNAH,
	HUNGER_PRODUCTION: 0,
	WATER_PRODUCTION: 0,
	CARD_WAIT_TIME: .5,
	CARD_ACTION: WASTE_REDUCTION_1, # str name of func called elsewher
	RECYCLE_ACTION: "",
	IMG_PATH: false,
	DESCRIPTION: "+ 1 Food, for every [HUNGER] card you own in battle",
	TAGS: [HEALTH, FOOD, HUNGER, SAVANNAH]
}
const GROWING_HUNGER = "growing hunger"
const GROWING_HUNGER_1 = "growing_hunger_1"
var card_growing_hunger = {
	######### negative card ################
	TITLE: GROWING_HUNGER,
	RARITY: 1,
	CARD_TYPE: ABILITY_CARD,
	FOOD_PRODUCTION: 10,
	WATER_PRODUCTION: 1,
	HUNGER_PRODUCTION: 0,
	CARD_BIOME: " ",
	CARD_WAIT_TIME: .5,
	CARD_ACTION: GROWING_HUNGER_1, # str name of func called elsewher
	RECYCLE_ACTION: "",
	IMG_PATH: false,
	DESCRIPTION: "- 10 Food",
	TAGS: [HUNGER]
}
const FOOD_STOCK = "food_stock"
const FOOD_STOCK_1 = "food_stock_1"
var card_food_stock = {
	TITLE: FOOD_STOCK,
	RARITY: 1,
	CARD_TYPE: ABILITY_CARD,
	CARD_BIOME: " ",
	FOOD_PRODUCTION: 5,
	HUNGER_PRODUCTION: 0,
	WATER_PRODUCTION: 0,
	WATER: 5,
	CARD_WAIT_TIME: .5,
	CARD_ACTION: FOOD_STOCK_1, # str name of func called elsewher
	RECYCLE_ACTION: "",
	IMG_PATH: false,
	DESCRIPTION: "+ 5 Food and Water",
	TAGS: [FOOD, WATER]
}

const OVEREXTENDED_DMG = 5
const OVEREXTENDED_CARD_TITLE = "overextended"
const OVEREXTENDED_1 = "overextended_1"
var card_overextended_stock = {
	TITLE: OVEREXTENDED_CARD_TITLE,
	RARITY: 1,
	CARD_TYPE: FOOD_CARD,
	CARD_BIOME: " ",
	CARD_WAIT_TIME: .5,
	HUNGER_PRODUCTION: 0,
	WATER_PRODUCTION: 0,
	CARD_ACTION: OVEREXTENDED_1, # str name of func called elsewher
	RECYCLE_ACTION: "",
	IMG_PATH: false,
	DESCRIPTION: "Take 10 damage",
	TAGS: [HUNGER]
}

const FRESH_STREAM_TITLE = "fresh stream"
const PRESTINE_WATERS_ABILITY = "prestine waters"
var card_fresh_stream = {
	TITLE: FRESH_STREAM_TITLE,
	RARITY: 1,
	CARD_TYPE: CHASSIS_CARD,
	CARD_BIOME: RIVERLANDS,
	CARD_WAIT_TIME: .5,
	HUNGER_PRODUCTION: 5,
	WATER: 5,
	WATER_PRODUCTION: 0,
	CARD_ACTION: PRESTINE_WATERS_ABILITY, # str name of func called elsewher
	RECYCLE_ACTION: "",
	IMG_PATH: false,
	DESCRIPTION: "+ 2 Health and Food per Water card + 5 Water",
	TAGS: [WATER]
}
var riverlands_deck = [card_food_stock, card_food_stock, card_food_stock, card_food_stock,
					  card_fresh_stream, card_fresh_stream, card_fresh_stream,
					  card_stalking_python, card_stalking_python, card_stalking_python,
					  card_ability_sudden_rain, card_ability_sudden_rain, card_ability_sudden_rain,
					  card_quick_sand, card_quick_sand, card_quick_sand,
					  card_ability_poisonous_amphibians, card_ability_poisonous_amphibians, card_ability_poisonous_amphibians
					]

var savannha_deck = [card_food_stock, card_food_stock, card_food_stock, card_food_stock,
					card_vultures, card_vultures, card_vultures,
					card_towering_elephant, card_towering_elephant, card_towering_elephant,
					card_waste_reduction, card_waste_reduction, card_waste_reduction,
					card_sand_storm, card_sand_storm, card_sand_storm,
					card_ability_stampede, card_ability_stampede, card_ability_stampede
					]

var forest_deck = [card_food_stock, card_food_stock, card_food_stock, card_food_stock,
				  card_ability_grizzly_strike, card_ability_grizzly_strike, card_ability_grizzly_strike,
				  card_foragers_1, card_foragers_1, card_foragers_1,
				  card_ability_growth, card_ability_growth, card_ability_growth,
				  card_woodlands_watcher, card_woodlands_watcher, card_woodlands_watcher,
				  card_ability_grizzly_strike, card_ability_growth, card_foragers_1]
			
var coastal_deck = [card_food_stock, card_food_stock, card_food_stock, card_food_stock,
				   card_man_of_war, card_man_of_war, card_man_of_war,
				   card_ability_toxin_coated, card_ability_toxin_coated, card_ability_toxin_coated,
				   card_ability_harden, card_ability_harden, card_ability_harden,
				   card_ability_shoreline_piranha, card_ability_shoreline_piranha, card_ability_shoreline_piranha,
				   card_chassis_call_reinforcments, card_chassis_call_reinforcments, card_chassis_call_reinforcments]

var all_decks = [riverlands_deck, forest_deck, coastal_deck, savannha_deck]

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

var player_discard = []
var enemy_discard = []


var card_costs = {
	# cost is per value
	# Example a card's DAMAGE is 5, if DAMAGE cost is 5, cost added is 20 (5 * 4)
	DAMAGE: .75,
	ATTACKS: .75,
	DEFENSE: .5,
	TOUGHNESS: 1,
	HEALTH: .5,
	FOOD_PRODUCTION: 3,
	WATER: 3,
	"ability_mod": 1.1,
	"combat_mod": .8,
	"standard_mod": 1
}


func create_card_cost(card):
	# example: [WATER, 10] cost is 10 water
	# example: [HUNGER, WATER, 10] cost is 10 hunger and 10 water
	var rarity = card.rarity # 1 normal, .9 uncommon, .7 rare, ect
	var cost = []
	var cost_value = 0
	var food_cost = 0
	var water_cost = 0
	if card.damage > 0:
		cost_value += int(card.damage * card_costs[DAMAGE])
	if card.attacks > 0:
		cost_value += int(card.attacks * card_costs[ATTACKS])
	if card.defense > 0:
		cost_value += int(card.defense * card_costs[DEFENSE])
	if card.toughness > 0:
		cost_value += int(card.toughness * card_costs[TOUGHNESS])
	if card.health > 0:
		cost_value += int(card.health * card_costs[HEALTH])
	if card.food_production > 0:
		cost_value += int(card.food_production * card_costs[FOOD_PRODUCTION])
	if card.water > 0:
		cost_value += int(card.water * card_costs[WATER])

	print("card " + str(card.title) + " cost before type mod: " + str(cost_value))
	if card.card_type == Cards.ABILITY_CARD:
		cost_value = floor(cost_value * card_costs["ability_mod"])
	elif card.card_type == Cards.WEAPON_CARD:
		cost_value = floor(cost_value * card_costs["combat_mod"])
	else:
		cost_value = floor(cost_value * card_costs["standard_mod"])
	print("card " + str(card.title) + " after type mod and cost before rarity: " + str(cost_value))
	cost_value = floor(cost_value * rarity)
	print("card cost after rarity: " + str(cost_value))
	
	if card.hunger_production > 0:
		if card.card_biome == Cards.RIVERLANDS:
			food_cost = floor(cost_value * meta.riverlands_area.food_bias)
		elif card.card_biome == Cards.FOREST:
			food_cost = floor(cost_value * meta.forest_area.food_bias)
		elif card.card_biome == Cards.COASTAL:
			food_cost = floor(cost_value * meta.coastal_area.food_bias)
		elif card.card_biome == Cards.SAVANNAH:
			food_cost = floor(cost_value * meta.savannah_area.food_bias)
	if card.water_production > 0:
		if card.card_biome == Cards.RIVERLANDS:
			water_cost = floor(cost_value * meta.riverlands_area.water_bias)
		elif card.card_biome == Cards.FOREST:
			water_cost = floor(cost_value * meta.forest_area.water_bias)
		elif card.card_biome == Cards.COASTAL:
			water_cost = floor(cost_value * meta.coastal_area.water_bias)
		elif card.card_biome == Cards.SAVANNAH:
			water_cost = floor(cost_value * meta.savannah_area.water_bias)
	# create arbitrary costs for each aspect of card..
	# for example: each 5 DMG = 5 cost, * ATK
	# card of dmg 10 and atk 2 has base cost of 20 food or water
	

	print("card " + str(card.title) + " after rarity: " + str(cost_value) + " water_cost: " + str(water_cost)
			+ " water: " + str(water_cost))
	return {
			"food_cost": food_cost,
			"water_cost": water_cost,
			"cost_value": cost_value,
		}


func collect_tag_values_in_play(payload=null, is_player=true, places=["main"], desired_tag="none", animate=false, only_tally=false):
	# places: main (chasis), front and back, back(left-arm), front (right-arm), backup(leg)
	# backup and main,
	if get_node("/root").has_node("level"):
		var level = get_node("/root/level")
		if payload == null:
			payload = {
					"starting_val": 0,
					"mod_val": 1,
					"total_bonus": 0,
					"mod_bonus": 1,
					"increment_value": 1,
				}
		var velocity = payload["increment_value"]
		var value_count = payload["starting_val"]
		var total_bonus =  payload["total_bonus"]
		var mod_bonus = payload["mod_bonus"]
		var mod_val = payload["mod_val"]
		var wait_time = .25
		if is_player:
			for place in places:
				if place == "main":
					for played_card in level.player_chassis_list:
						for tag in played_card.tags:
							if tag == desired_tag:
								if animate:
									expand_card_details(played_card)
									played_card.get_node("AnimationPlayer").stop()
									played_card.get_node("AnimationPlayer").play("flicker")
									var timer = Timer.new()
									get_node("/root").add_child(timer)
									timer.set_wait_time(wait_time)
									timer.set_one_shot(true)
									timer.start()
									yield(timer, "timeout")
									timer.queue_free()
								value_count += velocity
								if only_tally:
									pass
				elif place == "front":
					for played_card in level.player_right_arm_list:
						for tag in played_card.tags:
							if tag == desired_tag:
								if animate:
									expand_card_details(played_card)
									played_card.get_node("AnimationPlayer").stop()
									played_card.get_node("AnimationPlayer").play("flicker")
									var timer = Timer.new()
									get_node("/root").add_child(timer)
									timer.set_wait_time(wait_time)
									timer.set_one_shot(true)
									timer.start()
									yield(timer, "timeout")
									timer.queue_free()
								value_count += velocity
								if only_tally:
									pass
				elif place == "back":
					for played_card in level.player_left_arm_list:
						for tag in played_card.tags:
							if tag == desired_tag:
								if animate:
									expand_card_details(played_card)
									played_card.get_node("AnimationPlayer").stop()
									played_card.get_node("AnimationPlayer").play("flicker")
									var timer = Timer.new()
									get_node("/root").add_child(timer)
									timer.set_wait_time(wait_time)
									timer.set_one_shot(true)
									timer.start()
									yield(timer, "timeout")
									timer.queue_free()
								value_count += velocity
								if only_tally:
									pass
				elif place == "backup":
					for played_card in level.player_leg_list:
						for tag in played_card.tags:
							if tag == desired_tag:
								if animate:
									expand_card_details(played_card)
									played_card.get_node("AnimationPlayer").stop()
									played_card.get_node("AnimationPlayer").play("flicker")
									var timer = Timer.new()
									get_node("/root").add_child(timer)
									timer.set_wait_time(wait_time)
									timer.set_one_shot(true)
									timer.start()
									yield(timer, "timeout")
									timer.queue_free()
								value_count += velocity
								if only_tally:
									pass
		else:
			for place in places:
				if place == "main":
					for played_card in level.enemy_chassis_list:
						for tag in played_card.tags:
							if tag == desired_tag:
								if animate:
									expand_card_details(played_card)
									played_card.get_node("AnimationPlayer").stop()
									played_card.get_node("AnimationPlayer").play("flicker")
									var timer = Timer.new()
									get_node("/root").add_child(timer)
									timer.set_wait_time(wait_time)
									timer.set_one_shot(true)
									timer.start()
									yield(timer, "timeout")
									timer.queue_free()
								value_count += velocity
								if only_tally:
									pass
				elif place == "front":
					for played_card in level.enemy_right_arm_list:
						for tag in played_card.tags:
							if tag == desired_tag:
								if animate:
									expand_card_details(played_card)
									played_card.get_node("AnimationPlayer").stop()
									played_card.get_node("AnimationPlayer").play("flicker")
									var timer = Timer.new()
									get_node("/root").add_child(timer)
									timer.set_wait_time(wait_time)
									timer.set_one_shot(true)
									timer.start()
									yield(timer, "timeout")
									timer.queue_free()
								value_count += velocity
								if only_tally:
									pass
				elif place == "back":
					for played_card in level.enemy_left_arm_list:
						for tag in played_card.tags:
							if tag == desired_tag:
								if animate:
									expand_card_details(played_card)
									played_card.get_node("AnimationPlayer").stop()
									played_card.get_node("AnimationPlayer").play("flicker")
									var timer = Timer.new()
									get_node("/root").add_child(timer)
									timer.set_wait_time(wait_time)
									timer.set_one_shot(true)
									timer.start()
									yield(timer, "timeout")
									timer.queue_free()
								value_count += velocity
								if only_tally:
									pass
				elif place == "backup":
					for played_card in level.enemy_leg_list:
						for tag in played_card.tags:
							if tag == desired_tag:
								if animate:
									expand_card_details(played_card)
									played_card.get_node("AnimationPlayer").stop()
									played_card.get_node("AnimationPlayer").play("flicker")
									var timer = Timer.new()
									get_node("/root").add_child(timer)
									timer.set_wait_time(wait_time)
									timer.set_one_shot(true)
									timer.start()
									yield(timer, "timeout")
									timer.queue_free()
								value_count += velocity
								if only_tally:
									pass
		########
		return value_count
	return 0


func set_area_bonuses():
	if get_node("/root").has_node("level"):
		var level = get_node("/root/level")
		randomize()
		var rand_choices = [Cards.RIVERLANDS, Cards.FOREST, Cards.SAVANNAH, Cards.COASTAL]
		var choice = rand_choices[rand_range(0, len(rand_choices)-1)]
		if choice == Cards.RIVERLANDS:
			meta.area_biome = Cards.RIVERLANDS
			meta.area_food_per_turn = meta.riverlands_area.food
			meta.area_water_per_turn = meta.riverlands_area.water
			level.get_node("background_imgs/Sprite").set_texture(main.RIVERLANDS_BACKDROP)
		elif choice == Cards.FOREST:
			meta.area_biome = Cards.FOREST
			meta.area_food_per_turn = meta.forest_area.food
			meta.area_water_per_turn = meta.forest_area.water
			level.get_node("background_imgs/Sprite").set_texture(main.FOREST_BACKDROP)
		elif choice == Cards.SAVANNAH:
			meta.area_biome = Cards.SAVANNAH
			meta.area_food_per_turn = meta.savannah_area.food
			meta.area_water_per_turn = meta.savannah_area.water
			level.get_node("background_imgs/Sprite").set_texture(main.SAVANNAH_BACKDROP)
		else:
			meta.area_biome = Cards.COASTAL
			meta.area_food_per_turn = meta.coastal_area.food
			meta.area_water_per_turn = meta.coastal_area.water
			level.get_node("background_imgs/Sprite").set_texture(main.COASTAL_BACKDROP)


func give_area_biome_bonus(is_player=true):
	if is_player:
		meta.player_food += meta.area_food_per_turn
		meta.player_water += meta.area_water_per_turn
	else:
		meta.enemy_food += meta.area_food_per_turn
		meta.enemy_water += meta.area_water_per_turn

func take_turn(is_player=true):
	if get_node("/root").has_node("level"):
		var level = get_node("/root/level")
		reset_display_card_sizes()
		give_area_biome_bonus(is_player)
		level.update_text_overlays()
		if is_player and not waiting:
			waiting = true
			level.get_node("background_imgs/alert").modulate = Color(.2, .2, 1, 1)
			if meta.player_hand_limit > meta.player_hand_limit_max:
				meta.player_hand_limit = meta.player_hand_limit_max
			spawn_cards(meta.player_hand_limit, is_player, meta.current_player_deck)
			if meta.player_hand_limit > meta.player_hand_limit_default:
				meta.player_hand_limit = meta.player_hand_limit_default
			meta.player_turn = false
				
			var timer = Timer.new()
			var time = .5
			get_node("/root").add_child(timer)
			timer.set_wait_time(time)
			timer.set_one_shot(true)
			timer.start()
			yield(timer, "timeout")
			timer.queue_free()
			level.get_node("background_imgs/alert").modulate = Color(1, 1, 1, 1)
			waiting = false
		elif not waiting:
			waiting = true
			level.get_node("background_imgs/alert").modulate = Color(1, .2, .2, 1)
			play_all_display_card_actions(true)
			discard_hands_resource(true)
			remove_all_cards_in_hand(true)
			var timer = Timer.new()
			var time = round(int(len(level.player_chassis_list) + len(level.player_right_arm_list)\
					 + len(level.player_left_arm_list)) * 2.25) + 1
			get_node("/root").add_child(timer)
			timer.set_wait_time(time)
			timer.set_one_shot(true)
			timer.start()
			yield(timer, "timeout")
			timer.queue_free()
			# spawn and play for enm
			spawn_cards(4, is_player, meta.current_enemy_deck)
	
			var timer2 = Timer.new()
			var time2 = 2.25
			get_node("/root").add_child(timer2)
			timer2.set_wait_time(time2)
			timer2.set_one_shot(true)
			timer2.start()
			yield(timer2, "timeout")
			timer2.queue_free()
			play_all_display_card_actions(false)
			
			var timer3 = Timer.new()
			var time3 = floor(len(level.enemy_chassis_list) + len(level.enemy_right_arm_list)\
					 + len(level.enemy_left_arm_list) * 2) + 1.25
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
			discard_hands_resource(false)
			remove_all_cards_in_hand(false)
			level.get_node("background_imgs/alert").modulate = Color(1, 1, 1, 1)
			waiting = false
			take_turn(meta.player_turn)
	reset_display_card_sizes()


func discard_hands_resource(is_player=true):
	if is_player:
		for card in hand:
			card.get_node("AnimationPlayer").stop()
			card.get_node("AnimationPlayer").play("remove")
			if HUNGER_PRODUCTION in card and card[HUNGER_PRODUCTION] > 0:
				meta.player_food += int(card[HUNGER_PRODUCTION] * .25)
			if WATER_PRODUCTION in card and card[WATER_PRODUCTION] > 0:
				meta.player_water += int(card[WATER_PRODUCTION] * .25)
	else:
		for card in enm_hand:
			card.get_node("AnimationPlayer").stop()
			card.get_node("AnimationPlayer").play("remove")
			if HUNGER_PRODUCTION in card and card[HUNGER_PRODUCTION] > 0:
				meta.enemy_food += int(card[HUNGER_PRODUCTION] * .25)
			if WATER_PRODUCTION in card and card[WATER_PRODUCTION] > 0:
				meta.enemy_water += int(card[WATER_PRODUCTION] * .25)



func play_all_display_card_actions(is_player=true):
	if get_node("/root").has_node("level"):
		var level = get_node("/root/level")
		if is_player and player_display_turn:
			level.get_node("background_imgs/alert").modulate = Color(.1, .1, .7, 1)
			for card in level.player_chassis_list:
				card.modulate = Color(.4, .4, 1, 1)
				expand_card_details(card)

				var should_stop = card_action(card.card_action, is_player, "", card)
				var timer = Timer.new()
				var time = card.card_wait_time
				get_node("/root").add_child(timer)
				timer.set_wait_time(time)
				timer.set_one_shot(true)
				timer.start()
				yield(timer, "timeout")
				timer.queue_free()
				level.update_text_overlays()
				card.modulate = Color(1, 1, 1, 1)

			for card in level.player_right_arm_list:
				card.modulate = Color(.4, .4, 1, 1)
				expand_card_details(card)

				var should_stop = card_action(card.card_action, is_player, "", card)
				var timer = Timer.new()
				get_node("/root").add_child(timer)
				timer.set_wait_time(float(card.card_wait_time)  * 2 )
				timer.set_one_shot(true)
				timer.start()
				yield(timer, "timeout")
				timer.queue_free()
				level.update_text_overlays()
				card.modulate = Color(1, 1, 1, 1)

			for card in level.player_left_arm_list:
				card.modulate = Color(.4, .4, 1, 1)
				expand_card_details(card)
				
				var should_stop = card_action(card.card_action, is_player, "", card)
				var timer = Timer.new()
				get_node("/root").add_child(timer)
				timer.set_wait_time(float(card.card_wait_time) * 2)
				timer.set_one_shot(true)
				timer.start()
				yield(timer, "timeout")
				timer.queue_free()
				level.update_text_overlays()
				card.modulate = Color(1, 1, 1, 1)

			for card in level.player_leg_list:
				card.modulate = Color(.4, .4, 1, 1)
				expand_card_details(card)

				var should_stop = card_action(card.card_action, is_player, "", card)
				var timer = Timer.new()
				get_node("/root").add_child(timer)
				timer.set_wait_time(float(card.card_wait_time) * 2)
				timer.set_one_shot(true)
				timer.start()
				yield(timer, "timeout")
				timer.queue_free()
				level.update_text_overlays()
				card.modulate = Color(1, 1, 1, 1)
			player_display_turn = false
		# end of player logic
		else:
			level.get_node("background_imgs/alert").modulate = Color(.7, .1, .1, 1)
			# Enemy:
			for card in level.enemy_chassis_list:
				card.modulate = Color(.4, .4, 1, 1)
				expand_card_details(card)

				var should_stop = card_action(card.card_action, is_player, "", card)
				var timer = Timer.new()
				var time = float(card.card_wait_time)
				get_node("/root").add_child(timer)
				timer.set_wait_time(time)
				timer.set_one_shot(true)
				timer.start()
				yield(timer, "timeout")
				timer.queue_free()
				level.update_text_overlays()
				card.modulate = Color(1, 1, 1, 1)

			for card in level.enemy_right_arm_list:
				card.modulate = Color(.4, .4, 1, 1)
				expand_card_details(card)

				var should_stop = card_action(card.card_action, is_player, "", card)
				var timer = Timer.new()
				get_node("/root").add_child(timer)
				timer.set_wait_time(float(card.card_wait_time))
				timer.set_one_shot(true)
				timer.start()
				yield(timer, "timeout")
				timer.queue_free()
				level.update_text_overlays()
				card.modulate = Color(1, 1, 1, 1)

			for card in level.enemy_left_arm_list:
				card.modulate = Color(.4, .4, 1, 1)
				expand_card_details(card)
				
				var should_stop = card_action(card.card_action, is_player, "", card)
				var timer = Timer.new()
				get_node("/root").add_child(timer)
				timer.set_wait_time(float(card.card_wait_time))
				timer.set_one_shot(true)
				timer.start()
				yield(timer, "timeout")
				timer.queue_free()
				level.update_text_overlays()
				card.modulate = Color(1, 1, 1, 1)

			for card in level.enemy_leg_list:
				card.modulate = Color(.4, .4, 1, 1)
				expand_card_details(card)

				var should_stop = card_action(card.card_action, is_player, "", card)
				var timer = Timer.new()
				get_node("/root").add_child(timer)
				timer.set_wait_time(float(card.card_wait_time))
				timer.set_one_shot(true)
				timer.start()
				yield(timer, "timeout")
				timer.queue_free()
				level.update_text_overlays()
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
				effect.position = level.get_node("text_cont/player_health_max_pos").global_position
			else:
				effect.position = level.get_node("text_cont/enemy_health_max_pos").global_position

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


func shuffle_card_into_deck(card, is_player):
	if is_player:
		meta.current_player_deck.append(card)
	else:
		meta.current_enemy_deck.append(card)


func pay_for_card(level, card, hunger, thirst, food, water, is_player=true):
	print("start card cost: " + str(hunger) + " food: " + str(food) + " water: " + str(water))
	var stop_response = "stop"
	if is_player:
		print("player food before: " + str(meta.player_food))
		print("water before: " + str(meta.player_water))
		meta.player_food += food
		meta.player_water += water
		var leftover_food = meta.player_food - hunger
		var leftover_water = meta.player_water - thirst
	
		if leftover_food < 0:
			 # CAN'T PLAY CARD
			shuffle_card_into_deck(card_overextended_stock, true)
			level.update_text_overlays()
			print("leftoverfood: " + str(leftover_food) + " is less than food cost: " + str(hunger))
			
			if meta.player_food < 0:
				meta.player_food = 0
			return stop_response
		else:
			meta.player_food = leftover_food
	
		if leftover_water < 0:
			 # CAN'T PLAY CARD
			shuffle_card_into_deck(card_overextended_stock, false)
			level.update_text_overlays()
			print("leftoverwater: " + str(leftover_water) + " is less than water cost: " + str(thirst))
			
			if meta.player_water < 0:
				meta.player_water = 0
			return stop_response
		else:
			meta.player_water = leftover_water
		
		print("player food after: " + str(meta.player_food))
		print("water after: " + str(meta.player_water))
		
		if meta.player_water < 0:
			meta.player_water = 0
		if meta.player_food < 0:
			meta.player_food = 0
	else:
		print("enm food before: " + str(meta.enemy_food))
		print("water before: " + str(meta.enemy_water))
		meta.enemy_food += food
		meta.enemy_water += water
		var leftover_food = meta.enemy_food - hunger
		var leftover_water = meta.enemy_water - thirst
	
		if leftover_food < 0:
			 # CAN'T PLAY CARD
			shuffle_card_into_deck(card_overextended_stock, true)
			if meta.enemy_food < 0:
				meta.enemy_food = 0
			level.update_text_overlays()
			return stop_response
		else:
			meta.enemy_food = leftover_food
	
		if leftover_water < 0:
			 # CAN'T PLAY CARD
			if meta.enemy_water < 0:
				meta.enemy_water = 0
			shuffle_card_into_deck(card_overextended_stock, false)
			level.update_text_overlays()
			return stop_response
		else:
			meta.enemy_water = leftover_water
		
		if meta.enemy_water < 0:
			meta.enemy_water = 0
		if meta.enemy_food < 0:
			meta.enemy_food = 0
		print("enm food after: " + str(meta.enemy_food))
		print("water after: " + str(meta.enemy_food))
	level.update_text_overlays()
	return "continue"


func card_action(act_str, is_player=true, avoid_recursion_str="", card=null):

	# Change pulling card details from text boxes to storing in new attached script
	#
	#
	#
	#

	var stop_response = "stop"
	act_str = act_str.to_lower()
	avoid_recursion_str = avoid_recursion_str.to_lower()
	if avoid_recursion_str == act_str:
		print("in card_action RECURSION: " + act_str + " " + avoid_recursion_str)
		return stop_response

	if get_node("/root").has_node("level"):
		var action_time = .5
		if card:
			expand_card_details(card)
			card.modulate = Color(.4, .4, 1, 1)
		var level = get_node("/root/level")
		## 1 #############################################################
		## Get info from played cards (may be changed)
		print("in card_action: " + act_str + " " + card.title)
		card.get_node("AnimationPlayer").stop()
		card.get_node("AnimationPlayer").play("activate general")
		var bonus_atks = meta.player_attacks_bonus
		var bonus_dmg = meta.player_damage_bonus
		var bonus_def = meta.player_health_bonus
		var bonus_toughness = meta.player_toughness_bonus
		var bonus_health = meta.player_defense_bonus
		var hunger_bonus = meta.player_hunger_production_bonus
		var water_bonus = meta.player_water_bonus
		var food_bonus = meta.player_food_bonus
		if not is_player:
			bonus_atks = meta.enemy_attacks_bonus
			bonus_dmg = meta.enemy_damage_bonus
			bonus_def = meta.enemy_health_bonus
			bonus_toughness = meta.enemy_toughness_bonus
			bonus_health = meta.enemy_defense_bonus
			hunger_bonus = meta.enemy_hunger_production_bonus
			water_bonus = meta.enemy_water_bonus
			food_bonus = meta.enemy_food_bonus
		
		# hunger is ALWAYS cost of food (total_food - hunger)
		# food is food GAINED (total_food + food)
		var food = card.food_production + food_bonus
		var hunger = card.hunger_production + hunger_bonus
		var thirst = card.water_production + water_bonus
		var water = card.water + water_bonus

		var atks = card.attacks + bonus_atks
		var dmg = card.damage + bonus_dmg 

		var health = card.health + bonus_health
		var toughnes = card.toughness + bonus_toughness
		var defense = card.defense + bonus_def

		var total_dmg = round(atks * dmg)

		var action_sub_time = (action_time*.33)
		var action_sub_shake_vel = 2

		var pay_stop_response = pay_for_card(level, card, hunger, thirst, food, water, is_player)
		

		# 2 ###################################################################
		# make sure there is enough food and water to play card
		level.update_text_overlays()
		if pay_stop_response == stop_response:
			return stop_response

		### 3 #############################################################
		### PROCESS ATKS/DAMAGE
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
					apply_text_effect("hurt", "- " + str(dmg), (is_player == false)) #TEXT_EFECT
					if is_player:
						var remaining_defense = (meta.enemy_defense - dmg)
						if remaining_defense > 0:
							meta.enemy_defense = remaining_defense
						else:
							meta.enemy_defense = 0
						dmg -= meta.enemy_defense
						if dmg > 0:
							meta.enemy_health -= dmg
					else:
						var remaining_defense = (meta.player_defense - dmg)
						if remaining_defense > 0:
							meta.player_defense = remaining_defense
						else:
							meta.player_defense = 0
						dmg -= meta.player_defense
						if dmg > 0:
							meta.player_health -= dmg
		
		level.update_text_overlays()

		# 4 ###############################################################
		### Process Actions, each action's logic should be WHOLEY contained
		### in condition including seperate enm logic for readablility &..
		### .. consistent dev expectations
		if act_str == OVEREXTENDED_1 and not "stop_" in avoid_recursion_str:
			dmg = OVEREXTENDED_DMG
			if is_player:
				var remaining_defense = (meta.player_defense - dmg)
				if remaining_defense > 0:
					meta.player_defense = remaining_defense
				else:
					meta.player_defense = 0
				dmg -= meta.player_defense
				if dmg > 0:
					meta.player_health -= dmg
				apply_text_effect("hurt", "- " + str(dmg), is_player) #TEXT_EFECT
			else:
				var remaining_defense = (meta.enemy_defense - dmg)
				if remaining_defense > 0:
					meta.enemy_defense = remaining_defense
				else:
					meta.enemy_defense = 0
				dmg -= meta.enemy_defense
				if dmg > 0:
					meta.enemy_health -= dmg
				apply_text_effect("hurt", "- " + str(dmg), false) #TEXT_EFECT
		elif act_str == PRESTINE_WATERS_ABILITY and not "stop_" in avoid_recursion_str:
			if is_player: # WASTE_REDUCTION_1
				for chassis_card in level.player_right_arm_list:
					for tag in chassis_card.tags:
						if tag == WATER:
							main.cameraShake(action_sub_shake_vel, action_sub_time)
							expand_card_details(chassis_card)
							chassis_card.get_node("AnimationPlayer").stop()
							chassis_card.get_node("AnimationPlayer").play("flicker")
							meta.player_food += 2
							meta.player_health += 2
							var timer = Timer.new()
							get_node("/root").add_child(timer)
							timer.set_wait_time(action_time)
							timer.set_one_shot(true)
							timer.start()
							yield(timer, "timeout")
							timer.queue_free()
							break
				for chassis_card in level.player_left_arm_list:
					for tag in chassis_card.tags:
						if tag == WATER:
							main.cameraShake(action_sub_shake_vel, action_sub_time)
							expand_card_details(chassis_card)
							chassis_card.get_node("AnimationPlayer").stop()
							chassis_card.get_node("AnimationPlayer").play("flicker")
							meta.player_food += 2
							meta.player_health += 2
							var timer = Timer.new()
							get_node("/root").add_child(timer)
							timer.set_wait_time(action_time)
							timer.set_one_shot(true)
							timer.start()
							yield(timer, "timeout")
							timer.queue_free()
							break
				for chassis_card in level.player_chassis_list:
					for tag in chassis_card.tags:
						if tag == WATER:
							main.cameraShake(action_sub_shake_vel, action_sub_time)
							expand_card_details(chassis_card)
							chassis_card.get_node("AnimationPlayer").stop()
							chassis_card.get_node("AnimationPlayer").play("flicker")
							meta.player_food += 2
							meta.player_health += 2
							var timer = Timer.new()
							get_node("/root").add_child(timer)
							timer.set_wait_time(action_time)
							timer.set_one_shot(true)
							timer.start()
							yield(timer, "timeout")
							timer.queue_free()
							break
				for chassis_card in level.player_leg_list:
					for tag in chassis_card.tags:
						if tag == WATER:
							main.cameraShake(action_sub_shake_vel, action_sub_time)
							expand_card_details(chassis_card)
							chassis_card.get_node("AnimationPlayer").stop()
							chassis_card.get_node("AnimationPlayer").play("flicker")
							meta.player_food += 2
							meta.player_health += 2
							var timer = Timer.new()
							get_node("/root").add_child(timer)
							timer.set_wait_time(action_time)
							timer.set_one_shot(true)
							timer.start()
							yield(timer, "timeout")
							timer.queue_free()
							break
			else:
				for chassis_card in level.enemy_right_arm_list:
					for tag in chassis_card.tags:
						if tag == WATER:
							main.cameraShake(action_sub_shake_vel, action_sub_time)
							expand_card_details(chassis_card)
							chassis_card.get_node("AnimationPlayer").stop()
							chassis_card.get_node("AnimationPlayer").play("flicker")
							meta.enemy_food += 2
							meta.enemy_health += 2
							var timer = Timer.new()
							get_node("/root").add_child(timer)
							timer.set_wait_time(action_time)
							timer.set_one_shot(true)
							timer.start()
							yield(timer, "timeout")
							timer.queue_free()
							break
				for chassis_card in level.enemy_left_arm_list:
					for tag in chassis_card.tags:
						if tag == WATER:
							main.cameraShake(action_sub_shake_vel, action_sub_time)
							expand_card_details(chassis_card)
							chassis_card.get_node("AnimationPlayer").stop()
							chassis_card.get_node("AnimationPlayer").play("flicker")
							meta.enemy_food += 2
							meta.enemy_health += 2
							var timer = Timer.new()
							get_node("/root").add_child(timer)
							timer.set_wait_time(action_time)
							timer.set_one_shot(true)
							timer.start()
							yield(timer, "timeout")
							timer.queue_free()
							break
				for chassis_card in level.enemy_chassis_list:
					for tag in chassis_card.tags:
						if tag == WATER:
							main.cameraShake(action_sub_shake_vel, action_sub_time)
							expand_card_details(chassis_card)
							chassis_card.get_node("AnimationPlayer").stop()
							chassis_card.get_node("AnimationPlayer").play("flicker")
							meta.enemy_food += 2
							meta.enemy_health += 2
							var timer = Timer.new()
							get_node("/root").add_child(timer)
							timer.set_wait_time(action_time)
							timer.set_one_shot(true)
							timer.start()
							yield(timer, "timeout")
							timer.queue_free()
							break
				for chassis_card in level.enemy_leg_list:
					for tag in chassis_card.tags:
						if tag == WATER:
							main.cameraShake(action_sub_shake_vel, action_sub_time)
							expand_card_details(chassis_card)
							chassis_card.get_node("AnimationPlayer").stop()
							chassis_card.get_node("AnimationPlayer").play("flicker")
							meta.enemy_food += 2
							meta.enemy_health += 2
							var timer = Timer.new()
							get_node("/root").add_child(timer)
							timer.set_wait_time(action_time)
							timer.set_one_shot(true)
							timer.start()
							yield(timer, "timeout")
							timer.queue_free()
							break
		elif act_str == FOOD_STOCK_1 and not "stop_" in avoid_recursion_str:
			if is_player:
				meta.player_food += food
				meta.player_water += water
			else:
				meta.enemy_food += food
				meta.enemy_water += water
			card.modulate = Color(.2, 1, .2, 1)
			apply_text_effect("hunger", "- " + str(hunger), is_player) #TEXT_EFECT
		elif act_str == GROWING_HUNGER_1 and not "stop_" in avoid_recursion_str:
			if is_player:
				meta.player_food -= hunger
			else:
				meta.enemy_food -= hunger
			card.modulate = Color(.2, 1, .2, 1)
			apply_text_effect("hunger", "+ " + str(hunger), is_player) #TEXT_EFECT
		elif act_str == GAIN_START_DRAW_1 and not "stop_" in avoid_recursion_str:
			if is_player:
				meta.player_hand_limit += 1
				meta.current_salvage += 10
			else:
				meta.enemy_hand_limit += 1
		elif act_str == WASTE_REDUCTION_1 and not "stop_" in avoid_recursion_str:
			print("\nWASTE_REDUCTION_1 " + str(WASTE_REDUCTION_1))
			
			var total_hunger_count = collect_tag_values_in_play(null, is_player, ["main", "front", "back", "backup"], HUNGER, false)
			if is_player: # WASTE_REDUCTION_1
				print(act_str + ": total_hunger_count: " + str(total_hunger_count))
				apply_text_effect("hunger up", "+" + str(total_hunger_count), is_player) #TEXT_EFECT
				meta.player_food += total_hunger_count
			else:
				# WASTE_REDUCTION_1 - Enemy
				print(act_str + ": total_hunger_count: " + str(total_hunger_count))
				apply_text_effect("hunger up", "+" + str(total_hunger_count), is_player) #TEXT_EFECT
				meta.enemy_food += total_hunger_count
			level.update_text_overlays()
			if card:
				card.modulate = Color(1, 1, 1, 1)
		elif act_str == TOWERING_ELEPHANT_ABILITY_1 and not "stop_" in avoid_recursion_str:
			# Activate first x weapon of cards from right to left arm equal to your [IMPACT]"
			var skill_impact_count = collect_tag_values_in_play(null, is_player, ["main", "front", "back", "backup"], IMPACT, false)
			if is_player:
				var final_impact_dmg = skill_impact_count * dmg
				if final_impact_dmg > 0:
					var remaining_defense = (meta.enemy_defense - final_impact_dmg)
					if remaining_defense > 0:
						meta.enemy_defense = remaining_defense
					else:
						meta.enemy_defense = 0
					final_impact_dmg -= meta.enemy_defense
					if final_impact_dmg > 0:
						meta.enemy_health -= final_impact_dmg
						main.cameraShake(skill_impact_count*.5, (action_time*.4))
						apply_text_effect("hurt", "- " + str(final_impact_dmg), false) #TEXT_EFECT
			else:
				var final_impact_dmg = int(skill_impact_count) * int(dmg)
				if final_impact_dmg > 0:
					var remaining_defense = (meta.player_defense - final_impact_dmg)
					if remaining_defense > 0:
						meta.player_defense = remaining_defense
					else:
						meta.player_defense = 0
					final_impact_dmg -= defense
					if final_impact_dmg > 0:
						meta.player_health -= final_impact_dmg
						# Enemy IMPACT_LAUNCHER_ABILITY_1
						main.cameraShake(skill_impact_count*.5, (action_time*.4))
						apply_text_effect("hurt", "- " + str(final_impact_dmg), true) #TEXT_EFECT

		if is_player:
			meta.player_health += health
			meta.player_defense += defense
			meta.player_toughness += toughnes
		else:
			meta.enemy_health += health
			meta.enemy_defense += defense
			meta.enemy_toughnes += toughnes
		level.update_text_overlays()
		if card and main.checkIfNodeDeleted(card) == false:
			card.get_node("AnimationPlayer").stop()
			card.get_node("AnimationPlayer").play("reset")

		level.update_text_overlays()
		reset_display_card_sizes()


func play_card(card_list, card_idx, is_player=true):
	# card_action(player_card_list[player_card_idx][CARD_ACTION], is_player, "")
	if is_player:
		if card_idx >= 0 and card_idx <= len(hand) - 1 and len(hand) > 0:
			player_discard.append(hand[card_idx])
			if card_list[card_idx].card_type == ABILITY_CARD:
				hand[card_idx].visible = false
				var level = get_node("/root/level")
				var should_stop = card_action(card_list[card_idx].card_action, is_player, "", card_list[card_idx])
				level.update_text_overlays()
				var timer = Timer.new()
				get_node("/root").add_child(timer)
				timer.set_wait_time(float(card_list[card_idx].card_wait_time))
				timer.set_one_shot(true)
				timer.start()
				yield(timer, "timeout")
				timer.queue_free()
				if card_idx >= 0 and card_idx < len(hand):
					hand.remove(card_idx)
			else:
				place_card_in_display(card_list, card_idx, is_player)
				
		else:
			print("whoops player, didn't play a card successfully")

	else:
		if card_idx >= 0 and card_idx <= len(card_list) - 1 and len(card_list) > 0:
			enemy_discard.append(card_list[card_idx])
			if card_list[card_idx].card_type == ABILITY_CARD:
				card_list[card_idx].visible = false
				var level = get_node("/root/level")
				var should_stop = card_action(card_list[card_idx].card_action, is_player, "", card_list[card_idx])
				level.update_text_overlays()
				var timer = Timer.new()
				get_node("/root").add_child(timer)
				timer.set_wait_time(float(card_list[card_idx].card_wait_time))
				timer.set_one_shot(true)
				timer.start()
				yield(timer, "timeout")
				timer.queue_free()
				if card_idx >= 0 and card_idx < len(card_list):
					card_list.remove(card_idx)
			else:
				place_card_in_display(card_list, card_idx, is_player)
		else:
			print("whoops enm, didn't play a card successfully")
	if is_player:
		hand_idx = 0


func place_card_in_display(card_list, card_idx, is_player=false):
	if is_player:
		if card_idx >= 0 and card_idx <= len(card_list) - 1 and len(card_list) > 0:
			if card_list[card_idx].card_type == ABILITY_CARD:
				card_list[card_idx].visible = false
			else:
				var level = get_node("/root/level")
				var new_card = main.CARD.instance()
				new_card.set_scale(Vector2(.7, .7))
				get_node("/root").add_child(new_card)
				new_card.map_card(card_list[card_idx])
				set_card_img(new_card, card_list[card_idx])
				if card_list[card_idx].card_type == WEAPON_CARD:
					if len(level.player_right_arm_list) < level.player_right_arm_list_limit:
						level.player_right_arm_list.append(new_card)
					elif len(level.player_left_arm_list) < level.player_left_arm_list_limit:
						level.player_left_arm_list.append(new_card)
					else:
						remove_card(new_card)
				elif card_list[card_idx].card_type== CHASSIS_CARD ||\
					 card_list[card_idx].card_type == HUNGER_CARD ||\
					 card_list[card_idx].card_type == FOOD_CARD|| \
					 card_list[card_idx].card_type == WATER_CARD:
					if len(level.player_chassis_list) < level.player_chassis_list_limit:
						level.player_chassis_list.append(new_card)
					elif len(level.player_leg_list) < level.player_leg_list_limit:
						level.player_leg_list.append(new_card)
					else:
						remove_card(new_card)
				elif card_list[card_idx].card_type == LEG_CARD:
					if len(level.player_leg_list) < level.player_leg_list_limit:
						level.player_leg_list.append(new_card)
					else:
						remove_card(new_card)

				if card_idx >= 0 and card_idx < len(card_list) and len(card_list) > 0:
					var item = card_list[card_idx]
					card_list.remove(card_idx)
					remove_card(item)
				#update_display_card(new_card, card_list[card_idx])
				#remove_card(hand[card_idx])
				print("PLAYER in place_card_in_display hand after card played: " + str(len(card_list)) + " + card_list: " + str(len(card_list)))

			handle_cards_in_display()
			#update_display_card(new_card, card_payload)
		else:
			print("tableau list doesn't match?")
	else:
		# Is Enemy
		if card_idx >= 0 and card_idx <= len(card_list) - 1 and len(card_list) > 0:
			if card_list[card_idx].card_type == ABILITY_CARD:
				card_list[card_idx].visible = false
			else:
				var level = get_node("/root/level")
				var new_card = main.CARD.instance()
				new_card.set_scale(Vector2(.3, .3))
				get_node("/root").add_child(new_card)
				new_card.map_card(card_list[card_idx])
				set_card_img(new_card, card_list[card_idx])
				if card_list[card_idx].card_type == WEAPON_CARD:
					if len(level.enemy_right_arm_list) < level.enemy_right_arm_list_limit:
						level.enemy_right_arm_list.append(new_card)
					elif len(level.player_left_arm_list) < level.enemy_left_arm_list_limit:
						level.enemy_left_arm_list.append(new_card)
					else:
						print("no more room for weapon cards")
				elif card_list[card_idx].card_type == CHASSIS_CARD ||\
					 card_list[card_idx].card_type == HUNGER_CARD ||\
					 card_list[card_idx].card_type == FOOD_CARD ||\
					 card_list[card_idx].card_type == WATER_CARD:
					if len(level.enemy_chassis_list) < level.enemy_chassis_list_limit:
						level.enemy_chassis_list.append(new_card)
					elif len(level.enemy_leg_list) < level.enemy_leg_list_limit:
						level.enemy_leg_list.append(new_card)
					else:
						remove_card(new_card)
				elif card_list[card_idx].card_type == LEG_CARD:
					if len(level.enemy_leg_list) < level.enemy_leg_list_limit:
						level.enemy_leg_list.append(new_card)
					else:
						remove_card(new_card)
				else:
					reset_display_card_sizes()

				if card_idx >= 0 and card_idx < len(card_list) and len(card_list) > 0:
					var item = card_list[card_idx]
					card_list.remove(card_idx)
					remove_card(item)
				#update_display_card(new_card, enm_card_detail_list[hand_idx])
				# remove_card(card_list[card_idx])x
					# enm_hand.remove(card_idx)
				#enm_card_detail_list.remove(hand_idx)
				print("in place_card_in_display card_list after card played: " + str(len(card_list)) + " + card_list: " + str(len(card_list)))

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
		if card and main.checkIfNodeDeleted(card) == false:
			card.set_scale(normal_size)
	


func expand_card_details(chosen_card=false):
	if get_node("/root").has_node("level") and not card_expanded:
		card_expanded = true
		var level = get_node("/root/level")
		var current_location = Vector2(0, 0)
		var zoom_size = Vector2(1.7, 1.7)
		var smaller_zoom_size = Vector2(1.5, 1.5)
		var card_zoomed_location = Vector2(400, 900)
		var zoomed_idx = 200
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
		if card and main.checkIfNodeDeleted(card) == false:
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
	if card_payload[CARD_BIOME] == SAVANNAH:
		new_card.get_node("inner_art_container/background").set_texture(main.CARD_RED_BACKGROUND_1)
	elif card_payload[CARD_BIOME] == FOREST:
		new_card.get_node("inner_art_container/background").set_texture(main.CARD_GREEN_BACKGROUND_1)
	elif card_payload[CARD_BIOME] == COASTAL:
		new_card.get_node("inner_art_container/background").set_texture(main.CARD_BLUE_BACKGROUND_1)
	elif card_payload[CARD_BIOME] == RIVERLANDS:
		new_card.get_node("inner_art_container/background").set_texture(main.CARD_YELLOW_BACKGROUND_1)
	else:
		new_card.get_node("inner_art_container/background").set_texture(main.CARD_GREY_BACKGROUND_1)
		
	if card_payload[IMG_PATH]:
		new_card.get_node("inner_art_container/sprite").visible = true
		new_card.get_node("inner_art_container/sprite").set_texture(card_payload.img_path)


func spawn_cards(hand_limit, is_player=true, deck=riverlands_deck):
	randomize()
	if is_player:
		hand = []
		# card_detail_list = []
		var og_card_pos = Vector2(0, 0)
		for card in range(meta.player_hand_limit):
			var new_card = main.CARD.instance()
			new_card.z_index = 120
			get_node("/root").call_deferred("add_child", new_card)
			var rand_card = get_random_card(deck, is_player)
			var card_payload = get_card_payload(rand_card)
			card_payload[ID] = get_card_id()
			new_card.map_card(card_payload)
			set_card_img(new_card, card_payload)
			# update_display_card(new_card, card_payload)
			# card_detail_list.append(rand_card)
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
			var time = .15
			get_node("/root").add_child(timer)
			timer.set_wait_time(time)
			timer.set_one_shot(true)
			timer.start()
			yield(timer, "timeout")
			timer.queue_free()
			handle_cards_in_display()
	else:
		enm_hand = []
		# enm_card_detail_list = []
		var og_card_pos = Vector2(0, 0)
		for card in range(hand_limit):
			var new_card = main.CARD.instance()
			new_card.z_index = 120
			get_node("/root").call_deferred("add_child", new_card)
			var rand_card = get_random_card(deck, is_player)
			var card_payload = get_card_payload(rand_card)
			card_payload[ID] = get_card_id()
			new_card.map_card(card_payload)
			set_card_img(new_card, card_payload)
			# update_display_card(new_card, card_payload)
			# enm_card_detail_list.append(rand_card)
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
			var time = .05
			get_node("/root").add_child(timer)
			timer.set_wait_time(time)
			timer.set_one_shot(true)
			timer.start()
			yield(timer, "timeout")
			timer.queue_free()
			handle_cards_in_display()
		
		var timer = Timer.new()
		var time = .25
		get_node("/root").add_child(timer)
		timer.set_wait_time(time)
		timer.set_one_shot(true)
		timer.start()
		yield(timer, "timeout")
		timer.queue_free()
		for i in range(len(enm_hand)):
			var play_timer = Timer.new()
			var play_time = .2
			get_node("/root").add_child(play_timer)
			play_timer.set_wait_time(play_time)
			play_timer.set_one_shot(true)
			play_timer.start()
			yield(play_timer, "timeout")
			play_timer.queue_free()
			play_card(enm_hand, i, false)
		handle_cards_in_display()


func get_card_id():
	randomize()
	return str(stepify(rand_range(-4, 4) + rand_range(-4, 4), 0.022))


func get_random_card(deck, is_player):
	randomize()
	if len(deck) <= 0:
		print("deck swap")
		if is_player:
			deck = player_discard
		else:
			deck = enemy_discard
	var rand_idx = round(rand_range(0, len(deck) - 1))
	var choice = deck[rand_idx]
	print("deck before: " +str(len(deck)))
	deck.remove(rand_idx)
	print("deck after: " +str(len(deck)))
	return choice


func get_card_payload(card):
	var card_payload = {CARD_TYPE: card[CARD_TYPE]}
	#### Upper card section details
	if RARITY in card:
		card_payload[RARITY] = card[RARITY]
	if FOOD in card:
		card_payload[FOOD] = card[FOOD]
	if WATER in card:
		card_payload[WATER] = card[WATER]
	if CARD_WAIT_TIME in card:
		card_payload[CARD_WAIT_TIME] = card[CARD_WAIT_TIME]
	if CARD_ACTION in card:
		card_payload[CARD_ACTION] = card[CARD_ACTION]
	if CARD_BIOME in card:
		card_payload[CARD_BIOME] = card[CARD_BIOME]
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
	if FOOD in card:
		card_payload[FOOD] = card[FOOD]
	if ABILITY_RANGE in card:
		card_payload[ABILITY_RANGE] = card[ABILITY_RANGE]
	if SHIELD in card:
		card_payload[SHIELD] = card[SHIELD]
	if HUNGER_PRODUCTION in card:
		card_payload[HUNGER_PRODUCTION] = card[HUNGER_PRODUCTION]
	if WATER_PRODUCTION in card:
		card_payload[WATER_PRODUCTION] = card[WATER_PRODUCTION]
	if WATER in card:
		card_payload[WATER] = card[WATER]
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
	if ALLIES in card:
		card_payload[ALLIES] = card[ALLIES]
	if SELF in card:
		card_payload[SELF] = card[SELF]
	if IMG_PATH in card:
		card_payload[IMG_PATH] = card[IMG_PATH]

	if ID in card:
		card_payload[ID] = card[ID]
	if TAGS in card:
		card_payload[TAGS] = card[TAGS]
	return card_payload


func handle_cards_in_display():
	if not get_node("/root").has_node("level"):
		print("no level??")
		return
	var level = get_node("/root/level")
	var x = 0
	var y = 0
	var idx = 0
	var x_buffer = 80
	var y_buffer = 200
	for card in level.player_chassis_list:
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
		var node_ref = level.get_node("tableau_container/legs").global_position
		level.player_leg_list[idx].position = Vector2(node_ref.x + (x_buffer * x), node_ref.y + (y_buffer * y))
		idx += 1
		x += 1
	y = 0
	x = 0
	idx = 0

	for card in level.player_right_arm_list:
		var node_ref = level.get_node("tableau_container/right_arm").global_position
		level.player_right_arm_list[idx].position = Vector2(node_ref.x + (x_buffer * x), node_ref.y + (y_buffer * y))
		idx += 1
		x += 1
		if idx % 4 == 0:
			y += 1
			
	y = 0
	x = 0
	idx = 0

	for card in level.player_left_arm_list:
		var node_ref = level.get_node("tableau_container/left_arm").global_position
		level.player_left_arm_list[idx].position = Vector2(node_ref.x + (x_buffer * x), node_ref.y + (y_buffer * y))
		idx += 1
		x += 1
		if idx % 4 == 0:
			y += 1


	#####
	#
	###  Enemy
	#
	#####
	y = 0
	x = 0
	idx = 0
	for card in level.enemy_chassis_list:
		var node_ref = level.get_node("enemy_tableau_container/chassis").global_position
		level.enemy_chassis_list[idx].position = node_ref
		level.enemy_chassis_list[idx].position.x += x_buffer * x
		level.enemy_chassis_list[idx].position.y += y_buffer * y
		idx += 1
		x += 1
		if x % 4 == 0:
			x = 0
			y += 1

	y = 0
	x = 0
	idx = 0

	for card in level.enemy_leg_list:
		var node_ref = level.get_node("enemy_tableau_container/legs").global_position
		level.enemy_leg_list[idx].position = Vector2(node_ref.x + (x_buffer * x), node_ref.y + (y_buffer * y))
		idx += 1
		x += 1
	y = 0
	x = 0
	idx = 0

	for card in level.enemy_right_arm_list:
		var node_ref = level.get_node("enemy_tableau_container/right_arm").global_position
		level.enemy_right_arm_list[idx].position = Vector2(node_ref.x + (x_buffer * x), node_ref.y + (y_buffer * y))
		idx += 1
		x +=1
		if idx % 4 == 0:
			y += 1
	y = 0
	x = 0
	idx = 0

	for card in level.enemy_left_arm_list:
		var node_ref = level.get_node("enemy_tableau_container/left_arm").global_position
		level.enemy_left_arm_list[idx].position = Vector2(node_ref.x + (x_buffer * x), node_ref.y + (y_buffer * y))
		idx += 1
		x +=1
		if idx % 4 == 0:
			y += 1


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
		hand = []
	else:
		for card in enm_hand:
			if card and main.checkIfNodeDeleted(card) == false:
				card.visible = false
				card.queue_free()
		enm_hand = []

		
##### AI/ENM:
#
#
#


func set_enm_deck():
	pass

func draw_cards():
	pass
