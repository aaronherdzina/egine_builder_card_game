extends Node2D

var tags = []
var hunger_production = 0
var water_production = 0
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


func map_card(card_payload):
	print("map card: " + str(card_payload[Cards.TITLE]) + " " + str(card_payload))
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
	if Cards.WATER_PRODUCTION in card_payload:
		water_production = card_payload[Cards.WATER_PRODUCTION]
	if Cards.FOOD_PRODUCTION in card_payload:
		food_production = card_payload[Cards.FOOD_PRODUCTION]
	if Cards.HUNGER in card_payload:
		hunger = card_payload[Cards.HUNGER]
	if Cards.FOOD in card_payload:
		defense = card_payload[Cards.FOOD]
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
	if hunger_production > 0 or\
	   water_production > 0 in card_payload:
		var costs = Cards.create_card_cost(self)
		print("setting cost?? costs " + str(costs))
		hunger_production += costs["food_cost"]
		water_production += costs["water_cost"]
	print("cost?? hunger_production " + str(hunger_production))
	print("cost?? water_production " + str(water_production))
	update_card_display_info(self, card_payload)


func update_card_display_info(card_node, card_payload):
	# meant to be broad for cards that may not be a 'character'
	if not card_node:
		card_node = self
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
		print("setting display values for " + str(card_node.title) + " hunger " + str(card_node.hunger_production) + " water " + str(card_node.water_production))
		#### Upper card section details
		var tag_text = ""
		for tag in card_node.tags:
			tag_text += tag + ","
		card_node.get_node("tags").set_text(str(tag_text))

		card_node.get_node("timer").set_text(str(card_node.card_wait_time))
		card_node.get_node("action").set_text(card_node.card_action)
		if card_node.damage > 0:
			card_node.get_node("detail_5").set_text(str(card_node.damage))
		else:
			card_node.get_node("detail_5").set_text("")
		if card_node.attacks > 0:
			card_node.get_node("detail_4").set_text(str(attacks))
			card_node.get_node("detail_4_5_operator").set_text("*")
		else:
			card_node.get_node("detail_4_5_operator").set_text("")
		if card_node.defense > 0:
			card_node.get_node("detail_3").set_text(str(card_node.defense))
		else:
			card_node.get_node("detail_3").set_text("")
		if card_node.toughness in card_payload:
			card_node.get_node("detail_2").set_text(str(card_node.toughness))
		else:
			card_node.get_node("detail_2").set_text("")
		if card_node.health > 0:
			card_node.get_node("detail_1").set_text(str(card_node.health))
		else:
			card_node.get_node("detail_1").set_text("")
			
		if card_node.hunger_production > 0 and card_node.water_production > 0:
			card_node.get_node("detail_6").set_text(str(card_node.hunger_production) + " / " + str(card_node.water_production))
		elif card_node.hunger_production > 0:
			card_node.get_node("detail_6").set_text(str(card_node.hunger_production) + " / ")
		elif card_node.water_production > 0:
			card_node.get_node("detail_6").set_text(" / " + str(card_node.water_production))
		else:
			card_node.get_node("detail_6").set_text("")
		#####
		var bottom_section_text = "("+str(card_node.rarity)+") "
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

		print("** whats in cost spot??: " + card_node.get_node("detail_6").get_text())
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
