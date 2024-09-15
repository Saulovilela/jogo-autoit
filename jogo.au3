; Fun��o principal do jogo
Func PlayGame($iMaxNumber)
    Global $iRandomNumber = Random(0, $iMaxNumber, 1) ; Gera um n�mero aleat�rio entre 0 e $iMaxNumber
    Global $iAttempts = 0

    While True
        $sInput = InputBox("Jogo de Adivinha��o", "Digite seu palpite entre 0 e " & $iMaxNumber & ":", "", "", -1, -1, 0, 0)
        
        ; Verifica se o usu�rio cancelou a entrada
        If @error Then
            MsgBox(0, "Jogo de Adivinha��o", "Voc� cancelou o jogo. O n�mero era " & $iRandomNumber & ".")
            Exit
        EndIf

        If StringIsInt($sInput) Then
            $iGuess = Int($sInput)
            $iAttempts += 1

            If $iGuess < $iRandomNumber Then
                MsgBox(0, "Jogo de Adivinha��o", "Muito baixo! Tente novamente.")
            ElseIf $iGuess > $iRandomNumber Then
                MsgBox(0, "Jogo de Adivinha��o", "Muito alto! Tente novamente.")
            Else
                MsgBox(0, "Parab�ns!", "Voc� adivinhou o n�mero " & $iRandomNumber & " em " & $iAttempts & " tentativas!")
                Exit
            EndIf
        Else
            MsgBox(0, "Erro", "Por favor, insira um n�mero v�lido.")
        EndIf
    WEnd
EndFunc

; Inicializa o jogo com escolha de intervalo

While True
    $iChoice = MsgBox(3, "Escolha o intervalo", "Escolha o intervalo para adivinhar: Sim para a op��o 0 a 100, N�o para avan�ar para a op��es 0 a 50 e 0 a 10" & @CRLF & "0 a 100" & @CRLF & "0 a 50" & @CRLF & "0 a 10")

    If $iChoice == 2 Then ; Cancelar
        Exit
    ElseIf $iChoice == 6 Then ; Sim
        PlayGame(100)
    ElseIf $iChoice == 7 Then ; N�o
        $iSubChoice = MsgBox(3, "Escolha o intervalo", "Escolha o intervalo para adivinhar: Sim para a op��o 0 a 50, N�o para a op��o 0 a 10" & @CRLF & "0 a 50" & @CRLF & "0 a 10")
        
        If $iSubChoice == 2 Then ; Cancelar
            Exit
        ElseIf $iSubChoice == 6 Then ; Sim
            PlayGame(50)
        ElseIf $iSubChoice == 7 Then ; N�o
            PlayGame(10)
        EndIf
    EndIf
WEnd
