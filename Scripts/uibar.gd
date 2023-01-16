extends Control

#signal maximum_changed(maximum)

var maximum = 100
var current_health = 0

func _ready():
	animate_value(int(meta.player_health * 1.1), meta.player_health)
	animate_value(int(meta.player_food * 1.1), meta.player_food, 'food')
	
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
	if 'food' in val_type:
		timing = .25
		anim_type = Tween.TRANS_BACK
		node_to_tween = $z/player_food_bar/Tween if is_player else $z/enemy_stamina_bar/Tween
		node_to_anim = $z/player_food_bar/TextureProgress if is_player else $z/enemy_stamina_bar/TextureProgress
		# also change the max
		"""
		var stamina_max = meta_state.game_data.pd.stamina_max if is_player else meta_state.game_data.ed.stamina_max
		var stamina_max_default = meta_state.game_data.pd.stamina_max_default if is_player else meta_state.game_data.ed.stamina_max_default
		
		if is_player:
			$z/player_stamina_max/Tween.interpolate_property($z/player_stamina_max/stamina_max, "value", 0, stamina_max_default - stamina_max, timing, anim_type, Tween.EASE_OUT)
		else:
			print('stamina_max ' + str(stamina_max) + ' stamina_max_default ' + str(stamina_max_default))
			$z/enemy_stamina_max/Tween.interpolate_property($z/enemy_stamina_max/stamina_max, "value", 0, stamina_max_default - stamina_max, timing, anim_type, Tween.EASE_OUT)
		"""
	elif 'momentum' in val_type:
		timing = 4 if for_punch else .1
		node_to_tween = $z/player_momentum_bar/Tween if is_player else $z/enemy_momentum_bar/Tween
		node_to_anim = $z/player_momentum_bar/TextureProgress if is_player else $z/enemy_momentum_bar/TextureProgress
	else:
		node_to_tween = $z/player_health_bar/Tween if is_player else $z/enemy_health_bar/Tween
		node_to_anim = $z/player_health_bar/TextureProgress if is_player else $z/enemy_health_bar/TextureProgress
	
	node_to_tween.interpolate_property(node_to_anim, "value", start, end, timing, anim_type, Tween.EASE_OUT)
	node_to_tween.start()
