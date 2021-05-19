extends Area2D

var posicaoJogador:Vector2
onready var rng = RandomNumberGenerator.new()
onready var tamanhoColisor = get_node("CollisionShape2D").shape.extents
onready var tamanhoTela = get_viewport_rect().size
onready var direcao:Vector2
export var velocidade:int

func _ready():
	posicaoJogador = get_node('../Jogador').position
	var xAleatorio = rng.randf_range(-tamanhoColisor.x-10, tamanhoTela.x + tamanhoColisor.x + 10)

	
	direcao = direcaoDesejada(posicaoJogador)


func _process(delta):
	position += direcao * velocidade * delta
	
	
func direcaoDesejada(dirAlvo):
	var direcao = dirAlvo - position
	
	return direcao.clamped(1)
