extends Area2D

var posicaoJogador:Vector2
onready var rng = RandomNumberGenerator.new()
onready var tamanhoColisor = get_node("CollisionShape2D").shape.extents
onready var tamanhoTela = get_viewport_rect().size
onready var direcao:Vector2
const velocidade = 300

signal deletar(objeto)

func _ready():
	posicaoJogador = get_node('../Jogador').position
	
	rng.randomize()
	var yAleatorio = rng.randf_range(-tamanhoColisor.y-10, tamanhoTela.y + tamanhoColisor.y + 10)
	position = Vector2(tamanhoTela.x +10, yAleatorio)
	
	if probabilidade(50): #50% vindo da esquerda 50% da direita
		position.x = -10
	
	direcao = direcaoDesejada(posicaoJogador)

	rotacionar(posicaoJogador)
	
	self.connect('deletar', get_node('..'), 'on_deletar')

func _process(delta):
	position += direcao * velocidade * delta
	
	delete()
	
func direcaoDesejada(dirAlvo):
	var direcao = dirAlvo - position
	return direcao.clamped(1)


func rotacionar(posicaoJogador):
	var direcao = direcaoDesejada(posicaoJogador)
	var angulo = direcao.angle()
	rotation = angulo


func probabilidade(chance):
	rng.randomize()
	var numAleatorio = rng.randf_range(0,100)
	
	if numAleatorio < chance:
		return true
	else:
		return false

func delete():
	
	if position.x > (tamanhoTela.x + 100) or position.x < -100:
		emit_signal('deletar', self)
		
	if position.y < -100 or position.y > tamanhoTela.y + 100:
		emit_signal('deletar', self)
		 
