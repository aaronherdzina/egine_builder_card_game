extends Node2D

var tags = []
var hunger_production = 0
var water_reduction = 0
var food_production = 0
var attacks = 0
var hunger = 0
var water = 0
var damage = 0
var health = 0
var toughness = 0
var defense = 0
var food = 0
var card_biome = ""
var id = -333
var card_type = ""
var card_action = "??default??"
var card_wait_time = .5
var img_path = ""
var title = ""
var rarity = 1
var description = ''
var selected_for_action_phase = true
var removing = false
var ready_to_remove = false
var ability_bonus = 0

func get_card_payload(card):
	var card_payload = {Cards.CARD_TYPE: card[Cards.CARD_TYPE]}
	#### Upper card section details
	if Cards.ABILITY_BONUS in card:
		card_payload[Cards.ABILITY_BONUS] = card[Cards.ABILITY_BONUS]
	if Cards.RARITY in card:
		card_payload[Cards.RARITY] = card[Cards.RARITY]
	if Cards.FOOD in card:
		card_payload[Cards.FOOD] = card[Cards.FOOD]
	if Cards.WATER in card:
		card_payload[Cards.WATER] = card[Cards.WATER]
	if Cards.CARD_WAIT_TIME in card:
		card_payload[Cards.CARD_WAIT_TIME] = card[Cards.CARD_WAIT_TIME]
	if Cards.CARD_ACTION in card:
		card_payload[Cards.CARD_ACTION] = card[Cards.CARD_ACTION]
	if Cards.CARD_BIOME in card:
		card_payload[Cards.CARD_BIOME] = card[Cards.CARD_BIOME]
	if Cards.TITLE in card:
		card_payload[Cards.TITLE] = card[Cards.TITLE]
	if Cards.DESCRIPTION in card:
		card_payload[Cards.DESCRIPTION] = card[Cards.DESCRIPTION]
	if Cards.ATTACKS in card:
		card_payload[Cards.ATTACKS] = card[Cards.ATTACKS]
	if Cards.DAMAGE in card:
		card_payload[Cards.DAMAGE] = card[Cards.DAMAGE]
	if Cards.ATTACK_RANGE in card:
		card_payload[Cards.ATTACK_RANGE] = card[Cards.ATTACK_RANGE]
	if Cards.DEFENSE in card:
		card_payload[Cards.DEFENSE] = card[Cards.DEFENSE]
	if Cards.TOUGHNESS in card:
		card_payload[Cards.TOUGHNESS] = card[Cards.TOUGHNESS]
	if Cards.HEALTH in card:
		card_payload[Cards.HEALTH] = card[Cards.HEALTH]
	#####
	if Cards.PIERCING in card:
		card_payload[Cards.PIERCING] = card[Cards.PIERCING]
	if Cards.BLEED in card:
		card_payload[Cards.BLEED] = card[Cards.BLEED]
	if Cards.BURN in card:
		card_payload[Cards.BURN] = card[Cards.BURN]
	if Cards.RUST in card:
		card_payload[Cards.RUST] = card[Cards.RUST]
	if Cards.FREEZE in card:
		card_payload[Cards.FREEZE] = card[Cards.FREEZE]
	if Cards.STUN in card:
		card_payload[Cards.STUN] = card[Cards.STUN]
	if Cards.WEAPON in card:
		card_payload[Cards.WEAPON] = card[Cards.WEAPON]
	if Cards.OVERHUNGER in card:
		card_payload[Cards.OVERHUNGER] = card[Cards.OVERHUNGER]
	if Cards.FLAMMABLE in card:
		card_payload[Cards.FLAMMABLE] = card[Cards.FLAMMABLE]
	if Cards.POISON in card:
		card_payload[Cards.POISON] = card[Cards.POISON]
	if Cards.FIRE in card:
		card_payload[Cards.FIRE] = card[Cards.FIRE]
	if Cards.WATER in card:
		card_payload[Cards.WATER] = card[Cards.WATER]
	if Cards.IMPACT in card:
		card_payload[Cards.IMPACT] = card[Cards.IMPACT]
	if Cards.BLADE in card:
		card_payload[Cards.BLADE] = card[Cards.BLADE]
	if Cards.STEAM in card:
		card_payload[Cards.STEAM] = card[Cards.STEAM]
	if Cards.ENERGY in card:
		card_payload[Cards.ENERGY] = card[Cards.ENERGY]
	if Cards.MISSILE in card:
		card_payload[Cards.MISSILE] = card[Cards.MISSILE]
	if Cards.EXPLOSION in card:
		card_payload[Cards.EXPLOSION] = card[Cards.EXPLOSION]
	if Cards.LEADER in card:
		card_payload[Cards.LEADER] = card[Cards.LEADER]

	if Cards.FOOD_PRODUCTION in card:
		card_payload[Cards.FOOD_PRODUCTION] = card[Cards.FOOD_PRODUCTION]
	if Cards.FOOD in card:
		card_payload[Cards.FOOD] = card[Cards.FOOD]
	if Cards.ABILITY_RANGE in card:
		card_payload[Cards.ABILITY_RANGE] = card[Cards.ABILITY_RANGE]
	if Cards.SHIELD in card:
		card_payload[Cards.SHIELD] = card[Cards.SHIELD]
	if Cards.HUNGER_PRODUCTION in card:
		card_payload[Cards.HUNGER_PRODUCTION] = card[Cards.HUNGER_PRODUCTION]
	if Cards.WATER_REDUCTION in card:
		card_payload[Cards.WATER_REDUCTION] = card[Cards.WATER_REDUCTION]
	if Cards.WATER in card:
		card_payload[Cards.WATER] = card[Cards.WATER]
	if Cards.ABILITY_RANGE in card:
		card_payload[Cards.ABILITY_RANGE] = card[Cards.ABILITY_RANGE]
	if Cards.CARD_ACTION in card:
		card_payload[Cards.CARD_ACTION] = card[Cards.CARD_ACTION]

	if Cards.BUFF in card:
		card_payload[Cards.BUFF] = card[Cards.BUFF]
	if Cards.DEBUFF in card:
		card_payload[Cards.DEBUFF] = card[Cards.DEBUFF]

	if Cards.TARGET in card:
		card_payload[Cards.TARGET] = card[Cards.TARGET]

	if Cards.ENEMIES in card:
		card_payload[Cards.ENEMIES] = card[Cards.ENEMIES]
	if Cards.ALLIES in card:
		card_payload[Cards.ALLIES] = card[Cards.ALLIES]
	if Cards.SELF in card:
		card_payload[Cards.SELF] = card[Cards.SELF]
	if Cards.IMG_PATH in card:
		card_payload[Cards.IMG_PATH] = card[Cards.IMG_PATH]

	if Cards.ID in card:
		card_payload[Cards.ID] = card[Cards.ID]
	if Cards.TAGS in card:
		card_payload[Cards.TAGS] = card[Cards.TAGS]
	return card_payload


func map_card(card_payload, recalc_costs=true):
	if removing:
		return
	if Cards.ABILITY_BONUS in card_payload:
		ability_bonus = card_payload[Cards.ABILITY_BONUS]
	if Cards.RARITY in card_payload:
		rarity = card_payload[Cards.RARITY]
	if Cards.TITLE in card_payload:
		title = card_payload[Cards.TITLE]
	if Cards.DESCRIPTION in card_payload:
		description = card_payload[Cards.DESCRIPTION]
	if Cards.CARD_TYPE in card_payload:
		card_type = card_payload[Cards.CARD_TYPE]
	if Cards.CARD_ACTION in card_payload:
		card_action = card_payload[Cards.CARD_ACTION]
	if Cards.CARD_WAIT_TIME in card_payload:
		card_wait_time = card_payload[Cards.CARD_WAIT_TIME]
	if Cards.IMG_PATH in card_payload:
		img_path = card_payload[Cards.IMG_PATH ]
	if Cards.HUNGER_PRODUCTION in card_payload:
		hunger_production = card_payload[Cards.HUNGER_PRODUCTION]
	if Cards.WATER_REDUCTION in card_payload:
		water_reduction = card_payload[Cards.WATER_REDUCTION]
	if Cards.FOOD_PRODUCTION in card_payload:
		food_production = card_payload[Cards.FOOD_PRODUCTION]
	if Cards.HUNGER in card_payload:
		hunger = card_payload[Cards.HUNGER]
	if Cards.FOOD in card_payload:
		food = card_payload[Cards.FOOD]
	if Cards.WATER in card_payload:
		water = card_payload[Cards.WATER]
	if Cards.CARD_BIOME in card_payload:
		card_biome = card_payload[Cards.CARD_BIOME]
	if Cards.HEALTH in card_payload:
		health = card_payload[Cards.HEALTH]
	if Cards.DAMAGE in card_payload:
		damage = card_payload[Cards.DAMAGE]
	if Cards.ATTACKS in card_payload:
		attacks = card_payload[Cards.ATTACKS]
	if Cards.TOUGHNESS in card_payload:
		toughness = card_payload[Cards.TOUGHNESS]
	if Cards.DEFENSE in card_payload:
		defense = card_payload[Cards.DEFENSE]
	if Cards.TAGS in card_payload:
		tags = card_payload[Cards.TAGS]

	if recalc_costs:
		var costs = Cards.create_card_cost(self)
		if costs:
			if hunger_production > 0:
				#print("setting cost?? costs " + str(costs))
				hunger_production = costs["food_cost"]
	#print("cost? hunger_production: " + str(hunger_production)+ " water_reduction: " + str(water_reduction))
	update_card_display_info(self, card_payload)


func update_card_display_info(card_node, card_payload):
	# meant to be broad for cards that may not be a 'character'
	if not card_node:
		card_node = self
	if card_node.removing:
		return
	var sprite_node = card_node.get_node("inner_art_container/sprite")
	var card_background_node = card_node.get_node("inner_art_container/background")

	var card_background_shadow_node = card_node.get_node("outer_art_container/background")
	var card_background_outline_node = card_node.get_node("outer_art_container/shadow")

	card_background_node.modulate = Color(1, 1, 1, 1)
	
	# pass id from payload to card node for unique access when needed

	if card_node.card_type == Cards.CHAR_CARD\
	   or card_node.card_type == Cards.ABILITY_CARD\
	   or card_node.card_type == Cards.LEG_CARD\
	   or card_node.card_type == Cards.WEAPON_CARD\
	   or card_node.card_type == Cards.CHASSIS_CARD\
	   or card_node.card_type == Cards.HUNGER_CARD\
	   or card_node.card_type == Cards.FOOD_CARD\
	   or card_node.card_type == Cards.WATER_CARD:
		#print("setting display values for " + str(card_node.title) + " hunger " + str(card_node.hunger_production) + " water " + str(card_node.water_reduction))
		#### Upper card section details
		var tag_text = "tags: "
		for tag in card_node.tags:
			tag_text += tag + ", "
		card_node.get_node("tags").set_text(str(tag_text))

		card_node.get_node("timer").set_text(str(card_node.card_wait_time))
		card_node.get_node("action").set_text(card_node.card_action)
		if card_node.attacks > 0 or card_node.damage > 0:
			if card_node.damage <= 0:
				card_node.damage = 1
			if card_node.attacks <= 0:
				card_node.attacks = 1
			card_node.get_node("damage").set_text(str(card_node.attacks*card_node.damage))
		else:
			card_node.get_node("damage").set_text("")

		if card_node.defense > 0:
			card_node.get_node("defense").set_text("D "+str(card_node.defense))
		else:
			card_node.get_node("defense").set_text("")

		if card_node.toughness in card_payload:
			card_node.get_node("toughness").set_text("T"+str(card_node.toughness))
		else:
			card_node.get_node("toughness").set_text("")

		if card_node.health > 0:
			card_node.get_node("health").set_text("H "+str(card_node.health))
		else:
			card_node.get_node("health").set_text("")
			
		if card_node.hunger_production > 0:
			card_node.get_node("food_cost").set_text("F "+str(card_node.hunger_production))
		else:
			card_node.get_node("food_cost").set_text("")

		if card_node.water_reduction > 0:
			card_node.get_node("water_cost").set_text("W "+str(card_node.water_reduction))
		else:
			card_node.get_node("water_cost").set_text("")

		#####
		var bottom_section_text = "R("+str(card_node.rarity)+") "
		var title_text = card_node.title.to_upper()
		card_node.get_node("title").set_text(title_text)
		bottom_section_text += card_node.description+"\n"
		# if FOOD_PRODUCTION in card_payload:
		# 	bottom_section_text += FOOD_PRODUCTION.to_upper() + " " + str(card_payload[FOOD_PRODUCTION])
		for tag in card_node.tags:
			bottom_section_text += tag.to_upper() + " "
		if Cards.WEAPON in card_payload:
			bottom_section_text += "\n"
			bottom_section_text += str(card_payload[Cards.WEAPON]).to_upper()

		card_node.get_node("text").set_text(bottom_section_text)
	else:
		print("n/**Can't find card_payload[card_type]: " + str(card_node.card_type) +" **")


####
##
# Hold and swap values, nothing else, keep lightweight
#
#
#
#
#
#
#
#
#


func _on_AnimationPlayer_animation_finished(anim_name):

	if ready_to_remove:
		print("ready_to_remove. removing " + title)
		Cards.remove_card(self)
		return
	if anim_name == "remove":
		print("removing " + title)
		Cards.remove_card(self)
	pass # Replace with function body.
