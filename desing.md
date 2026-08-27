# Game Desing Document (GDD)
Nome do projeto: Aprendendo a criar jogos completos -- Xadrez
Nome do jogo original: Xadrez
Nome do jogo: ""
Gênero: [Estratégia] [Tabuleiro]
Plataformas: [Windows] [Web]

## Sistemas principais
- Toda a lógica herdará de Object
- Código gráfico herdará de Node2D e usará as classes criadas de Object

### Gerenciador do Xadrez (ChessManager) -> Object
- Representa o tabuleiro em si
- Contém toda a lógica de gerenciamento de peças
- Atributos:
	- chessboard -> Chessboard
- Métodos:
	- Posições das peças
	- Mover peças
	- Remover peças
	- Adicionar peças
	- Modificar peças

### Tabuleiro (Chessboard)
- Representa o tabuleiro
- Terá um conjunto de ChessSquares
- Atributos:
	- Matriz de ChessSquares 8x8

#### As Casas (ChessSquares) -> Object
- Representa cada casa do tabuleiro
- Atributos:
	- Cordenadas:
		letras (a-h) -> Coluna
		números (1,8) -> Linha
	- Cor da casa:
		0 / bool=true -> Cor 1
		1 / bool=false -> Cor 2

### Peça de Xadrez (ChessPiece) -> Object | Inheritance
- Representa cada peça do xadrez
- Servirá de base para herança
- Atributos:
	- Cor da peça:
		0 / bool=true -> Cor 1
		1 / bool=false -> Cor 2
