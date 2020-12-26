extends Node2D

# debug for pathfinding tests

var path_end_tile = null
###

var starting_tile = null
var level_tiles = []
var top_tiles = []
var bottom_tiles = []
var left_tiles = []
var right_tiles = []
var tile_gap = 50

var min_tile_gap = 50
var max_tile_gap = 150
var enms = 1
var level_astar = null
# Called when the node enters the scene tree for the first time.
func _ready():
	pass


func spawn_tiles():
	randomize()
	var col = meta.current_level_cols
	var row = meta.current_level_rows
	#if not starting_tile:
	#	starting_tile = get_node("starting_tile")
	
	# devide screen width by total tiles and additional 5% buffer to find tile spacing
	tile_gap = 1080 / (col * row) * (col + row)
	if tile_gap < min_tile_gap: 
		tile_gap = min_tile_gap
	if tile_gap > max_tile_gap: 
		tile_gap = max_tile_gap
	print('tile gap is ' + str(tile_gap))

	var tile_index = 0

	level_astar = AStar2D.new()
	#var res = astar.get_id_path(1, 3) # Returns [1, 2, 3]
	
	for r in range(0, row):
		for c in range(0, col):
			tile_index += 1
			var t = main.TILE.instance()
			var tile_map = $nav/tile_map
			var tile_info = ""
			get_node("nav/tile_map").add_child(t)
			t.row = r
			t.column = c
			level_tiles.append(t)
			t.index = tile_index
			
			if main.debug: tile_info += " |ID " + str(tile_index)
			
			if not starting_tile:
				starting_tile = t
				t.position = Vector2(tile_gap, tile_gap)
			else:
				t.position = Vector2(starting_tile.global_position.x +\
									(r * tile_gap),\
									starting_tile.global_position.y +\
									(c * tile_gap))
			"""
			if not path_start_tile:
				if rand_range(0, 10) >= 9.9
					or tile_index >= (col * row) * .70:
					path_start_tile = t
					t.modulate = Color(1, 1, 0, 1)
					t.is_start = true
					t.can_move = true
			if not path_end_tile:
				if rand_range(0, 10) >= 9.5
				   or tile_index >= (col * row) * .99:
					path_end_tile = t
					t.modulate = Color(0, 0, 1, 1)
					t.is_end = true
					t.can_move = true
			"""
			if main.debug: 
				t.get_node("debug_info").visible = true
				t.get_node("debug_info").set_text(tile_info)
	print('level_astar ' + str(level_astar))
	set_tile_neighbors(row, col)
	for _i in range(0, enms):
		var timer = Timer.new()
		timer.set_wait_time(1)
		timer.set_one_shot(true)
		get_node("/root").add_child(timer)
		timer.start()
		yield(timer, "timeout")
		timer.queue_free()
		var count = 0
		for t in level_tiles:
			count += 1
			if rand_range(0, 10) >= 7 or count >= len(level_tiles) * .99:
				spawn_enemies(level_astar,  level_tiles[0], level_tiles[col+1])
				break


func spawn_enemies(astar_path_obj, starting_tile, target_tile):
	var e = main.ENEMY.instance()
	get_node("/root").add_child(e)
	e.set_spawn_tile(starting_tile)
	e.set_tile_target(target_tile)
	e.set_navigation()
	e.add_to_group("enemies")


func set_tile_neighbors(row, col):
	for t in level_tiles:
		if rand_range(0, 10) >= 9:
			t.can_move = false
			t.modulate = Color(0, 0, 0, 1)
			connect_astart_path_neightbors(level_astar, t.index, t, row, col, 100)
		else:
			connect_astart_path_neightbors(level_astar, t.index, t, row, col, 1)


func connect_astart_path_neightbors(astar_path_obj, tile_index, tile, row, col, tile_weight):
	# TODO: Need to fix so we set in cardinal directions (north, south, east, west)
	# because we add tile left to right, currently we only add tiles in a similar way
	# despite calls below that look like we add neightbors (probably loop after tiles
	# are set then set appropriate neightbors, we've done this before in AQI and Desert Racer)

	# this tile index is ADDED to the current tile index
	var above_tile_idx = tile_index - 1
	var right_tile_idx = tile_index + col
	var below_tile_idx = tile_index + 1
	var left_tile_idx = tile_index - col
	
	# set initial spot
	astar_path_obj.add_point(tile_index, tile.global_position, tile_weight)
	if above_tile_idx > 0 and above_tile_idx < level_tiles.size():
		astar_path_obj.connect_points(tile_index, above_tile_idx, true)
	if above_tile_idx > 0 and right_tile_idx < level_tiles.size():
		astar_path_obj.connect_points(tile_index, right_tile_idx, true)
	if below_tile_idx > 0 and below_tile_idx < level_tiles.size():
		astar_path_obj.connect_points(tile_index, below_tile_idx, true)
	if left_tile_idx > 0 and left_tile_idx < level_tiles.size():
		astar_path_obj.connect_points(tile_index, left_tile_idx, true)
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
