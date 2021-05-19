extends Area2D

var posicaoJogador:Vector2
onready var rng = RandomNumberGenerator.new()
onready var tamanhoColisor = get_node("CollisionShape2D").shape.extents
onready var tamanhoTela = get_viewport_rect().size
onready var direcao:Vector2
const velocidade = 300

func _ready():
	posicaoJogador = get_node('../Jogador').position
	
	rng.randomize()
	var xAleatorio = rng.randf_range(-tamanhoColisor.x-10, tamanhoTela.x + tamanhoColisor.x + 10)
	position = Vector2(xAleatorio, -10)
	
	direcao = direcaoDesejada(posicaoJogador)


	rotacionar(posicaoJogador)


func _process(delta):
	position += direcao * velocidade * delta
	
func direcaoDesejada(dirAlvo):
	var direcao = dirAlvo - position
	return direcao.clamped(1)



func rotacionar(posicaoJogador):
	var direcao = direcaoDesejada(posicaoJogador)
	var angulo = direcao.angle()
	rotation = angulo
