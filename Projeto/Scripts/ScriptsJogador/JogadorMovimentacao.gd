extends Area2D
class_name Movimentacao


export var velocidade :int
var direcao:Vector2
onready var tamanhoTela = get_viewport_rect().size
onready var raioPersonagem = get_node("CollisionShape2D").shape.radius

func getInputs():
	var direita = Input.get_action_strength("ui_right")
	var esquerda = Input.get_action_strength("ui_left")
	
	var cima = Input.get_action_strength("ui_up")
	var baixo = Input.get_action_strength("ui_down")
	
	return Vector2(direita - esquerda, baixo - cima).clamped(1)

func _process(delta):
	direcao = getInputs()
	position += direcao * velocidade * delta
	
	#Limitar o jogador a ficar dentro da tela do jogo
	position.x = clamp(position.x, 0, tamanhoTela.x - raioPersonagem)
	position.y = clamp(position.y, 0, tamanhoTela.y - raioPersonagem)





func _on_Jogador_area_entered(area):
	print('faleceu')
