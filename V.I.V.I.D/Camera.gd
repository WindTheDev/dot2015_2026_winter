extends Camera3D

@export var player: Node3D

# Kameranın X ekseninde gidebileceği en sol ve en sağ sınırlar:
@export var min_x: float = -7.0
@export var max_x: float = 23.0

# Yumuşak takip hızı (Inspector'dan kolayca değiştirebilirsin):
@export var smooth_speed: float = 5.0

func _process(delta: float) -> void:
	if player != null:
		# 1. Karakterin X konumunu al ama duvar sınırlarının (min_x, max_x) dışına çıkmasını engelle:
		var hedef_x: float = clamp(player.global_position.x, min_x, max_x)
		
		# 2. Kameranın mevcut X konumunu, hesaplanan hedef_x konumuna yumuşakça kaydır:
		global_position.x = lerp(global_position.x, hedef_x, smooth_speed * delta)
