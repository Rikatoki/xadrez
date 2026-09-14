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

---

### Lógica

---

#### *ChessEngine*

Conterá toda a lógica de funcionamento do xadrez, sendo uma composição de várias classes.

---

#### *Chessboard*

- **Responsabilidade**: Conter o conjunto de casas  
- **Métodos**:  
	- Pegar casa específica

---

#### *Sugestões*

---

*PieceMove*  
Essa classe representa a ação da movimentação.  

***Implementação***: Ao invés das Piece's entregar uma lista de coordenadas, elas criam uma lista de PieceMove. Então, o ChessEngine receberá o PieceMove e o executará usando uma função base do mesmo. 

***Movitos para implementar***:  
- É possível facilitar a idêntificação do tipo da ação que a peça irá fazer, considerando que cada tipo herdará de PieceMove e ficará como: MoveKillPiece (Algo assim). 
- Abstrai o conceito de ação de uma peça.

--- 

### Visual

---
