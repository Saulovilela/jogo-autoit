; Função principal do jogo
Func PlayGame($iMaxNumber)
    Global $iRandomNumber = Random(0, $iMaxNumber, 1) ; Gera um número aleatório entre 0 e $iMaxNumber
    Global $iAttempts = 0

    While True
        $sInput = InputBox("Jogo de Adivinhação", "Digite seu palpite entre 0 e " & $iMaxNumber & ":", "", "", -1, -1, 0, 0)
        
        ; Verifica se o usuário cancelou a entrada
        If @error Then
            MsgBox(0, "Jogo de Adivinhação", "Você cancelou o jogo. O número era " & $iRandomNumber & ".")
            Exit
        EndIf

        If StringIsInt($sInput) Then
            $iGuess = Int($sInput)
            $iAttempts += 1

            If $iGuess < $iRandomNumber Then
                MsgBox(0, "Jogo de Adivinhação", "Muito baixo! Tente novamente.")
            ElseIf $iGuess > $iRandomNumber Then
                MsgBox(0, "Jogo de Adivinhação", "Muito alto! Tente novamente.")
            Else
                MsgBox(0, "Parabéns!", "Você adivinhou o número " & $iRandomNumber & " em " & $iAttempts & " tentativas!")
                Exit
            EndIf
        Else
            MsgBox(0, "Erro", "Por favor, insira um número válido.")
        EndIf
    WEnd
EndFunc

; Inicializa o jogo com escolha de intervalo

While True
    $iChoice = MsgBox(3, "Escolha o intervalo", "Escolha o intervalo para adivinhar: Sim para a opção 0 a 100, Não para avançar para a opções 0 a 50 e 0 a 10" & @CRLF & "0 a 100" & @CRLF & "0 a 50" & @CRLF & "0 a 10")

    If $iChoice == 2 Then ; Cancelar
        Exit
    ElseIf $iChoice == 6 Then ; Sim
        PlayGame(100)
    ElseIf $iChoice == 7 Then ; Não
        $iSubChoice = MsgBox(3, "Escolha o intervalo", "Escolha o intervalo para adivinhar: Sim para a opção 0 a 50, Não para a opção 0 a 10" & @CRLF & "0 a 50" & @CRLF & "0 a 10")
        
        If $iSubChoice == 2 Then ; Cancelar
            Exit
        ElseIf $iSubChoice == 6 Then ; Sim
            PlayGame(50)
        ElseIf $iSubChoice == 7 Then ; Não
            PlayGame(10)
        EndIf
    EndIf
WEnd
