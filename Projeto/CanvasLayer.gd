extends CanvasLayer

signal comecarJogo



func _on_Button_pressed():
	emit_signal("comecarJogo")
	$TimerMensagem.start()
	$Button.hide()


func atualizaPontuacao(pontuacao):
	$Pontuacao.text = str(pontuacao)
	
func mostrarMensagem(mensagem):
	$Mensagem.text = mensagem
	$Mensagem.show()
	$TimerMensagem.start()

func mensagemGameOver():
	mostrarMensagem('Fim de jogo!')

func _on_TimerMensagem_timeout():
	$Mensagem.hide()
