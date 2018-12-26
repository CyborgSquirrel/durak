extends Sprite

var regions = [Rect2(0, 0, 43, 15), Rect2(0, 15, 34, 14)]

func _ready():
	var tween = $Tween
	tween.interpolate_property(self, "modulate", Color(1, 1, 1, 1), Color(1, 1, 1, 0), 1, Tween.TRANS_LINEAR, Tween.EASE_IN)
	tween.start()
	region_rect = regions[randi()%len(regions)]

