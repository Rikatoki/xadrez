# Game Desing Document (GDD)
Nome do projeto: Aprendendo a criar jogos completos -- Xadrez
Nome do jogo original: Xadrez
Nome do jogo: ""
Gênero: [Estratégia] [Tabuleiro]
Plataformas: [Windows] [Web]

## Sistemas principais
Haverá uma clara diferença entre a lógica e a representação 2D do jogo, toda a parte 2D irá apenas traduzir o código.
- Fluxo do jogo em código:
	- Início do jogo:
		ChessGame > (Cria as peças iniciais da entidade) ChessEntity (Cria o tabuleiro do xadrez) Chessboard (Coloca cada peça em sua posição inicial) Chessboard
	- Jogando:
		ChessEntity > (Seleciona peça na qual quer usar) ChessPiece (Retorna casas na qual pode interagir) ChessSquare (Seleciona a casa) ChessPiece (Passa a casa para a peça e ela faz sua lógica de interação) ChessPiece
	- Progresso do jogo:
		ChessGame > (Inicia a rodada da entidade) ChessEntity {Jogando} ChessRules (Verifica as regras do jogo e age de acordo) ChessGame (Vai para a próxima rodada se possível) ChessGame
- Toda a lógica herdará de Object
- Código gráfico herdará de Node2D e usará as classes criadas de Object
Problemas principais:
	* Como criar a mecânica de turnos? -> RESOLVeNDO
	* Devo criar uma classe para representar as movimentações das peças?
		Essa classe deverá receber a casa atual e as casas existentes, e a partir daí ela cria as casas na qual a peça poderá ir, usada de base para polimorfismo.
	* Como que as ChessSquare podem ter coordenadas composta por colunas com letras e linhas com números?
	* Devo entregar um relatório de fim da partida?
		Resolve problema de não conhecer quem foi o vencedor
		Pode conter informações gerais da partida

### Lógica

- Jogo do Xadrez (ChessGame) -> Node
	- Representa o jogo
	- Usa o ChessMatch // Lógica do jogo de xadrez
	- Conecta a lógica com a interface

- Jogo do Xadrez (ChessMatch) -> Object
	- Representa a parte lógica das particas
	- Contém o sistema de turnos
	- Usa os componentes
	Atributos:
		- Estado do jogo: IDLE, NEW_GAME, WHITE_TURN, BLACK_TURN, END_TURN, VITORIA, EMPATE
		- Regras: ChessRules
		- Jogador braco: ChessEntity
		- Jogador preto:  ChessEntity
		- Tabuleiro: Chessboard
	Métodos:
		- Novo jogo(branco: ChessEntity, preto: ChessEntity)
			// Configura as entidades, cria e configura o Chessboard, cria o ChessRules. Cria e determina as posições iniciais das peças de cada entidade.
		- Turno branco
			// Realiza o turno do jogador branco
		- Turno preto
			// Realiza o turno do jogador preto
		- Fim do turno
			// Chamada após cada fim de turno, faz as verificações de regras e etc. Decide o próximo estado de acordo com condições
		- Vitoria(vencedor: ChessEntity)
		 	// Fim do jogo: Checkmate
		- Empate
			// Fim do jogo: Empate
- Entidade do Xadrez (ChessEntity) -> Object
	- Representa a entidade que jogará o xadrez
	- Cótem lista das suas peças
	Atributos:
		- Cor do lado:
			0 / bool=true: Cor 1
			1 / bool=false: Cor 2
		- Lista de peças da entidade: Array[ChessPiece]
	Métodos:
		- @abstract Jogar a rodada
			// Lógica de ação da rodada || Ex: Algoritmo de IA ou criar interface para o usuário interagir.
		- @abstract  Promover peão(peão: Pawn)
		- Peças no tabuleiro: Array[ChessPiece]
		- Peças fora do tabuleiro: Array[ChessPiece]

- Regras do Xadrez (ChessRules) -> Object
	- Contém regras do jogo em relação ao tabuleiro
	Atributos:
		- chessboard: Chessboard
	Métodos:
		- É CheckMate?: Bool // Regra de checkmate
		- É Empate?: Bool // Regra de empate

- Tabuleiro (Chessboard)
	- Representa o tabuleiro
	- Terá um conjunto de ChessSquare
	- Atribui as coordenadas aos ChessSquare
	Atributos:
		- Matriz de ChessSquare 8x8: Array[ChessSquare]
	Métodos:
		- Criar Matriz
			Cria instâncias de ChessSquare
			Atribui coordenadas
		STATIC:
			- Mover peça no tabuleiro(peça: ChessPiece, para a casa: ChessSquare): Void
			- Remover peça do tabuleiro(peça: ChessPiece): Void
			- Adicionar peça no tabuleiro(peça: ChessPiece, para a casa: ChessSquare): Void
			// EM DÚVIDA:
				- Modificar/Substituir peça no tabuleiro(peça: ChessPiece, nova peça: ChessPiece): Void

- As Casas (ChessSquare) -> Object
	- Representa cada casa do tabuleiro
	Atributos:
		- Cordenada: Vector2i
			y = letras (a-h): Coluna
			x = números (1,8): Linha
		- Cor da casa:
			0 / bool=true: Cor 1
			1 / bool=false: Cor 2
		- Pertence a este tabuleiro: Chessboard
		- Peça no quadrado: ChessPiece
	Métodos:
		- Pegar Cordenada
		- Tem peça?: Bool
		- Pegar tabuleiro: Chessboard
		- Pegar Peça: ChessPiece
		- Pegar Cor: Int/Bool

- Peça de Xadrez (ChessPiece) -> Object | Inheritance
	- Representa cada peça do xadrez
	- Servirá de base para herança
	Atributos:
		- Casa atual: ChessSquare
		- Cor da peça:
			0 / bool=true: Cor 1
			1 / bool=false: Cor 2
	Métodos:
		- @abstract Casas disponíveis: Array[ChessSquare]
			Verá as casas existentes e usará lógica de matrizes para determinar a movimentação
		- @abstract Interagir com a casa(casa: ChessSquare) // Realiza a interação com a casa
		- Está no tabuleiro: Bool
			True se a casa atual não for null
		- Pegar cor: Int/Bool

### Visual
Paradigma 1 - Abstração máxima:
	Representa a tabela como um todo > ChessTable:
		- API para input do jogador / Ler input
		- Atualiza de forma automática de acordo com o estado do jogo
	Representa cada quadrado da tabela > TableSquare:
		- Tem referência o ChessSquare
		- Pode atualizar para refletir o estado do ChessSquare
	Representa as peças > TablePiece:
		- Tem referência o ChessPiece
		- Determina o visual da peça

- Tabela (ChessTable) -> Node2D
