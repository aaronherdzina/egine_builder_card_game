extends Node

signal card_action_signal

var hand = []
var enm_hand = []
const STANDARD_CARD_SCALE = Vector2(.6, .6)
const STANDARD_DISPLAY_CARD_SCALE = Vector2(.4, .4)
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
var starting_food = 5
var starting_water = 5
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

const ADAMS_SINGLE_LOAD = "adams single load"
const ADAMS_SINGLE_LOAD_ABILITY = "adams_single_load"

var card_adams_single_load = {
	TITLE: ADAMS_SINGLE_LOAD,
	RARITY: 1,
	CARD_TYPE: WEAPON_CARD,
	CARD_BIOME: FOREST,
	WEAPON_TYPE: HEAVY,
	WEAPON_DAMAGE_TYPE: FIRE + "_" + DAMAGE,
	HUNGER_PRODUCTION: 1,
	WATER_PRODUCTION: 1,
	IMG_PATH: main.HAND_GUN,
	CARD_WAIT_TIME: 1.5,
	CARD_ACTION: ADAMS_SINGLE_LOAD_ABILITY,
	RECYCLE_ACTION: "",
	DESCRIPTION: "",
	TAGS: [FIRE, FOREST, IMPACT]
}

const INFILTRATOR = "infiltrator"
const INFILTRATOR_ABILITY = "infiltrator_ability"
var card_infiltrator = {
	TITLE: INFILTRATOR,
	RARITY: 1,
	CARD_TYPE: WEAPON_CARD,
	CARD_BIOME: COASTAL,
	WEAPON_TYPE: LIGHT,
	WEAPON_DAMAGE_TYPE: WATER + "_" + DAMAGE,
	ATTACKS: 1,
	DAMAGE: 10,
	HUNGER_PRODUCTION: 2,
	WATER_PRODUCTION: 5,
	IMG_PATH: main.INFILTRATOR,
	CARD_WAIT_TIME: 1.25,
	CARD_ACTION: INFILTRATOR_ABILITY,
	RECYCLE_ACTION: "",
	DESCRIPTION: "10% chance to remove the frist card from opponent deck",
	TAGS: [BLADE, COASTAL]
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
	ATTACKS: 1,
	DAMAGE: 30,
	HUNGER_PRODUCTION: 8,
	WATER_PRODUCTION: 2,
	IMG_PATH: main.ELEPHANT_OUTLINE,
	CARD_WAIT_TIME: 3,
	CARD_ACTION: TOWERING_ELEPHANT_ABILITY_1,
	RECYCLE_ACTION: "",
	DESCRIPTION: "Additional damage equal to [DAMAGE] * total [IMPACT] cards attached",
	TAGS: [IMPACT, SAVANNAH]
}

const FLYING_CUTLASS = "flying cutlass"
const FLYING_CUTLASS_ABILITY = "flying_cutlass_ability"
var card_flying_cutlass = {
	TITLE: FLYING_CUTLASS,
	RARITY: 1,
	CARD_TYPE: WEAPON_CARD,
	CARD_BIOME: RIVERLANDS,
	WEAPON_TYPE: MEDIUM,
	WEAPON_DAMAGE_TYPE: POISON + "_" + DAMAGE,
	ATTACKS: 2,
	DAMAGE: 5,
	HUNGER_PRODUCTION: 2,
	WATER_PRODUCTION: 2,
	IMG_PATH: main.FLYING_CUTLASS,
	CARD_WAIT_TIME: 1,
	CARD_ACTION: FLYING_CUTLASS_ABILITY,
	RECYCLE_ACTION: "",
	DESCRIPTION: "",
	TAGS: [RIVERLANDS, POISON]
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
	CARD_ACTION: DEFAUlT_ACTION, # str name of func called elsewher
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
	IMG_PATH: main.MESSAGE_BOTTLE,
	DESCRIPTION: "Draw 2 cards",
	TAGS: [FOREST]
}

const LIGHT_CANNON = "light cannon"
var card_ability_light_cannon = {
	TITLE: LIGHT_CANNON,
	RARITY: 1,
	CARD_TYPE: ABILITY_CARD,
	HUNGER_PRODUCTION: 5,
	WATER_PRODUCTION: 0,
	ATTACKS: 4,
	DAMAGE: 5,
	CARD_BIOME: SAVANNAH,
	CARD_WAIT_TIME: 3,
	CARD_ACTION: DEFAUlT_ACTION, # str name of func called elsewher
	RECYCLE_ACTION: "",
	IMG_PATH: main.CANNON,
	DESCRIPTION: "",
	TAGS: [IMPACT, SAVANNAH]
}

const SAND_STORM = "sand storm"
var card_sand_storm = {
	TITLE: SAND_STORM,
	RARITY: 1,
	CARD_TYPE: CHASSIS_CARD,
	HUNGER_PRODUCTION: 2,
	WATER_PRODUCTION: 0,
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
	RARITY: 1,
	CARD_TYPE: ABILITY_CARD,
	HUNGER_PRODUCTION: 2,
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
	HUNGER_PRODUCTION: 3,
	WATER_PRODUCTION: 3,
	HEALTH: 25,
	CARD_BIOME: FOREST,
	CARD_WAIT_TIME: .5,
	CARD_ACTION: GROWTH, # str name of func called elsewher
	RECYCLE_ACTION: "",
	IMG_PATH: main.BEAR_LIKE,
	DESCRIPTION: "",
	TAGS: [HEALTH, FOREST]
}


const QUICK_FIX = "quick fix"
var card_ability_quick_fix= {
	TITLE: QUICK_FIX,
	RARITY: 1,
	CARD_TYPE: ABILITY_CARD,
	HUNGER_PRODUCTION: 1,
	WATER_PRODUCTION: 5,
	DEFENSE: 5,
	CARD_BIOME: COASTAL,
	CARD_WAIT_TIME: .5,
	CARD_ACTION: DEFAUlT_ACTION, # str name of func called elsewher
	RECYCLE_ACTION: "",
	IMG_PATH: main.PIRANHA,
	DESCRIPTION: "",
	TAGS: [DEFENSE, FOREST]
}


const QUICK_SAND = "quick sand"
var card_quick_sand = {
	TITLE: QUICK_SAND,
	RARITY: 1,
	CARD_TYPE: CHASSIS_CARD,
	HUNGER_PRODUCTION: 2,
	WATER_PRODUCTION: 2,
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
const DEFAUlT_ACTION = "default_action"
const POISONOUS_AMPIBIANS = "poisonous amphibians"
var card_ability_poisonous_amphibians = {
	TITLE: POISONOUS_AMPIBIANS,
	RARITY: 1,
	CARD_TYPE: ABILITY_CARD,
	CARD_BIOME: RIVERLANDS,
	HUNGER_PRODUCTION: 2,
	WATER_PRODUCTION: 5,
	ATTACKS: 1,
	DAMAGE: 10,
	CARD_WAIT_TIME: 1,
	CARD_ACTION: DEFAUlT_ACTION,
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
	HUNGER_PRODUCTION: 1,
	WATER_PRODUCTION: 0,
	ATTACKS: 1,
	DAMAGE: 3,
	CARD_WAIT_TIME: 1,
	RECYCLE_ACTION: "",
	CARD_ACTION: DEFAUlT_ACTION,
	IMG_PATH: false,
	DESCRIPTION: "Needs little to survive",
	TAGS: [SAVANNAH]
}

const DOUBLE_CANNON = "double cannon"
var card_ability_grizzly_strike = {
	TITLE: DOUBLE_CANNON,
	RARITY: 1,
	CARD_TYPE: WEAPON_CARD,
	CARD_BIOME: FOREST,
	HUNGER_PRODUCTION: 5,
	WATER_PRODUCTION: 2,
	ATTACKS: 2,
	DAMAGE: 20,
	CARD_WAIT_TIME: 1,
	RECYCLE_ACTION: "",
	CARD_ACTION: DEFAUlT_ACTION,
	IMG_PATH: main.DOUBLE_CANNON,
	DESCRIPTION: " ",
	TAGS: [FOREST]
}



const SHORELINE_PIRANHA  = "shorline piranha"
var card_ability_shoreline_piranha= {
	TITLE: SHORELINE_PIRANHA,
	RARITY: 1,
	CARD_TYPE: ABILITY_CARD,
	CARD_BIOME: COASTAL,
	HUNGER_PRODUCTION: 2,
	WATER_PRODUCTION: 5,
	ATTACKS: 1,
	HEALTH: 15,
	DAMAGE: 15,
	CARD_WAIT_TIME: 1,
	RECYCLE_ACTION: "",
	CARD_ACTION: DEFAUlT_ACTION,
	IMG_PATH: main.PIRANHA,
	DESCRIPTION: " ",
	TAGS: [COASTAL, WATER]
}


const AUTONOMOUS_REPAIS = "autonomous repairs"
var card_ability_autonomous_repairs = {
	TITLE: AUTONOMOUS_REPAIS,
	RARITY: 1,
	CARD_TYPE: CHASSIS_CARD,
	CARD_BIOME: COASTAL,
	HUNGER_PRODUCTION: 10,
	WATER_PRODUCTION: 5,
	DEFENSE: 15,
	HEALTH: 2,
	CARD_WAIT_TIME: .15,
	CARD_ACTION: DEFAUlT_ACTION, # str name of func called elsewher
	RECYCLE_ACTION: "",
	IMG_PATH: main.SQUID_WINDOW_FIX,
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
	HUNGER_PRODUCTION: 5,
	WATER_PRODUCTION: 5,
	CARD_WAIT_TIME: .5,
	CARD_ACTION: GAIN_START_DRAW_1, # str name of func called elsewher
	RECYCLE_ACTION: "",
	IMG_PATH: main.PIRANHA,
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
	WATER_PRODUCTION: 2,
	HUNGER_PRODUCTION: 0,
	HEALTH: 5,
	CARD_WAIT_TIME: .35,
	CARD_ACTION: FORAGERS_1, # str name of func called elsewher
	RECYCLE_ACTION: "",
	IMG_PATH: main.SMALL_FOOD_STOCK,
	DESCRIPTION: "+ 1 Health and + 5 Food",
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
	WATER_PRODUCTION: 4,
	CARD_WAIT_TIME: .5,
	CARD_ACTION: WASTE_REDUCTION_1, # str name of func called elsewher
	RECYCLE_ACTION: "",
	IMG_PATH: false,
	DESCRIPTION: "+ 1 Food, for every [HUNGER] card you own in battle",
	TAGS: [HUNGER, SAVANNAH]
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
const RATIONS = "rations"
const RATIONS_ABILITY_1 = "ration_ability_1"
var card_rations = {
	TITLE: RATIONS,
	RARITY: 1,
	CARD_TYPE: ABILITY_CARD,
	CARD_BIOME: " ",
	FOOD_PRODUCTION: 8,
	HUNGER_PRODUCTION: 0,
	WATER_PRODUCTION: 0,
	WATER: 8,
	CARD_WAIT_TIME: .5,
	CARD_ACTION: RATIONS_ABILITY_1, # str name of func called elsewher
	RECYCLE_ACTION: "",
	IMG_PATH: main.RATIONS,
	DESCRIPTION: "+ 8 Food and Water",
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
	FOOD_PRODUCTION: 5,
	WATER: 5,
	CARD_ACTION: OVEREXTENDED_1, # str name of func called elsewher
	RECYCLE_ACTION: "",
	IMG_PATH: false,
	DESCRIPTION: "Take 10 damage get 5 Food and Water",
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
	HUNGER_PRODUCTION: 3,
	WATER_PRODUCTION: 0,
	WATER: 5,
	WATER_PRODUCTION: 0,
	CARD_ACTION: PRESTINE_WATERS_ABILITY, # str name of func called elsewher
	RECYCLE_ACTION: "",
	IMG_PATH: main.FOOD_STOCK,
	DESCRIPTION: "+ 2 Health and Food per Water card + 5 Water",
	TAGS: [WATER, HEALTH, FOOD]
}
var riverlands_deck = [card_rations, card_rations, card_rations, card_rations,
					  card_fresh_stream, card_fresh_stream, card_fresh_stream,
					  card_flying_cutlass, card_flying_cutlass, card_flying_cutlass,
					  card_ability_sudden_rain, card_ability_sudden_rain, card_ability_sudden_rain,
					  card_quick_sand, card_quick_sand, card_quick_sand,
					  card_quick_sand, card_fresh_stream, card_ability_sudden_rain,
					  card_ability_poisonous_amphibians, card_ability_poisonous_amphibians, card_ability_poisonous_amphibians
					]

var savannha_deck = [card_rations, card_rations, card_rations, card_rations,
					card_vultures, card_vultures, card_vultures,
					card_ability_light_cannon, card_sand_storm, card_waste_reduction,
					card_towering_elephant, card_towering_elephant, card_towering_elephant,
					card_waste_reduction, card_waste_reduction, card_waste_reduction,
					card_sand_storm, card_sand_storm, card_sand_storm,
					card_ability_light_cannon, card_ability_light_cannon, card_ability_light_cannon
					]

var forest_deck = [card_rations, card_rations, card_rations, card_rations, card_ability_quick_fix,
				  card_ability_quick_fix, card_ability_quick_fix, card_ability_quick_fix,
				  card_ability_grizzly_strike, card_ability_grizzly_strike,
				  card_foragers_1, card_foragers_1, card_foragers_1,
				  card_ability_growth, card_ability_growth, card_ability_growth,
				  card_adams_single_load, card_adams_single_load, card_adams_single_load,
				  card_ability_grizzly_strike, card_ability_growth, card_foragers_1]
			
var coastal_deck = [card_rations, card_rations, card_rations, card_rations,
				   card_infiltrator, card_infiltrator, card_infiltrator,
				   card_ability_shoreline_piranha,
				   card_ability_autonomous_repairs, card_ability_autonomous_repairs, card_ability_autonomous_repairs,
				   card_ability_shoreline_piranha, card_ability_shoreline_piranha, card_ability_shoreline_piranha,
				   card_chassis_call_reinforcments, card_chassis_call_reinforcments, card_chassis_call_reinforcments]

var all_decks = [riverlands_deck, forest_deck, coastal_deck, savannha_deck]

var hand_idx = 0
var tableau_idx = 0
var current_card_menu = "hand"
var card_expanded = false

var enm_hand_idx = 0
var enm_tableau_idx = 0
var player_display_turn = true
var waiting = false



var card_costs = {
	# cost is per value
	# Example a card's DAMAGE is 5, if DAMAGE cost is 5, cost added is 20 (5 * 4)
	DAMAGE: 1.2,
	ATTACKS: 1,
	DEFENSE: 1,
	TOUGHNESS: 1.2,
	HEALTH: 1,
	FOOD_PRODUCTION: 2,
	WATER: 2,
	"ability_mod": .6,
	"combat_mod": .55,
	"standard_mod": .5,
	"bracket_1": 10, # up to this amount
	"bracket_2": 20, # up to this amount, more than previous
	"bracket_3": 30, # up to this amount, more than previous
	"bracket_4": 40, # up to this amount (or higher if max), more than previous
}

var performing_actions = false


func create_card_cost(card):
	# example: [WATER, 10] cost is 10 water
	# example: [HUNGER, WATER, 10] cost is 10 hunger and 10 water
	var rarity = card.rarity # 1 normal, .9 uncommon, .7 rare, ect
	var cost = []
	var cost_value = 0
	var food_cost = card.hunger_production
	var water_cost = card.water_production
	var min_val = 1
	if card.damage > 0:
		cost_value += int((card.damage+min_val) * card_costs[DAMAGE])
	if card.attacks > 0:
		cost_value += int((card.attacks+min_val) * card_costs[ATTACKS])
	if card.defense > 0:
		cost_value += int((card.defense+min_val) * card_costs[DEFENSE])
	if card.toughness > 0:
		cost_value += int((card.toughness+min_val) * card_costs[TOUGHNESS])
	if card.health > 0:
		cost_value += int((card.health+min_val) * card_costs[HEALTH])
	if card.food_production > 0:
		cost_value += int((card.food_production+min_val) * card_costs[FOOD_PRODUCTION])
	if card.water > 0:
		cost_value += int((card.water+min_val) * card_costs[WATER])

	#print("card " + str(card.title) + " cost before type mod: " + str(cost_value))
	if card.card_type == Cards.ABILITY_CARD:
		cost_value = floor(cost_value * card_costs["ability_mod"])
	elif card.card_type == Cards.WEAPON_CARD:
		cost_value = floor(cost_value * card_costs["combat_mod"])
	else:
		cost_value = floor(cost_value * card_costs["standard_mod"])
	#print("card " + str(card.title) + " after type mod and cost before rarity: " + str(cost_value))
	cost_value = floor(cost_value * rarity)
	#print("card cost after rarity: " + str(cost_value))
	"""
	if cost_value > 0:
		if card.card_biome == Cards.RIVERLANDS:
			food_cost += floor(cost_value * meta.riverlands_area.food_bias)
			water_cost += floor(cost_value * meta.riverlands_area.water_bias)
		elif card.card_biome == Cards.FOREST:
			food_cost += floor(cost_value * meta.forest_area.food_bias)
			water_cost += floor(cost_value * meta.forest_area.water_bias)
		elif card.card_biome == Cards.COASTAL:
			food_cost += floor(cost_value * meta.coastal_area.food_bias)
			water_cost += floor(cost_value * meta.coastal_area.water_bias)
		elif card.card_biome == Cards.SAVANNAH:
			food_cost += floor(cost_value * meta.savannah_area.food_bias)
			water_cost += floor(cost_value * meta.savannah_area.water_bias)
	var cost_step_size = 2
	if food_cost > 0:
		if food_cost <= card_costs["bracket_1"]:
			food_cost = stepify(food_cost, cost_step_size)
		if food_cost <= card_costs["bracket_2"]:
			food_cost = stepify(food_cost, cost_step_size)
		if food_cost <= card_costs["bracket_3"]:
			food_cost = stepify(food_cost, cost_step_size)
		if food_cost > card_costs["bracket_3"]: # grater than 3 is bracket 4 or higher
			food_cost = stepify(food_cost, cost_step_size)
	if water_cost > 0:
		if water_cost <= card_costs["bracket_1"]:
			water_cost = stepify(water_cost, cost_step_size)
		if water_cost <= card_costs["bracket_2"]:
			water_cost = stepify(water_cost, cost_step_size)
		if water_cost <= card_costs["bracket_3"]:
			water_cost = stepify(water_cost, cost_step_size)
		if water_cost > card_costs["bracket_3"]: # grater than 3 is bracket 4 or higher
			water_cost = stepify(water_cost, cost_step_size)
	"""
	# create arbitrary costs for each aspect of card..
	# for example: each 5 DMG = 5 cost, * ATK
	# card of dmg 10 and atk 2 has base cost of 20 food or water
	

	#print("card " + str(card.title) + " after rarity: " + str(cost_value) + " water_cost: " + str(water_cost)
	#		+ " water: " + str(water_cost))
	return {
			"food_cost": floor(cost_value * .7),
			"water_cost": 0,
			"cost_value": floor(cost_value *.7),
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
									level.expand_card_details(played_card)
									played_card.get_node("AnimationPlayer").stop()
									played_card.get_node("AnimationPlayer").play("flicker")
									yield(get_tree().create_timer(wait_time), "timeout")
								value_count += velocity
								if only_tally:
									pass
				elif place == "front":
					for played_card in level.player_right_arm_list:
						for tag in played_card.tags:
							if tag == desired_tag:
								if animate:
									level.expand_card_details(played_card)
									played_card.get_node("AnimationPlayer").stop()
									played_card.get_node("AnimationPlayer").play("flicker")
									yield(get_tree().create_timer(wait_time), "timeout")
								value_count += velocity
								if only_tally:
									pass
				elif place == "back":
					for played_card in level.player_left_arm_list:
						for tag in played_card.tags:
							if tag == desired_tag:
								if animate:
									level.expand_card_details(played_card)
									played_card.get_node("AnimationPlayer").stop()
									played_card.get_node("AnimationPlayer").play("flicker")
									yield(get_tree().create_timer(wait_time), "timeout")
								value_count += velocity
								if only_tally:
									pass
				elif place == "backup":
					for played_card in level.player_leg_list:
						for tag in played_card.tags:
							if tag == desired_tag:
								if animate:
									level.expand_card_details(played_card)
									played_card.get_node("AnimationPlayer").stop()
									played_card.get_node("AnimationPlayer").play("flicker")
									yield(get_tree().create_timer(wait_time), "timeout")
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
									level.expand_card_details(played_card)
									played_card.get_node("AnimationPlayer").stop()
									played_card.get_node("AnimationPlayer").play("flicker")
									yield(get_tree().create_timer(wait_time), "timeout")
								value_count += velocity
								if only_tally:
									pass
				elif place == "front":
					for played_card in level.enemy_right_arm_list:
						for tag in played_card.tags:
							if tag == desired_tag:
								if animate:
									level.expand_card_details(played_card)
									played_card.get_node("AnimationPlayer").stop()
									played_card.get_node("AnimationPlayer").play("flicker")
									yield(get_tree().create_timer(wait_time), "timeout")
								value_count += velocity
								if only_tally:
									pass
				elif place == "back":
					for played_card in level.enemy_left_arm_list:
						for tag in played_card.tags:
							if tag == desired_tag:
								if animate:
									level.expand_card_details(played_card)
									played_card.get_node("AnimationPlayer").stop()
									played_card.get_node("AnimationPlayer").play("flicker")
									yield(get_tree().create_timer(wait_time), "timeout")
								value_count += velocity
								if only_tally:
									pass
				elif place == "backup":
					for played_card in level.enemy_leg_list:
						for tag in played_card.tags:
							if tag == desired_tag:
								if animate:
									level.expand_card_details(played_card)
									played_card.get_node("AnimationPlayer").stop()
									played_card.get_node("AnimationPlayer").play("flicker")
									yield(get_tree().create_timer(wait_time), "timeout")
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

func process_status_effects(is_player):
	if is_player:
		if meta.player_bleeding:
			process_damage(is_player, 1, meta.player_current_bleed_dmg, null)
		elif meta.player_burning:
			process_damage(is_player, 1, meta.player_current_burn_dmg, null)
	else:
		if meta.enemy_bleeding:
			process_damage(is_player, 1, meta.enemy_current_bleed_dmg, null)
		elif meta.enemy_burning:
			process_damage(is_player, 1, meta.enemy_current_burn_dmg, null)

func process_damage(is_player, atks, dmg, card=null, action_str=""):
	if is_player:
		### Process Defense
		var remaining_defense = (meta.enemy_defense - dmg)
		if remaining_defense > 0:
			meta.enemy_defense = remaining_defense
		else:
			meta.enemy_defense = 0
		dmg -= meta.enemy_defense
		##
		### Process Toughness
		var remaining_toughness = (meta.enemy_toughness - dmg)
		if remaining_toughness > 0:
			meta.enemy_toughness = remaining_toughness
		else:
			meta.enemy_toughness = 0
		dmg -= meta.enemy_toughness
		##
		## Deal Remaining DMG
		if dmg > 0:
			meta.enemy_health -= dmg
			apply_text_effect("hurt", "- " + str(dmg), (is_player == false)) #TEXT_EFECT
	else:
		### Process Defense
		var remaining_defense = (meta.player_defense - dmg)
		if remaining_defense > 0:
			meta.player_defense = remaining_defense
		else:
			meta.player_defense = 0
		dmg -= meta.player_defense
		##
		### Process Toughness
		var remaining_toughness = (meta.player_toughness - dmg)
		if remaining_toughness > 0:
			meta.player_toughness = remaining_toughness
		else:
			meta.player_toughness = 0
		dmg -= meta.player_toughness
		##
		## Deal Remaining DMG
		if dmg > 0:
			meta.player_health -= dmg
			apply_text_effect("hurt", "- " + str(dmg), (is_player == false)) #TEXT_EFECT


func take_turn(is_player=true):
	# Essentially main controller method, invoked with player input or after enmy turn (wait)
	if get_node("/root").has_node("level"):
		var level = get_node("/root/level")
		level.reset_display_cards()
		if not waiting:
			if meta.player_health <= 0 or meta.enemy_health <= 0:
				waiting = true
				level.start_level()
				yield(get_tree().create_timer(3.0), "timeout")
				print("new game started, player deck is now: " + str(level.hand))
				waiting = false
				call_deferred("take_turn", meta.player_turn)
				return
				
		give_area_biome_bonus(is_player)
		level.update_text_overlays()
		
		if is_player and not waiting:
			waiting = true
			current_card_menu = "hand"
			level.get_node("background_imgs/alert").modulate = Color(.2, .2, 1, 1)
			if meta.player_hand_limit > meta.player_hand_limit_max:
				meta.player_hand_limit = meta.player_hand_limit_max
				
			call_deferred("spawn_cards", meta.player_hand_limit, is_player, meta.current_player_deck)
			if meta.player_hand_limit > meta.player_hand_limit_default:
				meta.player_hand_limit = meta.player_hand_limit_default
			meta.player_turn = false
			hand_idx = 0
			if len(level.hand) > 0:
				level.expand_card_details(level.hand[hand_idx])
			level.get_node("background_imgs/alert").modulate = Color(1, 1, 1, 1)
			level.update_text_overlays()
			waiting = false
		elif not waiting:
			if not waiting:
				if meta.player_health <= 0 or meta.enemy_health <= 0:
					waiting = true
					level.start_level()
					yield(get_tree().create_timer(3.0), "timeout")
					waiting = false
					call_deferred("take_turn", meta.player_turn)
					return
			waiting = true
			level.get_node("background_imgs/alert").modulate = Color(1, .2, .2, 1)
			print("\nstart play_all_display_card_actions\n")
			play_all_display_card_actions(true)
			var break_time = 15
			while performing_actions:
				print("waiting for actions player\n\n")
				if break_time <= 0:
					break
				yield(get_tree().create_timer(1.0), "timeout")
				break_time-= 1
			level.remove_all_cards_in_hand(true)
			var time = round(int(len(level.player_chassis_list) + len(level.player_right_arm_list)\
					 + len(level.player_left_arm_list)) * .25) + 1
			yield(get_tree().create_timer(time), "timeout")
			pay_card_upkeep(level, true)
			var time2 = round(int(len(level.player_chassis_list) + len(level.player_right_arm_list)\
					 + len(level.player_left_arm_list)) * .25) + 1
			yield(get_tree().create_timer(time2), "timeout")
			# spawn and play for enm
			call_deferred("spawn_cards", 4, is_player, meta.current_enemy_deck)
			
			yield(get_tree().create_timer(1.0), "timeout")
			level.update_text_overlays()
			play_all_display_card_actions(false)
			
			break_time = 15
			while performing_actions:
				print("waiting for actions enm\n\n")
				if break_time <= 0:
					break
				yield(get_tree().create_timer(1.0), "timeout")
				break_time-= 1
			pay_card_upkeep(level, false)

			var time3 = floor(len(level.enemy_chassis_list) + len(level.enemy_right_arm_list)\
					 + len(level.enemy_left_arm_list) * 2) + 1.25
			level.get_node("background_imgs/alert").modulate = Color(1, 1, 1, 1)
			yield(get_tree().create_timer(time3), "timeout")
			level.remove_all_cards_in_hand(false)
			meta.player_turn = true
			level.update_text_overlays()
			waiting = false
			call_deferred("take_turn", meta.player_turn)
		level.reset_display_card_sizes()


func discard_hands_resource(is_player=true):
	return
	if get_node("/root").has_node("level"):
		var level = get_node("/root/level")
		if is_player:
			for card in level.hand:
				var card_for_discard = card.copy()
				level.player_discard.append(card_for_discard)
				card.get_node("AnimationPlayer").stop()
				card.get_node("AnimationPlayer").play("remove")
				if HUNGER_PRODUCTION in card and card[HUNGER_PRODUCTION] > 0:
					meta.player_food += int(card[HUNGER_PRODUCTION] * .25)
				if WATER_PRODUCTION in card and card[WATER_PRODUCTION] > 0:
					meta.player_water += int(card[WATER_PRODUCTION] * .25)
		else:
			for card in level.enm_hand:
				var card_for_discard = card.copy()
				level.enemy_discard.append(card_for_discard)
				card.get_node("AnimationPlayer").stop()
				card.get_node("AnimationPlayer").play("remove")
				if HUNGER_PRODUCTION in card and card[HUNGER_PRODUCTION] > 0:
					meta.enemy_food += int(card[HUNGER_PRODUCTION] * .25)
				if WATER_PRODUCTION in card and card[WATER_PRODUCTION] > 0:
					meta.enemy_water += int(card[WATER_PRODUCTION] * .25)
		level.update_text_overlays()



func play_all_display_card_actions(is_player=true):
	if get_node("/root").has_node("level"):
		var level = get_node("/root/level")
		if is_player and player_display_turn:
			level.update_text_overlays()
			level.get_node("background_imgs/alert").modulate = Color(.1, .1, .7, 1)
			for card in level.player_chassis_list:
				if card.selected_for_action_phase:
					var should_stop = card_action(card.card_action, is_player, "", card)
					var time = card.card_wait_time * 1.35
					yield(get_tree().create_timer(time), "timeout")
					level.update_text_overlays()

			for card in level.player_right_arm_list:
				if card.selected_for_action_phase:
					var should_stop = card_action(card.card_action, is_player, "", card)
					var time = card.card_wait_time * 1.35
					yield(get_tree().create_timer(time), "timeout")
					level.update_text_overlays()

			for card in level.player_left_arm_list:
				if card.selected_for_action_phase:
					var should_stop = card_action(card.card_action, is_player, "", card)
					var time = card.card_wait_time * 1.35
					yield(get_tree().create_timer(time), "timeout")
					level.update_text_overlays()

			for card in level.player_leg_list:
				if card.selected_for_action_phase:
					var should_stop = card_action(card.card_action, is_player, "", card)
					var time = card.card_wait_time * 1.35
					yield(get_tree().create_timer(time), "timeout")
					level.update_text_overlays()
				
			player_display_turn = false
		# end of player logic
		else:
			level.get_node("background_imgs/alert").modulate = Color(.7, .1, .1, 1)
			# Enemy:
			for card in level.enemy_chassis_list:
				if card.selected_for_action_phase:
					var should_stop = card_action(card.card_action, is_player, "", card)
					var time = card.card_wait_time * 1.35
					yield(get_tree().create_timer(time), "timeout")
					level.update_text_overlays()

			for card in level.enemy_right_arm_list:
				if card.selected_for_action_phase:
					var should_stop = card_action(card.card_action, is_player, "", card)
					var time = card.card_wait_time * 1.35
					yield(get_tree().create_timer(time), "timeout")
					level.update_text_overlays()

			for card in level.enemy_left_arm_list:
				if card.selected_for_action_phase:
					var should_stop = card_action(card.card_action, is_player, "", card)
					var time = card.card_wait_time * 1.35
					yield(get_tree().create_timer(time), "timeout")
					level.update_text_overlays()

			for card in level.enemy_leg_list:
				if card.selected_for_action_phase:
					var should_stop = card_action(card.card_action, is_player, "", card)
					var time = card.card_wait_time * 1.35
					yield(get_tree().create_timer(time), "timeout")
					level.update_text_overlays()
			player_display_turn = true
		level.update_text_overlays()
		yield(get_tree().create_timer(1), "timeout")


func apply_text_effect(text_type, text, is_player=true, card=null):
	# sTEXT_EFECT 
	if get_node("/root").has_node("level"):
		var level = get_node("/root/level")
		var hurt = "hurt"
		var hunger = "hunger"
		var water = "water"
		var normal = "normal"
		var healed = "healed"
		var burn = "burn"
		if text_type == hurt:
			var effect = main.TEXT_EFECT.instance()
			get_node("/root").add_child(effect)
			effect.get_node("anim_controller/text").set_text(str(text))
			if is_player:
				effect.position = level.get_node("text_cont/player_health_max_pos").global_position
			else:
				effect.position = level.get_node("text_cont/enemy_health_max_pos").global_position

			effect.get_node("anim").play(hurt)
		elif text_type == hunger:
			var effect = main.TEXT_EFECT.instance()
			get_node("/root").add_child(effect)
			effect.get_node("anim_controller/text").set_text(str(text))
			if is_player:
				effect.position = level.get_node("text_cont/player_hunger_pos").global_position
			else:
				effect.position = level.get_node("text_cont/enemy_hunger_pos").global_position

			effect.get_node("anim").play(hunger)
		elif text_type == water:
			var effect = main.TEXT_EFECT.instance()
			get_node("/root").add_child(effect)
			effect.get_node("anim_controller/text").set_text(str(text))
			if is_player:
				effect.position = level.get_node("text_cont/player_water_pos").global_position
			else:
				effect.position = level.get_node("text_cont/enemy_water_pos").global_position

			effect.get_node("anim").play(hunger)


func shuffle_card_into_deck(card, is_player):
	if is_player:
		meta.current_player_deck.append(card)
	else:
		meta.current_enemy_deck.append(card)


func pay_for_card(level, card, hunger, thirst, food, water, is_player=true):
	#print("start card cost: " + str(hunger) + " food: " + str(food) + " water: " + str(water))
	var stop_response = "cant afford"
	if is_player:
		#print("player food before: " + str(meta.player_food)\
		#	  + " food:" + str(food) + " water: " + str(water) + " pwater: " + str(meta.player_water) + " hunger: " + str(hunger) + " thirst: " + str(thirst))
		#print("water before: " + str(meta.player_water))

		var leftover_food = meta.player_food + food - hunger
		var leftover_water = meta.player_water + water - thirst
		if hunger >= 0:
			if leftover_food < 0:
				 # CAN'T PLAY CARD
				shuffle_card_into_deck(card_overextended_stock, true)
				#print("leftoverfood: " + str(leftover_food) + " is less than food cost: " + str(hunger))
				if meta.player_food < 0:
					meta.player_food = 0
				level.update_text_overlays()
				return stop_response
			else:
				meta.player_food = leftover_food
				apply_text_effect("hunger", "-"+str(hunger), is_player) #TEXT_EFECT
				card.get_node("anim_text").set_text("-"+ str(hunger))
				card.get_node("AnimationPlayer").play("spend")
				level.update_text_overlays()

		if thirst >= 0:
			if leftover_water < 0:
				 # CAN'T PLAY CARD
				shuffle_card_into_deck(card_overextended_stock, true)
				#print("leftoverwater: " + str(leftover_water) + " is less than water cost: " + str(thirst))
				
				if meta.player_water < 0:
					meta.player_water = 0
				level.update_text_overlays()
				return stop_response
			else:
				meta.player_water = leftover_water
				apply_text_effect("water", "-"+str(thirst), is_player) #TEXT_EFECT
				card.get_node("anim_text").set_text("-" + str(thirst))
				card.get_node("AnimationPlayer").play("spend")
				level.update_text_overlays()
		
		#print("player food after: " + str(meta.player_food))
		#print("water after: " + str(meta.player_water))
		
		if meta.player_water < 0:
			meta.player_water = 0
		if meta.player_food < 0:
			meta.player_food = 0
		level.update_text_overlays()
	else:
		#print("enm food before: " + str(meta.enemy_food))
		#print("water before: " + str(meta.enemy_water))
		var leftover_food = meta.enemy_food + food - hunger
		var leftover_water = meta.enemy_water + water - thirst
	
		if leftover_food < 0 and hunger > 0:
			 # CAN'T PLAY CARD
			shuffle_card_into_deck(card_overextended_stock, false)
			if meta.enemy_food < 0:
				meta.enemy_food = 0
			level.update_text_overlays()
			return stop_response
		elif leftover_food >= 0:
			meta.enemy_food = leftover_food
			apply_text_effect("hunger", "-"+str(hunger), is_player) #TEXT_EFECT
			card.get_node("anim_text").set_text("-" + str(food))
			card.get_node("AnimationPlayer").play("spend")
	
		if leftover_water < 0 and thirst > 0:
			 # CAN'T PLAY CARD
			if meta.enemy_water < 0:
				meta.enemy_water = 0
			shuffle_card_into_deck(card_overextended_stock, false)
			level.update_text_overlays()
			return stop_response
		elif leftover_water >= 0:
			meta.enemy_water = leftover_water
			apply_text_effect("water", "-"+str(thirst), is_player) #TEXT_EFECT
			card.get_node("anim_text").set_text("-W" + str(thirst))
			card.get_node("AnimationPlayer").play("spend")
		
		if meta.enemy_water < 0:
			meta.enemy_water = 0
		if meta.enemy_food < 0:
			meta.enemy_food = 0
		#print("enm food after: " + str(meta.enemy_food))
		#print("water after: " + str(meta.enemy_food))
	level.update_text_overlays()
	return "continue"


func pay_card_upkeep(level, is_player=true):
	var pay_time = .75
	yield(get_tree().create_timer(pay_time), "timeout")
	if  is_player:
		for card in level.player_chassis_list:
			if card and main.checkIfNodeDeleted(card) == false:
				pay_for_card(level, card, card.hunger_production,
							card.water_production, card.food, card.water, is_player)
				yield(get_tree().create_timer(pay_time), "timeout")
		for card in level.player_right_arm_list:
			if card and main.checkIfNodeDeleted(card) == false:
				pay_for_card(level, card, card.hunger_production,
							card.water_production, card.food, card.water, is_player)
				yield(get_tree().create_timer(pay_time), "timeout")
		for card in level.player_left_arm_list:
			if card and main.checkIfNodeDeleted(card) == false:
				pay_for_card(level, card, card.hunger_production,
							card.water_production, card.food, card.water, is_player)
				yield(get_tree().create_timer(pay_time), "timeout")
		for card in level.player_leg_list:
			if card and main.checkIfNodeDeleted(card) == false:
				pay_for_card(level, card, card.hunger_production,
							card.water_production, card.food, card.water, is_player)
				yield(get_tree().create_timer(pay_time), "timeout")
	else:
		for card in level.enemy_chassis_list:
			if card and main.checkIfNodeDeleted(card) == false:
				pay_for_card(level, card, card.hunger_production,
							card.water_production, card.food, card.water, is_player)
				yield(get_tree().create_timer(pay_time), "timeout")
		for card in level.enemy_right_arm_list:
			if card and main.checkIfNodeDeleted(card) == false:
				pay_for_card(level, card, card.hunger_production,
							card.water_production, card.food, card.water, is_player)
				yield(get_tree().create_timer(pay_time), "timeout")
		for card in level.enemy_left_arm_list:
			if card and main.checkIfNodeDeleted(card) == false:
				pay_for_card(level, card, card.hunger_production,
							card.water_production, card.food, card.water, is_player)
				yield(get_tree().create_timer(pay_time), "timeout")
		for card in level.enemy_leg_list:
			if card and main.checkIfNodeDeleted(card) == false:
				pay_for_card(level, card, card.hunger_production,
							card.water_production, card.food, card.water, is_player)
				yield(get_tree().create_timer(pay_time), "timeout")


var ACTION_EFFECT_COLOR = Color(.7, .7, 1, 1)
var ACTION_USER_COLOR = Color(1, 1, .7, 1)
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
		if performing_actions:
			performing_actions = false
		return stop_response
	performing_actions = true
	if get_node("/root").has_node("level"):
		var level = get_node("/root/level")
		var action_time = .5
		level.expand_card_details(card)
		card.get_node("AnimationPlayer").stop()
		## 1 #############################################################
		## Get info from played cards (may be changed)
		print("in card_action: " + act_str + " " + card.title)
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
		var dmg = (card.damage + bonus_dmg) * atks

		var health = card.health + bonus_health
		var toughnes = card.toughness + bonus_toughness
		var defense = card.defense + bonus_def

		var total_dmg = round(atks * dmg)

		var action_sub_time = (action_time*.15)
		var action_sub_shake_vel = 2

		# 2 ###################################################################
		# make sure there is enough food and water to play card
		level.update_text_overlays()
		
		card.get_node("AnimationPlayer").play("activate general")
		### 3 #############################################################
		### PROCESS ATKS/DAMAGE
		if dmg > 0 and atks == 0:
			atks = 1
		if atks > 0:
			if dmg > 0:
				var dmg_dealt = process_damage(is_player, atks, dmg, card, act_str)
				if dmg_dealt > 0:
					main.cameraShake(action_sub_shake_vel, action_sub_time)
				
				yield(get_tree().create_timer(action_sub_time), "timeout")
		
		yield(get_tree().create_timer(action_sub_time), "timeout")
		level.update_text_overlays()
		# 4 ###############################################################
		### Process Actions, each action's logic should be WHOLEY contained
		### in condition including seperate enm logic for readablility &..
		### .. consistent dev expectations
		if act_str == INFILTRATOR_ABILITY and not "stop_" in avoid_recursion_str:
			randomize()
			if rand_range(0, 1) >= .9:
				if is_player:
					for index in range(0, len(level.enemy_chassis_list)):
						if level.enemy_chassis_list[index] and main.checkIfNodeDeleted(level.enemy_chassis_list[index]) == false:
							level.enemy_chassis_list[index].get_node("AnimationPlayer").play("remove")
							level.enemy_chassis_list.remove(index)
							break
				else:
					for index in range(0, len(level.player_chassis_list)):
						if level.player_chassis_list[index] and main.checkIfNodeDeleted(level.player_chassis_list[index]) == false:
							level.player_chassis_list[index].get_node("AnimationPlayer").play("remove")
							level.player_chassis_list.remove(index)
							break
		elif act_str == OVEREXTENDED_1 and not "stop_" in avoid_recursion_str:
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
		elif act_str ==  ADAMS_SINGLE_LOAD_ABILITY and not "stop_" in avoid_recursion_str:
			var skill_impact_count = collect_tag_values_in_play(null, is_player, ["main", "front", "back", "backup"], IMPACT, false)
			if is_player:
				var final_impact_dmg = int(skill_impact_count * 2)
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
						apply_text_effect("hurt", "- " + str(final_impact_dmg), is_player) #TEXT_EFECT
			else:
				var final_impact_dmg = int(skill_impact_count * 2)
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
						apply_text_effect("hurt", "- " + str(final_impact_dmg), is_player) #TEXT_EFECT

		elif act_str == PRESTINE_WATERS_ABILITY and not "stop_" in avoid_recursion_str:
			if is_player: # WASTE_REDUCTION_1
				for chassis_card in level.player_right_arm_list:
					for tag in chassis_card.tags:
						if tag == WATER:
							main.cameraShake(action_sub_shake_vel, action_sub_time)
							level.expand_card_details(chassis_card)
							chassis_card.get_node("AnimationPlayer").stop()
							chassis_card.get_node("AnimationPlayer").play("flicker")
							meta.player_food += 2
							meta.player_health += 2
							apply_text_effect("hunger up", "+ 2", is_player) #TEXT_EFECT
							yield(get_tree().create_timer(action_sub_time), "timeout")
				for chassis_card in level.player_left_arm_list:
					for tag in chassis_card.tags:
						if tag == WATER:
							main.cameraShake(action_sub_shake_vel, action_sub_time)
							level.expand_card_details(chassis_card)
							chassis_card.get_node("AnimationPlayer").stop()
							chassis_card.get_node("AnimationPlayer").play("flicker")
							meta.player_food += 2
							meta.player_health += 2
							apply_text_effect("hunger up", "+ 2", is_player) #TEXT_EFECT
							yield(get_tree().create_timer(action_sub_time), "timeout")
				for chassis_card in level.player_chassis_list:
					for tag in chassis_card.tags:
						if tag == WATER:
							main.cameraShake(action_sub_shake_vel, action_sub_time)
							level.expand_card_details(chassis_card)
							chassis_card.get_node("AnimationPlayer").stop()
							chassis_card.get_node("AnimationPlayer").play("flicker")
							meta.player_food += 2
							meta.player_health += 2
							apply_text_effect("hunger up", "+ 2", is_player) #TEXT_EFECT
							yield(get_tree().create_timer(action_sub_time), "timeout")
				for chassis_card in level.player_leg_list:
					for tag in chassis_card.tags:
						if tag == WATER:
							main.cameraShake(action_sub_shake_vel, action_sub_time)
							level.expand_card_details(chassis_card)
							chassis_card.get_node("AnimationPlayer").stop()
							chassis_card.get_node("AnimationPlayer").play("flicker")
							meta.player_food += 2
							meta.player_health += 2
							apply_text_effect("hunger up", "+ 2", is_player) #TEXT_EFECT
							yield(get_tree().create_timer(action_sub_time), "timeout")
			else:
				for chassis_card in level.enemy_right_arm_list:
					for tag in chassis_card.tags:
						if tag == WATER:
							main.cameraShake(action_sub_shake_vel, action_sub_time)
							level.expand_card_details(chassis_card)
							chassis_card.get_node("AnimationPlayer").stop()
							chassis_card.get_node("AnimationPlayer").play("flicker")
							meta.enemy_food += 2
							meta.enemy_health += 2
							apply_text_effect("hunger up", "+ 2", is_player) #TEXT_EFECT
							yield(get_tree().create_timer(action_sub_time), "timeout")
				for chassis_card in level.enemy_left_arm_list:
					for tag in chassis_card.tags:
						if tag == WATER:
							main.cameraShake(action_sub_shake_vel, action_sub_time)
							level.expand_card_details(chassis_card)
							chassis_card.get_node("AnimationPlayer").stop()
							chassis_card.get_node("AnimationPlayer").play("flicker")
							meta.enemy_food += 2
							meta.enemy_health += 2
							apply_text_effect("hunger up", "+ 2", is_player) #TEXT_EFECT
							yield(get_tree().create_timer(action_sub_time), "timeout")
				for chassis_card in level.enemy_chassis_list:
					for tag in chassis_card.tags:
						if tag == WATER:
							main.cameraShake(action_sub_shake_vel, action_sub_time)
							level.expand_card_details(chassis_card)
							chassis_card.get_node("AnimationPlayer").stop()
							chassis_card.get_node("AnimationPlayer").play("flicker")
							meta.enemy_food += 2
							meta.enemy_health += 2
							apply_text_effect("hunger up", "+ 2", is_player) #TEXT_EFECT
							yield(get_tree().create_timer(action_sub_time), "timeout")
				for chassis_card in level.enemy_leg_list:
					for tag in chassis_card.tags:
						if tag == WATER:
							main.cameraShake(action_sub_shake_vel, action_sub_time)
							level.expand_card_details(chassis_card)
							chassis_card.get_node("AnimationPlayer").stop()
							chassis_card.get_node("AnimationPlayer").play("flicker")
							meta.enemy_food += 2
							meta.enemy_health += 2
							apply_text_effect("hunger up", "+ 2", is_player) #TEXT_EFECT
							yield(get_tree().create_timer(action_sub_time), "timeout")
		elif act_str == RATIONS_ABILITY_1 and not "stop_" in avoid_recursion_str:
			if is_player:
				meta.player_food += food
				meta.player_water += water
			else:
				meta.enemy_food += food
				meta.enemy_water += water
			apply_text_effect("hunger up", "+ " + str(hunger), is_player) #TEXT_EFECT
		elif act_str == GROWING_HUNGER_1 and not "stop_" in avoid_recursion_str:
			if is_player:
				meta.player_food -= hunger
			else:
				meta.enemy_food -= hunger
			apply_text_effect("hunger up", "+ " + str(hunger), is_player) #TEXT_EFECT
		elif act_str == GAIN_START_DRAW_1 and not "stop_" in avoid_recursion_str:
			if is_player:
				meta.player_hand_limit += 1
				meta.current_salvage += 10
			else:
				meta.enemy_hand_limit += 1
		elif act_str == WASTE_REDUCTION_1 and not "stop_" in avoid_recursion_str:
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
		elif act_str == TOWERING_ELEPHANT_ABILITY_1 and not "stop_" in avoid_recursion_str:
			# Activate first x weapon of cards from right to left arm equal to your [IMPACT]"
			var skill_impact_count = collect_tag_values_in_play(null, is_player, ["main", "front", "back", "backup"], IMPACT, false)
			if is_player:
				var final_impact_dmg = skill_impact_count
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
						apply_text_effect("hurt", "- " + str(final_impact_dmg), is_player) #TEXT_EFECT
			else:
				var final_impact_dmg = skill_impact_count
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
						apply_text_effect("hurt", "- " + str(final_impact_dmg), is_player) #TEXT_EFECT

		if is_player:
			meta.player_health += health
			meta.player_defense += defense
			meta.player_toughness += toughnes
		else:
			meta.enemy_health += health
			meta.enemy_defense += defense
			meta.enemy_toughnes += toughnes
		#if card and main.checkIfNodeDeleted(card) == false:
		#	pass
			#card.get_node("AnimationPlayer").stop()

		level.reset_display_card_sizes()
		level.update_text_overlays()
	yield(get_tree().create_timer(1.0), "timeout")
	performing_actions = false
	return "finished"


func place_card_in_display(card_list, card_idx, is_player=false):

	if get_node("/root").has_node("level"):
		var level = get_node("/root/level")
		if is_player:
			if card_idx >= 0 and card_idx <= len(card_list) - 1 and len(card_list) > 0:
				level.player_discard.append(card_list[card_idx])
				if card_list[card_idx].card_type == ABILITY_CARD:
					card_list[card_idx].visible = false
				else:
					var new_card = main.CARD.instance()
					new_card.set_scale(STANDARD_DISPLAY_CARD_SCALE)
					get_node("/root").add_child(new_card)
					new_card.map_card(card_list[card_idx], false)
					set_card_img(new_card, card_list[card_idx])
					if card_list[card_idx].card_type == WEAPON_CARD:
						if len(level.player_right_arm_list) < level.player_right_arm_list_limit:
							level.player_right_arm_list.append(new_card)
						elif len(level.player_left_arm_list) < level.player_left_arm_list_limit:
							level.player_left_arm_list.append(new_card)
						else:
							new_card.get_node("AnimationPlayer").play("remove")
					elif card_list[card_idx].card_type== CHASSIS_CARD ||\
						 card_list[card_idx].card_type == HUNGER_CARD ||\
						 card_list[card_idx].card_type == FOOD_CARD|| \
						 card_list[card_idx].card_type == WATER_CARD:
						if len(level.player_chassis_list) < level.player_chassis_list_limit:
							level.player_chassis_list.append(new_card)
						elif len(level.player_leg_list) < level.player_leg_list_limit:
							level.player_leg_list.append(new_card)
						else:
							new_card.get_node("AnimationPlayer").play("remove")
					elif card_list[card_idx].card_type == LEG_CARD:
						if len(level.player_leg_list) < level.player_leg_list_limit:
							level.player_leg_list.append(new_card)
						else:
							new_card.get_node("AnimationPlayer").play("remove")
	
					if card_idx >= 0 and card_idx < len(card_list) and len(card_list) > 0:
						var item = card_list[card_idx]
						item.get_node("AnimationPlayer").play("remove")
						
					#print("PLAYER in place_card_in_display hand after card played: " + str(len(card_list)) + " + card_list: " + str(len(card_list)))
	
				level.handle_cards_in_display()
				#update_display_card(new_card, card_payload)
			else:
				print("tableau list doesn't match?")
		else:
			# Is Enemy
			if card_idx >= 0 and card_idx <= len(card_list) - 1 and len(card_list) > 0:
				level.enemy_discard.append(card_list[card_idx])
				if card_list[card_idx].card_type == ABILITY_CARD:
					card_list[card_idx].visible = false
				else:
					var new_card = main.CARD.instance()
					new_card.set_scale(STANDARD_DISPLAY_CARD_SCALE)
					get_node("/root").add_child(new_card)
					new_card.map_card(card_list[card_idx], false)
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
							new_card.get_node("AnimationPlayer").play("remove")
					elif card_list[card_idx].card_type == LEG_CARD:
						if len(level.enemy_leg_list) < level.enemy_leg_list_limit:
							level.enemy_leg_list.append(new_card)
						else:
							new_card.get_node("AnimationPlayer").play("remove")
					else:
						level.reset_display_card_sizes()
	
					if card_idx >= 0 and card_idx < len(card_list) and len(card_list) > 0:
						var item = card_list[card_idx]
						item.get_node("AnimationPlayer").play("remove")
					#update_display_card(new_card, enm_card_detail_list[hand_idx])
					# remove_card(card_list[card_idx])x
						# enm_hand.remove(card_idx)
					#enm_card_detail_list.remove(hand_idx)
					print("in place_card_in_display card_list after card played: " + str(len(card_list)) + " + card_list: " + str(len(card_list)))
	
				level.handle_cards_in_display()
				#update_display_card(new_card, card_payload)
			else:
				print("tableau list doesn't match?")
		level.reset_display_card_sizes()
		level.reset_hand_card_sizes()
		level.handle_cards_in_display()


func can_afford_card(chosen_card, is_player=true):
	var can_afford_water = ((meta.player_water+chosen_card.water)-chosen_card.water_production >= 0) if is_player\
							else ((meta.enemy_water+chosen_card.water)-chosen_card.water_production >= 0)
	var can_afford_food = ((meta.player_food+chosen_card.food)-chosen_card.hunger_production >= 0) if is_player\
							else ((meta.enemy_food+chosen_card.food)-chosen_card.hunger_production >= 0)
	return (can_afford_food and can_afford_food)


func set_card_img(new_card, card_payload):
	new_card.get_node("outer_art_container/sprite").visible = false
	new_card.get_node("inner_art_container/sprite").visible = false
	new_card.get_node("inner_art_container/background").visible = true
	if card_payload[CARD_BIOME] == SAVANNAH:
		if new_card[CARD_TYPE] == CHASSIS_CARD:
			new_card.get_node("inner_art_container/background").set_texture(main.CARD_SAVANNHA_BACKGROUND_1)
		elif new_card[CARD_TYPE] == WEAPON_CARD:
			new_card.get_node("inner_art_container/background").set_texture(main.CARD_SAVANNHA_BACKGROUND_2)
		elif new_card[CARD_TYPE] == ABILITY_CARD:
			new_card.get_node("inner_art_container/background").set_texture(main.CARD_SAVANNHA_BACKGROUND_3)
		else:
			new_card.get_node("inner_art_container/background").set_texture(main.CARD_GREY_BACKGROUND_3)
	elif card_payload[CARD_BIOME] == FOREST:
		if new_card[CARD_TYPE] == CHASSIS_CARD:
			new_card.get_node("inner_art_container/background").set_texture(main.CARD_FOREST_BACKGROUND_1)
		elif new_card[CARD_TYPE] == WEAPON_CARD:
			new_card.get_node("inner_art_container/background").set_texture(main.CARD_FOREST_BACKGROUND_2)
		elif new_card[CARD_TYPE] == ABILITY_CARD:
			new_card.get_node("inner_art_container/background").set_texture(main.CARD_FOREST_BACKGROUND_3)
		else:
			new_card.get_node("inner_art_container/background").set_texture(main.CARD_GREY_BACKGROUND_3)
	elif card_payload[CARD_BIOME] == COASTAL:
		if new_card[CARD_TYPE] == CHASSIS_CARD:
			new_card.get_node("inner_art_container/background").set_texture(main.CARD_COASTAL_BACKGROUND_1)
		elif new_card[CARD_TYPE] == WEAPON_CARD:
			new_card.get_node("inner_art_container/background").set_texture(main.CARD_COASTAL_BACKGROUND_2)
		elif new_card[CARD_TYPE] == ABILITY_CARD:
			new_card.get_node("inner_art_container/background").set_texture(main.CARD_COASTAL_BACKGROUND_3)
		else:
			new_card.get_node("inner_art_container/background").set_texture(main.CARD_GREY_BACKGROUND_3)
	elif card_payload[CARD_BIOME] == RIVERLANDS:
		if new_card[CARD_TYPE] == CHASSIS_CARD:
			new_card.get_node("inner_art_container/background").set_texture(main.CARD_RIVERLANDS_BACKGROUND_1)
		elif new_card[CARD_TYPE] == WEAPON_CARD:
			new_card.get_node("inner_art_container/background").set_texture(main.CARD_RIVERLANDS_BACKGROUND_2)
		elif new_card[CARD_TYPE] == ABILITY_CARD:
			new_card.get_node("inner_art_container/background").set_texture(main.CARD_RIVERLANDS_BACKGROUND_3)
		else:
			new_card.get_node("inner_art_container/background").set_texture(main.CARD_GREY_BACKGROUND_3)
	else:
		new_card.get_node("inner_art_container/background").set_texture(main.CARD_GREY_BACKGROUND_3)
		
	if card_payload[IMG_PATH]:
		new_card.get_node("inner_art_container/sprite").visible = true
		new_card.get_node("inner_art_container/sprite").set_texture(card_payload.img_path)


func spawn_cards(hand_limit, is_player=true, deck=riverlands_deck):
	randomize()
	if get_node("/root").has_node("level"):
		var level = get_node("/root/level")
		if is_player:
			for card_num in range(len(level.hand)):
				remove_card(level.hand[card_num])
				level.hand.remove(card_num)
				#remove_card(hand[card_num])
				yield(get_tree().create_timer(.1), "timeout")
			level.hand = []
			# card_detail_list = []
			var og_card_pos = Vector2(0, 0)
			for card in range(meta.player_hand_limit):
				var new_card = main.CARD.instance()
				new_card.z_index = 120
				get_node("/root").call_deferred("add_child", new_card)
				var rand_card = level.get_random_card(deck, is_player)
				var card_payload = new_card.get_card_payload(rand_card)
				card_payload[ID] = get_card_id()
				new_card.map_card(card_payload)
				set_card_img(new_card, card_payload)
				level.hand.append(new_card)
				if card == 0:
					new_card.position = Vector2(325 / (meta.player_hand_limit), 750)
					og_card_pos = new_card.position
				else:
					new_card.position = og_card_pos
					new_card.position.x += (card * 200)
					new_card.position.y = 750
				yield(get_tree().create_timer(.1), "timeout")
				#reset_display_card_sizes()
				#yield(get_tree().create_timer(.5), "timeout")
				#handle_cards_in_display()
		else:
			for card_num in range(len(level.enm_hand)):
				remove_card(level.enm_hand[card_num])
				level.enm_hand.remove(card_num)
				yield(get_tree().create_timer(.2), "timeout")
			level.enm_hand = []
			yield(get_tree().create_timer(.5), "timeout")
			var og_card_pos = Vector2(0, 0)
			for card_num in range(hand_limit):
				var new_card = main.CARD.instance()
				new_card.z_index = 120
				get_node("/root").call_deferred("add_child", new_card)
				var rand_card = level.get_random_card(deck, is_player)
				var card_payload = new_card.get_card_payload(rand_card)
				card_payload[ID] = get_card_id()
				new_card.map_card(card_payload)
				set_card_img(new_card, card_payload)
				level.enm_hand.append(new_card)
				if card_num == 0:
					new_card.position = Vector2(1000, 785)
					og_card_pos = new_card.position
				else:
					new_card.position = og_card_pos
					new_card.position.x += (card_num * 200)
					new_card.position.y = 785
				yield(get_tree().create_timer(.2), "timeout")
				#handle_cards_in_display()
	
			yield(get_tree().create_timer(.5), "timeout")
			for i in range(len(level.enm_hand) - 1):
				level.call_deferred("play_card", level.enm_hand, i, false)
			#handle_cards_in_display()


func get_card_id():
	randomize()
	return str(stepify(rand_range(-4, 4) + rand_range(-4, 4), 0.022))


func remove_card(card_node):
	if not card_node.removing or card_node.ready_to_remove:
		if card_node and main.checkIfNodeDeleted(card_node) == false:
			card_node.removing = true
			card_node.visible = false
			card_node.queue_free()
	else:
		print("trying to remove: " + str(card_node["title"]) + " but its 'removing'")

		
##### AI/ENM:
#
#
#


func set_enm_deck():
	pass

func draw_cards():
	pass
