extends TileMapLayer

# Source ID jednotlivých barevných variant
var colors = [0, 1, 2, 3, 4, 5]

func _ready():
	randomize_colors()


func randomize_colors():
	var used_cells = get_used_cells()

	# seřadíme buňky shora dolů, zleva doprava
	used_cells.sort_custom(func(a, b):
		if a.y == b.y:
			return a.x < b.x
		return a.y < b.y
	)

	for cell in used_cells:
		var available = colors.duplicate()

		var left = cell + Vector2i(-1, 0)
		var top = cell + Vector2i(0, -1)

		# pokud vlevo existuje tile, zakážeme jeho barvu
		if get_cell_source_id(left) != -1:
			available.erase(get_cell_source_id(left))

		# pokud nahoře existuje tile, zakážeme jeho barvu
		if get_cell_source_id(top) != -1:
			available.erase(get_cell_source_id(top))

		var chosen_source = available.pick_random()

		set_cell(
			cell,
			chosen_source,
			Vector2i(0, 0)
		)
