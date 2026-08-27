# Game Desing Document (GDD)
Nome do projeto: Aprendendo a criar jogos completos -- Xadrez
Nome do jogo original: Xadrez
Nome do jogo: ""
Gênero: [Estratégia] [Tabuleiro]
Plataformas: [Windows] [Web]

## Sistemas principais
- Toda a lógica herdará de Object
- Código gráfico herdará de Node2D e usará as classes criadas de Object
Problemas principais:
	* Como criar a mecânica de turnos?
	* Como que as ChessSquares podem ter coordenadas composta por colunas com letras e linhas com números?
	* Devo entregar um relatório de fim da partida?
		Resolve problema de não conhecer quem foi o vencedor
		Pode conter informações gerais da partida

### Jogador do Xadrez (ChessPlayer) -> Object
// AVISO -- Posso criar uma classe base para ele e colocar a lista de peças dentro dessa base.
- Representa o jogador
- Cótem lista das suas peças
- Atributos:
	- Lista de peças do jogador: List[ChessPiece]

### Jogo do Xadrez (ChessGame) -> Object
- Representa o próprio jogo em si
- Contém regras do jogo
* Pode conter máquina de estados, pois o jogo deve ter um inicio meio e fim.
- Atributos:
	- manager: ChessManager
	// Em dúvida:
		- Jogador 1: ChessPlayer // ChessBot
		- Jogador 2: ChessPlayer // ChessBot
- Métodos:
	- É CheckMate?: Bool
	- É Empate?: Bool

### Gerenciador do Xadrez (ChessManager) -> Object
- Representa a manipulação entre as peças e o tabuleiro
- Contém toda a lógica de gerenciamento de peças
- Atributos:
	- chessboard: Chessboard
- Métodos:
	- Pegar tabuleiro: Chessboard
	- Mover peça no tabuleiro(peça: ChessPiece, nova coordenada: Vector2i): Void
	- Remover peça do tabuleiro(peça: ChessPiece): Void
	- Adicionar peça no tabuleiro(peça: ChessPiece, pos: Vector2i): Void
	- Modificar/Substituir peça no tabuleiro(peça: ChessPiece, nova peça: ChessPiece): Void
	// Em Dúvida:
		- É CheckMate?: Bool
		- É Empate?: Bool

### Tabuleiro (Chessboard)
- Representa o tabuleiro
- Terá um conjunto de ChessSquares
- Atribui as coordenadas aos ChessSquares
- Atributos:
	- Matriz de ChessSquares 8x8: List[ChessSquares]
- Métodos:
	- Criar Matriz
		Cria instâncias de ChessSquares
		Atribui coordenadas

#### As Casas (ChessSquares) -> Object
- Representa cada casa do tabuleiro
- Atributos:
	- Cordenada: Vector2i
		letras (a-h): Coluna
		números (1,8): Linha
	- Cor da casa:
		0 / bool=true: Cor 1
		1 / bool=false: Cor 2
	- Peça: ChessPiece
- Métodos:
	- Pegar Cordenada
	- Tem peça?: Bool
	- Pegar Peça: ChessPiece
	- Pegar Cor: Int/Bool

### Peça de Xadrez (ChessPiece) -> Object | Inheritance
- Representa cada peça do xadrez
- Servirá de base para herança
- Atributos:
	- Cor da peça:
		0 / bool=true: Cor 1
		1 / bool=false: Cor 2
- Métodos:
	- @abstract Casas disponíveis (casa atual: ChessSquare, tabuleiro: Chessboard): List[ChessSquares]
		Verá as casas existentes e usará lógica de matrizes para determinar a movimentação
	- Pegar cor: Int/Bool
