extends AnimatedSprite


func _ready():
	play()
	
func _process(delta):
	var direcao = get_node('..').direcao
	
	if direcao.y != 0:
		animation = 'Cima'
		if direcao.y < 0:
			flip_v = false
		else:
			flip_v = true
			
	if direcao.x != 0:
		animation = 'Direita'
		if direcao.x > 0:
			flip_h = false
		else:
			flip_h = true
