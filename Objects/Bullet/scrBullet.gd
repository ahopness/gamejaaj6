extends Area2D

export(float) var bulletspeed := 2500.0
export(float) var basetilt := 0.05
export(int) var damage := 2
enum bullet_types {
	SHOTGUN,
	SNIPER,
	METRALHADORA}
export(bullet_types) var bullet_type = bullet_types.SHOTGUN

var slighttilt : float

func _ready():
	slighttilt = rand_range(-basetilt, basetilt)
	self.global_rotation = global_rotation + slighttilt
	
	match bullet_type:
		bullet_types.METRALHADORA:
			$sprBullet.visible = true
			$sprBullet2.visible = false
			$sprBullet3.visible = false
		bullet_types.SNIPER:
			$sprBullet.visible = false
			$sprBullet2.visible = true
			$sprBullet3.visible = false
		bullet_types.SHOTGUN:
			$sprBullet.visible = false
			$sprBullet2.visible = false
			$sprBullet3.visible = true
func _process(_delta):
	position += (Vector2.RIGHT * bulletspeed).rotated(rotation) * _delta

var blood_slapsh = preload("res://Objects/Blood/oBlood.tscn")
func _on_Area2D_body_entered(body):
	if is_in_group("ShootByPlayer"):
		if body.is_in_group("Enemy"):
			var blood_slapsh_instance = blood_slapsh.instance()
			blood_slapsh_instance.global_position = global_position
			get_parent().call_deferred("add_child", blood_slapsh_instance)
			
			body.take_damage(damage)
		if !body.is_in_group("Player"):
			queue_free()
	
	elif is_in_group("ShootByEnemy"):
		if body.is_in_group("Player"):
			body.take_damage(damage, 900)
		if !body.is_in_group("Enemy"):
			queue_free()
