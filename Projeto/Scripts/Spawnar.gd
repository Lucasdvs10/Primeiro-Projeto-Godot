extends Node2D

onready var rng = RandomNumberGenerator.new()

var arrayAndante = []
var arrayVoador = []
var arrayNadador = []

onready var andante = preload("res://InimigoAndante.tscn")
onready var nadador = preload("res://InimigoNadador.tscn")
onready var voador  = preload("res://InimigoVoador.tscn")

var pontuacao = 0

func _ready():
	self.set_process(false)

func novoJogo():
	pontuacao = 0
	$TimerPontuacao.start()
	self.set_process(true)

func fimDeJogo():
	$TimerPontuacao.stop()
	get_tree().reload_current_scene()

func _process(delta):
	if probabilidade(0.8):
		var objetoAndante = andante.instance()
		arrayAndante.append(objetoAndante)
		add_child(objetoAndante)
		
	if probabilidade(0.8):
		var objetoNadador = nadador.instance()
		arrayNadador.append(objetoNadador)
		add_child(objetoNadador)
		
	if probabilidade(0.8):
		var objetoVoador = voador.instance()
		arrayVoador.append(objetoVoador)
		add_child(objetoVoador)
		
	
	
func on_deletar(objeto):
	objeto.queue_free()



func probabilidade(chance):
	rng.randomize()
	var numAleatorio = rng.randf_range(0,100)
	
	if numAleatorio < chance:
		return true
	else:
		return false


func _on_TimerPontuacao_timeout():
	pontuacao +=1
	$Hud.atualizaPontuacao(pontuacao)


func _on_Hud_comecarJogo():
	novoJogo()


func _on_Jogador_area_entered(area):
	fimDeJogo()
