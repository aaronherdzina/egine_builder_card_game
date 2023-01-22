extends Control

#signal maximum_changed(maximum)

var maximum = 100
var current_health = 0
var min_val = 5
func _ready():
	animate_value(meta.player_health-min_val, meta.player_health)
	animate_value(meta.player_food-min_val, meta.player_food, 'food')
	animate_value(meta.player_water-min_val, meta.player_water, 'water')

	animate_value(meta.enemy_health-min_val, meta.enemy_health, 'health', false)
	animate_value(meta.enemy_food-min_val, meta.enemy_food, 'food', false)
	animate_value(meta.enemy_water-min_val, meta.enemy_water, 'water', false)
	
	#get_node("AnimationPlayer").connect("finished", self, "return_enm_icon_to_idle")


func _on_AnimationPlayer_animation_finished(anim_name):
	return_enm_icon_to_idle()
	
func return_enm_icon_to_idle():
	if false == true:
		$AnimationPlayer.play("idle")


func animate_value(start, end, val_type='health', is_player=true, for_punch=false):
	var timing = 1
	if end >= start * .5:
		timing = 2
	elif end >= start * .75:
		timing = 4
	var node_to_anim = null
	var node_to_tween = null
	var anim_type = Tween.TRANS_ELASTIC
	var set_max = false
	if 'food' in val_type:
		timing = .25
		anim_type = Tween.TRANS_BACK
		if set_max:
			if is_player:
				$z/player_food_bar/TextureProgress.max_value = meta.player_food_max
			else:
				$z/enemy_food_bar/TextureProgress.max_value = meta.enemy_food_max
		node_to_tween = $z/player_food_bar/Tween if is_player else $z/enemy_food_bar/Tween
		node_to_anim = $z/player_food_bar/TextureProgress if is_player else $z/enemy_food_bar/TextureProgress

	elif 'water' in val_type:
		timing = 4 if for_punch else .1
		if set_max:
			if is_player:
				$z/player_water_bar/TextureProgress.max_value = meta.player_water_max
			else:
				$z/enemy_water_bar/TextureProgress.max_value = meta.enemy_water_max
		node_to_tween = $z/player_water_bar/Tween if is_player else $z/enemy_water_bar/Tween
		node_to_anim = $z/player_water_bar/TextureProgress if is_player else $z/enemy_water_bar/TextureProgress
	else:
		if set_max:
			if is_player:
				$z/player_health_bar/TextureProgress.max_value = meta.player_health_max
			else:
				$z/enemy_health_bar/TextureProgress.max_value = meta.enemy_health_max
		node_to_tween = $z/player_health_bar/Tween if is_player else $z/enemy_health_bar/Tween
		node_to_anim = $z/player_health_bar/TextureProgress if is_player else $z/enemy_health_bar/TextureProgress
	
	node_to_tween.interpolate_property(node_to_anim, "value", start, end, timing, anim_type, Tween.EASE_OUT)
	node_to_tween.start()
