# Projeto 2: Processador compatível com MIPS DLX

Este projeto é a implementação de um processador RISC de 32 bits com **Pipeline**, compatível com o MIPS DLX.

## Hardware:
 
- `FPGA DE0-CV`

## Instruções:

- Grupo A:
  - Carrega palavra (load word: lw)
  - Armazena palavra (store word: sw)
  - Soma (add)
  - Subtração (sub)
  - E lógico (AND)
  - OU lógico (OR)
  - Comparação menor que (set if less than: slt)
  - Desvio se igual (branch equal: beq)
  - Salto incondicional (jump: j)
  
- Grupo B:
  - Carrega imediato para 16 bits MSB (load upper immediate: lui)
  - Soma com imediato (addi)
  - E lógico com imediato (ANDI)
  - OU lógico com imediato (ORI)
  - Comparação menor que imediato (set if less than: slti)
  - Desvio se não igual (branch not equal: bne)
  - Salto e conecta (jump and link: jal)
  - Salto por registrador (jump register: jr)
  
## Diagrama:

![alt text](https://github.com/lucasmuchaluat/DesignComputadores/blob/master/ProjetoMIPS/diagramaPipe.png?raw=true)

## Manual de operações:

Para testar o projeto, basta colocar um código em assembly na ROM:

 - https://github.com/lucasmuchaluat/DesignComputadores/blob/master/ProjetoMIPS/ROMMIPS.vhd.
 
Depois compile o projeto na FPGA. Para passar uma unidade de clock, aperte o `KEY 0`, os displays irão mostrar os sinais de saida do programa, de acordo com as seguintes combinações de `SW0` e `SW1`:

- `00` -> PC
- `10` -> Endereço saída ULA
- `01` -> Dado a ser escrito no registrador 3
- `11` -> Endereço de escrita RAM
