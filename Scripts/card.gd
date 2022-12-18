extends Node2D

var tags = []
var hunger_production = 0
var food_production = 0
var attacks = 0
var hunger = 0
var water = 0
var damage = 0
var health = 0
var toughness = 0
var defense = 0
var food = 0
var id = -333
var card_type = ""
var card_action = "??default??"
var card_wait_time = 1
var img_path = ""
var title = ""
var description = ''


func map_card(card_payload):
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
	if Cards.FOOD_PRODUCTION in card_payload:
		food_production = card_payload[Cards.FOOD_PRODUCTION]
	if Cards.HUNGER in card_payload:
		defense = card_payload[Cards.HUNGER]
	if Cards.WATER in card_payload:
		defense = card_payload[Cards.WATER]

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
	update_card_display_info(self, card_payload)


func update_card_display_info(card_node, card_payload):
	# meant to be broad for cards that may not be a 'character'
	if not card_node:
		card_node = self
	print(card_payload[Cards.CARD_TYPE])
	var sprite_node = card_node.get_node("inner_art_container/sprite")
	var card_background_node = card_node.get_node("inner_art_container/background")

	var card_background_shadow_node = card_node.get_node("outer_art_container/background")
	var card_background_outline_node = card_node.get_node("outer_art_container/shadow")

	card_background_node.modulate = Color(1, 1, 1, 1)
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
	if Cards.ID in card_payload:
		card_node.id = card_payload[Cards.ID]

	if card_payload[Cards.CARD_TYPE] == Cards.CHAR_CARD\
	   or card_payload[Cards.CARD_TYPE] == Cards.ABILITY_CARD\
	   or card_payload[Cards.CARD_TYPE] == Cards.LEG_CARD\
	   or card_payload[Cards.CARD_TYPE] == Cards.WEAPON_CARD\
	   or card_payload[Cards.CARD_TYPE] == Cards.CHASSIS_CARD\
	   or card_payload[Cards.CARD_TYPE] == Cards.HUNGER_CARD\
	   or card_payload[Cards.CARD_TYPE] == Cards.FOOD_CARD:
		#### Upper card section details
		if Cards.TAGS in card_payload:
			var tags = ""
			for tag in card_payload[Cards.TAGS]:
				tags += tag + ","
			card_node.get_node("tags").set_text(str(tags))

		if Cards.CARD_WAIT_TIME in card_payload:
			card_node.get_node("timer").set_text(str(card_payload[Cards.CARD_WAIT_TIME]))

		if Cards.CARD_ACTION in card_payload:
			card_node.get_node("action").set_text(card_payload[Cards.CARD_ACTION])
		if Cards.WEAPON_DAMAGE_TYPE in card_payload:
			card_node.get_node("detail_1").set_text(str(card_payload[Cards.WEAPON_DAMAGE_TYPE]))
		else:
			card_node.get_node("detail_1").set_text("")
		if Cards.DAMAGE in card_payload:
			card_node.get_node("detail_5").set_text(str(card_payload[Cards.DAMAGE]))
		else:
			card_node.get_node("detail_5").set_text("")
		if Cards.ATTACKS in card_payload:
			card_node.get_node("detail_4").set_text(str(card_payload[Cards.ATTACKS]))
			card_node.get_node("detail_4_5_operator").set_text("*")
		else:
			card_node.get_node("detail_4_5_operator").set_text("")
		if Cards.DEFENSE in card_payload:
			card_node.get_node("detail_3").set_text(str(card_payload[Cards.DEFENSE]))
		else:
			card_node.get_node("detail_3").set_text("")
		if Cards.TOUGHNESS in card_payload:
			card_node.get_node("detail_2").set_text(str(card_payload[Cards.TOUGHNESS]))
		else:
			card_node.get_node("detail_2").set_text("")


		if Cards.HEALTH in card_payload:
			card_node.get_node("detail_1").set_text(str(card_payload[Cards.HEALTH]))
		else:
			card_node.get_node("detail_1").set_text("")
			
		if Cards.FOOD_PRODUCTION in card_payload:
			card_node.get_node("detail_6").set_text(str(card_payload[Cards.FOOD_PRODUCTION]))
		else:
			card_node.get_node("detail_6").set_text("")
		#####
		var bottom_section_text = ""
		var title_text = card_payload[Cards.TITLE].to_upper()
		card_node.get_node("title").set_text(title_text)
		if Cards.DESCRIPTION in card_payload:
			bottom_section_text += card_payload[Cards.DESCRIPTION]+"\n"
		# if FOOD_PRODUCTION in card_payload:
		# 	bottom_section_text += FOOD_PRODUCTION.to_upper() + " " + str(card_payload[FOOD_PRODUCTION])
		for tag in tags:
			bottom_section_text += tag.to_upper() + " "
		if Cards.WEAPON in card_payload:
			bottom_section_text += "\n"
			bottom_section_text += str(card_payload[Cards.WEAPON]).to_upper()

		card_node.get_node("text").set_text(bottom_section_text)
	else:
		print("n/**Can't find card_payload[CARD_TYPE]: " + str(card_payload[Cards.CARD_TYPE]) +" **")


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
