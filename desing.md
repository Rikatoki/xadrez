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
	// ATENÇÃO
		Talvez seja melhor mudar o código de forma arquitetural (Ou apenas implementar a idéia)
		É provável que seja melhor que as próprias ChessPiece realizam a ação do contato com as ChessSquare, e então se o caso, a ação do contato com outra ChessPiece.
		Talvez seja necessário remover o ChessManager, ou o ChessPiece usá-lo.
	* Como criar a mecânica de turnos?
	* Devo criar uma classe para representar as movimentações das peças?
		Essa classe deverá receber a casa atual e as casas existentes, e a partir daí ela cria as casas na qual a peça poderá ir, usada de base para polimorfismo.
	* Como que as ChessSquares podem ter coordenadas composta por colunas com letras e linhas com números?
	* Devo entregar um relatório de fim da partida?
		Resolve problema de não conhecer quem foi o vencedor
		Pode conter informações gerais da partida

### Entidade do Xadrez (ChessEntity) -> Object
- Representa a entidade que jogará o xadrez
- Cótem lista das suas peças
- Atributos:
	- Lista de peças da entidade: List[ChessPiece]
- Métodos:
	- Peças no tabuleiro: List[ChessPiece]
	- Peças fora do tabuleiro: List[ChessPiece]

### Jogo do Xadrez (ChessGame) -> Object
- Representa o próprio jogo em si
- Contém regras do jogo
* Pode conter máquina de estados, pois o jogo deve ter um inicio meio e fim.
- Atributos:
	- manager: ChessManager // Por meio do Manager que ele faz a manipulação de peças no tabuleiro
	- Jogador 1: ChessEntity
	- Jogador 2: ChessEntity
- Métodos:
	- Iniciar jogo(jogador1: ChessPlayer//ChessBot, jogador2: ChessPlayer//ChessBot): Void // Inicia o jogo do xadrez, cria as peças iniciais e coloca elas em suas posições, etc.
	- Mover peça(Peça: ChessPiece, para a casa: ChessSquare) // Requisita em ChessPiece a interação da peça na casa escolhida, e então decide se move ela ou não.
	- Pegar Jogador1: ChessEntity
	- Pegar Jogador2: ChessEntity
	- Escolher peça(Peça: ChessPiece): List[ChessSquare] // Escolhee uma peça retorna todas as casas que ela pode movimentar
	- É CheckMate?: Bool // Regra de checkmate
	- É Empate?: Bool // Regra de empate
	- Acabar Jogo: Void // Acaba com a partida (Pode ser usada para retonar um relatório, pode tirar os jogadores do jogo, etc)

### Gerenciador do Xadrez (ChessManager) -> Object
- Representa a manipulação entre as peças e o tabuleiro
- Contém toda a lógica de gerenciamento de peças
- Atributos:
	- chessboard: Chessboard
- Métodos:
	- Pegar tabuleiro: Chessboard
	- Mover peça no tabuleiro(peça: ChessPiece, para a casa: ChessSquare): Void
	- Remover peça do tabuleiro(peça: ChessPiece): Void
	- Adicionar peça no tabuleiro(peça: ChessPiece, para a casa: ChessSquare): Void
	- Modificar/Substituir peça no tabuleiro(peça: ChessPiece, nova peça: ChessPiece): Void

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
	- Peça no quadrado: ChessPiece
- Métodos:
	- Pegar Cordenada
	- Tem peça?: Bool
	- Pegar Peça: ChessPiece
	- Remover Peça // Remove sua ligação com a peça
	- Pegar Cor: Int/Bool

### Peça de Xadrez (ChessPiece) -> Object | Inheritance
- Representa cada peça do xadrez
- Servirá de base para herança
- Atributos:
	- Casa atual: ChessSquare
	- Cor da peça:
		0 / bool=true: Cor 1
		1 / bool=false: Cor 2
- Métodos:
	- @abstract Casas disponíveis (casa atual: ChessSquare, tabuleiro: Chessboard): List[ChessSquares]
		Verá as casas existentes e usará lógica de matrizes para determinar a movimentação
	- @abstract Interagir com a casa(casa: ChessSquare) // Realiza a interação com a casa
	// EM DÚVIDA:
		- @abstract Interagir(peça: ChessPiece) // Realiaza a interação com a peça (Se remove ela do tabuleiro, se troca de lugar com ela, etc.) (Pode estar integrada dentro do Interagir_com_a_casa())
	- Remover do tabuleiro // Remove sua ligação com o ChessSquare
	- Pegar cor: Int/Bool
