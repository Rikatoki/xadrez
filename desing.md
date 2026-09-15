# Game Desing Document (GDD)
Nome do projeto: Aprendendo a criar jogos completos

Nome do jogo original: Xadrez

Nome do jogo: ""

Gênero: #Estratégia #Tabuleiro

Plataformas: #Web

---

## *Sistemas principais*

É necessário lembrar que as classes irá se expandir conforme a necessidade na produção.

Dicas:
1. Não tente fazer tudo de uma só vez, foque apenas em uma única coisa.
2. As classes devem expandir comforme a necessidade.
3. Tenha um bom nível de desing.

---

### Lógica

Toda a lógica principal do jogo ficará aqui, completamente separado da interface gráfica.

---

#### *ChessEngine*

Classe central da lógica do xadrez, funcionando como um núcleo. Será composta por várias classes - cada uma com um propósito, conectando elas.

**Responsabilidades:**
* Reduzir o acoplamento entre os módulos/classes sendo uma ponte para a comunicação entre os mesmos.
* Centralizar a lógica do xadrez numa única interface. 
* Conterá todas as etapas do xadrez:
	1. Início do xadrez *(new_game)*
	2. Coreloop *(next_turn, sistema de rodadas)*
	3. Regras do xadrez *(check, checkmate, etc.)*
	4. Conclusão *(relatório)*

---

#### *ChessRules*

**Responsabilidades:**
- Centralização das lógicas do xadrez
- Conterá todas as regras macro do xadrez, como check/checkmate.

---

#### *Chessboard*

**Responsabilidades:**
- Contém o conjunto de casas/squares.
- Servir de interface para a interação com cada square.
- Centralizar todo o conceito de tabuleiro do xadrez.

**Propriedades:**
- *board Dictionary[Vector2i, object]*: Representa o tabuleiro

##### ***Como vai funcionar?***
*board* será um dicionário que conterá coordenadas como chave, e a peça como valor. Toda a interação com os squares - como "Tem uma peça nessa coordenada?", será feita por meio do **Chessboard**.

---

#### *ChessPlayer*
**Responsabilidades:**
- Representa o jogador do xadrez.
- Centralização da conversa entre o jogador - seja IA ou um humano, com o ChessEngine.

**Propriedades:**
- *team [ChessEnums](#chessenums).ChessTeam*
- *pieces Array[[ChessPieces]](#chesspieces)*

---

#### *ChessPieces*

**Responsabilidades:**
- Representa cada peça

**Propriedades:**
- *coordinate Vector2i*
- *team [ChessEnums](#chessenums).ChessTeam*
- *has_moved bool*

##### ***Como vai funcionar?***
**ChessPiece** será uma representação das peças, as movimentações, identificação de cada peça e regras especiais do mesmo.

---

#### *PieceMovements*
**Responsabilidades:**
- Centralizar a lógica de movimentação das peças.

##### ***Como vai funcionar?***
Toda a interação que envolva a movimentação de uma peça - seja a própria peça entregar suas possíveis movimentações ou então verificação de movimento (como check e checkmates), será por meio dessa classe.

---

#### *ChessVariables*

**Responsabilidade:** Centralizar as variáveis/constantes na qual 2 ou mais classes usarão.

**Propriedades:**
- *LINES int*: A quantidade máxima de linhas do tabuleiro.
- *COLUMNS int*: A quantidade máxima de colunas do tabuleiro.

---

#### *ChessEnums*

**Responsabilidade:** Centralizar as enumerações na qual 2 ou mais classes usarão.

**Propriedades:**
- *ChessTeam [WHITE, BLACK]*: Representa o lado do time.

---

#### *Sugestões*


*PieceMove*  
Essa classe representa a ação da movimentação.  

***Implementação***: Ao invés das Piece's entregar uma lista de coordenadas, elas criam uma lista de PieceMove. Então, o ChessEngine receberá o PieceMove e o executará usando uma função base do mesmo. 

***Movitos para implementar***:  
- É possível facilitar a idêntificação do tipo da ação que a peça irá fazer, considerando que cada tipo herdará de PieceMove e ficará como: CapturePiece.
- Abstrai o conceito de ação de uma peça.

--- 

### Visual

Toda a lógica da interface gráfica fica aqui, totalmente separada da lógica do jogo.

---
