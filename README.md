# Proj-Campo_Minado
Minesweeper engine made with Ruby

Esta engine possui as seguintes classes e metodos:

```
class Minesweeper
    boolean play(coord_x, coord_y)
    boolean flag(coord_x, coord_y)
    boolean still_playing?()
    boolean victory?()
    Matrix board_state(xray: false)
end
class Board
    new(altura, largura, num_bombs)
    string to_s(xray: false)
    genBombs(largura, altura, n_bombas)   
    countBombsAround(Cell)
end
class Cell
    new(x, y)
    to_s
    Array vizinhos
end
class SimplePrinter
    string printt
end
class PrettyPrinter
    string printt(final: false)
end
```
- play: recebe as coordenadas x e y do tabuleiro e clica na célula correspondente; a célula passa a ser
"descoberta". Retorna um booleano informando se a jogada foi válida. A jogada é válida somente se a célula
selecionada ainda não foi clicada e ainda não tem uma bandeira. Caso a célula clicada seja válida, não tenha uma
bomba e seja vizinha de zero bombas, todos os vizinhos sem bomba e sem bandeira daquela célula também devem
ser descobertas, e devem seguir esta mesma lógica para seus próprios vizinhos (esse é o comportamento de
expansão quando clicamos em uma grande área sem bombas no jogo de campo minado).

- flag: adiciona uma bandeira a uma célula ainda não clicada ou remove a bandeira preexistente de uma célula.
Retorna um booleano informando se a jogada foi válida.

- still_playing?: retorna true se o jogo ainda está em andamento, ou false se o jogador tiver alcançado a condição
de vitória (todas as células sem bomba foram descobertas) ou de derrota (jogador clicou em uma célula sem
bandeira e ela tinha uma bomba).

- victory?: retorna true somente se o jogo já acabou e o jogador ganhou.

- board_state: retorna uma representação atual do tabuleiro, indicando quais células ainda não foram descobertas,
se alguma foi descoberta e tem uma bomba, quais foram descobertas e têm células com bombas como vizinhas
(indicar quantas são as vizinhas minadas), quais não estão descobertas e com bandeira. Se o cliente passar o hash
{xray: true} como parâmetro, deve indicar a localização de todas as bombas, mas somente se o jogo estiver
terminado.3. Uma célula descoberta deve saber informar o número de bombas adjacentes a ela, se houver alguma (entre 1 e
8). Se não tiver bombas adjacentes, deve ser considerada uma célula descoberta e vazia.

Possui ainda dois objetos "printer": SimplePrinter e PrettyPrinter que mostram no terminal o estado do tabuleiro. Esses printers
servem como exemplo de como um cliente pode consumir o método "board_state" dessa engine. 
