INIT:
    #Cria as constantes
    Movc $1, %ONE
    Movc $0, %ZERO
    Movc $9, %NINE
    Movc $5, %FIVE
    Movc $2, %TWO
    Movc $8, %EIGHT
    Movc $3, %THREE
    Jmp MAIN

MAIN:
    #Zera flag 12
    Movc $0, %FLAG

    #Zera os registradores do tempo
    #Hora
    Movc $0, %HH
    Movc $0, %hh

    #Minuto
    Movc $0, %MN
    Movc $0, %mn

    #Segundos
    Movc $0, %SS
    Movc $0, %ss
    Jmp NORMAL

NORMAL:
    #Inicio da logica para determinar se passou de 12 horas
    Cmp %HH, %ONE
    Je CHECK_hh
    Jmp NORMAL2

NORMAL2:
    #Coloca os valores temporais nos displays
    Store $14, %ss
    Store $15, %SS
    Store $17, %MN
    Store $16, %mn

    #Observa o valor do SW[2]
    #Caso acionado vai para o looping AM
    Load $2, %INTER
    Cmp %ONE, %INTER
    Je AM
    Jmp NORMAL3

NORMAL3:
    #Escreve o valor das horas PM
    Store $18, %hh
    Store $19, %HH
    Jmp NORMAL4

NORMAL4:
    #Observa o valor do SW[3]
    #Caso acionado vai para o looping que ajusta o tempo
    Load $3, %INTER
    Cmp %ONE, %INTER
    Je CHANGE_TIME
    Jmp COUNTER

AM:
    #Looping que controla o processo de conversão de horário para AM
    #Checa se a flag de 12 horas é verdade
    Store $20, %FLAG
    Cmp %FLAG, %ONE
    #Caso verdade vai para o looping de conversão
    Je PASS12
    #Caso o contrario volta para a rotina PM
    Jmp NORMAL3

PASS12:
    #Looping que controla o processo de conversão de horário para AM
    #Checa se a dezena das horas é igual a 1
    Cmp %HH, %ONE
    #Caso verdade vai para o looping que converte das 13 horas PM as 19 horas PM horas para 1 hora AM as 7 horas AM
    Je AM1319
    #Caso contrario a dezena das horas deve ser 2, sendo assim o codigo vai para o looping que converte das 20 horas PM as 23 horas PM horas para 8 hora AM as 11 horas AM
    Jmp AM2024

AM1319:
    #Looping que converte das 13 horas PM as 19 horas PM para, 1 hora AM as 7 horas AM
    #Zera a dezena de horas
    Store $19, %ZERO
    #Subrai 2 da primeira casa decimal das horas
    Sub %hh, %TWO, %INTER
    Store $18, %INTER
    #Volta para logica de incremento
    Jmp NORMAL4
    
AM2024:
    #Looping que converte das 20 horas PM as 23 horas PM para, 8 horas AM as 11 horas AM
    #Checa se a segunda casa decimal das horas é 0 ou 1
    Cmp %hh, %ZERO 
    Je AM2021
    Cmp %hh, %ONE
    Je AM2021
    #Caso verdade vai para o looping que realiza a conversão de 20 horas PM e 21 horas PM, para as 8 horas AM e 9 horas AM

    #Rotina que realiza a conversão de 22 horas PM e 23 horas PM, para as 10 horas AM e 11 horas AM
    #Coloca um na dezena de horas
    Store $19, %ONE
    #Subrai 2 da primeira casa decimal das horas
    Sub %hh, %TWO, %INTER
    Store $18, %INTER
    #Volta para logica de incremento
    Jmp NORMAL4

    

AM2021:
    #Zera a dezena de horas
    Store $19, %ZERO
    #Soma 8 na primeira casa decimal das horas
    Add %EIGHT, %hh, %INTER
    Store $18, %INTER
    #Volta para logica de incremento
    Jmp NORMAL4

CHECK_hh:
    #Checa se a dezena das horas passou de 2
    Cmp %hh, %THREE
    #Vai para o looping que coloca 1 na Flag
    Je FLAG12
    #Volta para logica de incremento
    Jmp NORMAL2

FLAG12:
    #Coloca 1 na Flag quando passar de 12 horas PM
    Movc $1, %FLAG
    Jmp NORMAL2

CHANGE_TIME:
    BUT0_P:
        #Observa o valor do BUT[0]
        Load $8, %INTER
        #Verifica se ele foi apertado
        Cmp %ZERO, %INTER
        Je BUT0_R

    BUT1_P:
        #Observa o valor do BUT[1]
        Load $9, %INTER
        #Verifica se ele foi apertado
        Cmp %ZERO, %INTER
        Je BUT1_R

Jmp NORMAL2

    BUT1_R:
        #Observa o valor do BUT[1]
        Load $9, %INTER
        #Verifica se ele foi solto
        Cmp %ONE, %INTER
        #Incrementa horas
        Je HOUR
        Jmp BUT1_R
        
    BUT0_R:
        #Observa o valor do BUT[0]
        Load $8, %INTER
        #Verifica se ele foi solto
        Cmp %ONE, %INTER
        #Incrementa minutos
        Je MINUTE
        Jmp BUT0_R

COUNTER:
    #Observa a base temporal e checa se passou um segundo
    Load $12, %SECOND
    Cmp %ONE, %SECOND
    #Caso verdade incrementa 1 segundo
    Je SECOND
    Jmp NORMAL

SECOND:
    #Limpa a base de tempo
    Load $13, %SECOND

    #Verifica se passaram 9 segundos
    Cmp %ss, %NINE
    #Caso verdade vai para o looping da casa decimal
    Je SECOND_DECIMAL
    #Incrementa 1 a unidade de segundos
    Add %ONE, %ss, %INTER
    Movr %INTER, %ss
    Jmp NORMAL

SECOND_DECIMAL:
    #Zera a primeira casa decimal dos segundos
    Movr %ZERO, %ss
    #Checa se passou 59 segundos
    Cmp %SS, %FIVE
    #Caso verdade vai para o looping dos minutos
    Je MINUTE
    #Incrementa 1 na segunda casa decimal dos segundos
    Add %ONE, %SS, %INTER
    Movr %INTER, %SS
    Jmp NORMAL

MINUTE:
    #Zera a segunda casa decimal dos segundos
    Movr %ZERO, %SS
    #Checa se passou 9 minutos
    Cmp %mn, %NINE
    #Caso verdade vai para o looping da casa decimal
    Je MINUTE_DECIMAL
    #Incrementa 1 minuto
    Add %ONE, %mn, %INTER
    Movr %INTER, %mn
    Jmp NORMAL

MINUTE_DECIMAL:
    #Zera a primeira casa decimal dos minutos
    Movr %ZERO, %mn
    #Checa se passou 59 minutos
    Cmp %MN, %FIVE
    #Caso verdade vai para o looping de horas
    Je HOUR
    #Incrementa 1 na segunda casa decimal dos minutos
    Add %ONE, %MN, %INTER
    Movr %INTER, %MN
    Jmp NORMAL

HOUR:
    #Zera a segunda casa decimal dos minutos
    Movr %ZERO, %MN
    #Checa se passaram 9 horas
    Cmp %hh, %NINE
    #Caso verdade vai para o looping da casa decimal
    Je HOUR_DECIMAL

    #Checa se passaram 3 horas (23:59)
    Cmp %hh, %THREE
    #Caso verdade vai para looping de checagem de dia
    Je DAY    
HOUR_DECIMAL_CONTINUE:
    #Incrementa 1 na primeira casa decimal das horas
    Add %ONE, %hh, %INTER
    Movr %INTER, %hh
    Jmp NORMAL

HOUR_DECIMAL:
    #Zera a primeira casa decimal dos minutos
    Movr %ZERO, %hh
    #Adiciona 1 primeira casa decimal dos minutos
    Add %ONE, %HH, %INTER
    Movr %INTER, %HH
    Jmp NORMAL

DAY:
    #Checa se passaram 20 horas (23:59) 20 + 3
    Cmp %HH, %TWO
    #Caso verdade limpa o relogio
    Je MAIN
    #Caso o contrario continua a rotina decimal
    Jmp HOUR_DECIMAL_CONTINUE