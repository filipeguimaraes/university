{-|
Module : Tarefa 1
Description : Módulo com a resolução da tarefa 1
Copyright : Filipe Guimarães <a85308@alunos.uminho.pt>; Gonçalo Ferreira <a84070@alunos.uminho.pt>
Módulo onde é definida a função "constroi :: Caminho -> Mapa" que constrói um mapa que corresponde ao caminho recebido.
-}
module Tarefa1_2017li1g49 where

import LI11718

{-|
Função que contém exemplos de caminhos para efeitos de teste.
-}
testesT1 :: [Caminho]
testesT1 = [[Avanca,CurvaDir,Sobe,CurvaDir,Avanca,CurvaDir,Desce,CurvaDir],
            [Avanca,CurvaDir,Desce,Avanca,CurvaEsq,CurvaDir,CurvaEsq,CurvaDir,CurvaDir,CurvaEsq,CurvaDir,CurvaEsq,CurvaEsq,Avanca,Avanca,Desce,CurvaDir,CurvaDir,Avanca,Avanca,Desce,CurvaEsq,CurvaDir,Sobe,CurvaDir,CurvaEsq,CurvaDir,CurvaEsq,Avanca,CurvaDir,Sobe,Sobe,Avanca,Avanca,CurvaDir,Avanca,Avanca,CurvaEsq,Avanca,CurvaDir],
            [Avanca,Avanca,CurvaEsq,Avanca,CurvaEsq,Avanca,CurvaEsq,Avanca,Avanca,Avanca,CurvaDir,Avanca,CurvaDir,Avanca,CurvaDir,Avanca],
            [Avanca,CurvaDir,Desce,CurvaEsq,Desce,Desce,Desce,CurvaDir,CurvaDir,CurvaEsq,CurvaEsq,CurvaDir,Avanca,CurvaEsq,CurvaEsq,CurvaDir,CurvaEsq,Avanca,Avanca,Avanca,Avanca,Sobe,CurvaEsq,Sobe,Sobe,Sobe,Sobe,Desce,Avanca,CurvaEsq,Avanca,Desce,Avanca,Avanca,Avanca,Avanca,Avanca,CurvaEsq,Desce,CurvaEsq,Avanca,Avanca,CurvaEsq,Avanca,Avanca,Avanca,Avanca,CurvaDir,Avanca,CurvaDir,CurvaEsq,Avanca,CurvaDir,Avanca],
            [Avanca,CurvaDir,Desce,CurvaEsq,Desce,Desce,Desce,CurvaDir,CurvaDir,CurvaEsq,CurvaEsq,CurvaDir,Avanca,CurvaEsq,CurvaEsq,CurvaDir,CurvaEsq,Avanca,Avanca,Avanca,Avanca,Sobe,CurvaEsq,Sobe,Sobe,Sobe,Sobe,Desce,Avanca,CurvaEsq,Avanca,Desce,Desce,Avanca,Avanca,Avanca,Avanca,CurvaEsq,Desce,CurvaEsq,Avanca,Sobe,CurvaEsq,Avanca,Avanca,Sobe,Sobe,CurvaDir,Avanca,CurvaDir,CurvaEsq,Avanca,CurvaDir,Avanca],
            [Avanca,CurvaEsq,CurvaDir,CurvaEsq,Sobe,CurvaEsq,CurvaDir,Desce,CurvaEsq,CurvaDir,CurvaDir,Avanca,CurvaDir,CurvaEsq,Sobe,CurvaDir,CurvaEsq,CurvaDir,CurvaEsq,CurvaDir,Sobe,CurvaDir,CurvaEsq,Sobe,CurvaDir,Desce,Desce,Avanca,Desce,CurvaDir,Avanca,CurvaEsq,CurvaDir,CurvaEsq,CurvaDir,CurvaDir,CurvaEsq,CurvaEsq,CurvaDir,CurvaEsq,CurvaEsq,CurvaDir,CurvaDir,Desce,CurvaEsq,Desce,CurvaEsq,Avanca,CurvaDir,CurvaEsq,CurvaEsq,CurvaDir,CurvaDir,CurvaEsq,CurvaEsq,CurvaDir,Sobe,CurvaEsq,CurvaEsq,CurvaDir,CurvaDir,CurvaEsq,CurvaDir,CurvaDir,CurvaEsq,Sobe,CurvaEsq,CurvaEsq,CurvaDir,CurvaEsq,CurvaDir,CurvaEsq,Avanca,CurvaDir]]

{-|
Função que dado um caminho constrói um mapa que corresponde ao caminho recebido.

== Exemplos de utilização

>>> constroi [Avanca,CurvaDir,Sobe,CurvaDir,Avanca,CurvaDir,Desce,CurvaDir]
Mapa ((2,1),Este) [[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0],[Peca Lava 0,Peca (Curva Norte) 0,Peca Recta 0,Peca (Curva Este) 0,Peca Lava 0],[Peca Lava 0,Peca (Rampa Sul) 0,Peca Lava 0,Peca (Rampa Sul) 0,Peca Lava 0],[Peca Lava 0,Peca (Curva Oeste) 1,Peca Recta 1,Peca (Curva Sul) 1,Peca Lava 0],[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0]] 
-}       
constroi :: Caminho -> Mapa
constroi c = Mapa (partida c, dirInit) tab

           where tab = (fazTabuleiro (tablava (dimensao c)) (passo2peca c dirInit 0) (posnotab (aux_posnotab dirInit c) (partida c)) ) 

{-|
Função que dado um caminho, uma orientação inicial e a altura da primeira peça devolve uma lista com as peças correspondestes a cada passo desse caminho.

== Exemplos de utilização

>>> passo2peca [Avanca,CurvaDir,Sobe,CurvaDir,Avanca,CurvaDir,Desce,CurvaDir] dirInit 0
[Peca Recta 0,Peca (Curva Este) 0,Peca (Rampa Sul) 0,Peca (Curva Sul) 1,Peca Recta 1,Peca (Curva Oeste) 1,Peca (Rampa Sul) 0,Peca (Curva Norte) 0]
-}
passo2peca :: Caminho -> Orientacao -> Altura -> [Peca]
passo2peca [] _  _ = []
passo2peca (a:b) o2 h | a == Avanca   = (Peca Recta h) : passo2peca (b) (orienta o2 a) h
                      | a == CurvaDir = (Peca (Curva (oriCurva o2 a)) h) : passo2peca (b) (orienta o2 a) h
                      | a == CurvaEsq = (Peca (Curva (oriCurva o2 a)) h) : passo2peca (b) (orienta o2 a) h
                      | a == Sobe     = (Peca (Rampa o2) h) : passo2peca (b) (orienta o2 a) (h+1)
                      | otherwise     = (Peca (Rampa (oriDesce o2)) (h-1)) : passo2peca (b) o2 (h-1)

{-|
__Função auxiliar__ da passo2peca que determina a orientação de uma peça do tipo rampa.

==Exemplos de utilização

>>> oriDesce Este
Oeste
-}
oriDesce :: Orientacao -> Orientacao
oriDesce o | o == Este  = Oeste
           | o == Oeste = Este
           | o == Sul   = Norte
           | otherwise  = Sul

{-|
__Função auxiliar__ da passo2peca que determina a orientação de uma peça do tipo curva.

==Exemplo de Orientação

>>> oricurva Este curvaDir
Este
-}
oriCurva :: Orientacao -> Passo -> Orientacao
oriCurva Este h | h == CurvaDir = Este
                | otherwise     = Sul
oriCurva Oeste h | h == CurvaDir = Oeste
                 | otherwise     = Norte
oriCurva Sul h | h == CurvaDir = Sul
               | otherwise     = Oeste
oriCurva Norte h | h == CurvaDir = Norte
                 | otherwise     = Este


{-|
Função que tendo a direção e o tipo de passo anterior calcula onde estará a próxima peça.

==Exemplo de utilização

>>>orienta Este CurvaDir
Sul
-}
orienta :: Orientacao -> Passo -> Orientacao
orienta Este h | h == CurvaDir = Sul
               | h == CurvaEsq = Norte
               | otherwise     = Este
orienta Oeste h | h == CurvaDir = Norte
                | h == CurvaEsq = Sul
                | otherwise     = Oeste
orienta Sul h | h == CurvaDir = Oeste
              | h == CurvaEsq = Este
              | otherwise     = Sul
orienta Norte h | h == CurvaDir = Este
                | h == CurvaEsq = Oeste
                | otherwise     = Norte

{-|
Função que recebe uma lista de orientações e uma posiçao e calcula uma lista de posições ordenadas.

==Exemplo de utilização

>>>posnotab [Este,Sul,Sul,Oeste,Oeste,Norte,Norte,Este] (2,4)
[(2,4),(3,4),(3,5),(3,6),(2,6),(1,6),(1,5),(1,4)]
-}
posnotab :: [Orientacao] -> Posicao -> [Posicao]
posnotab [] (x,y) = []
posnotab (h:t) (x,y) | Este  == h = (x,y) : posnotab t (x+1,y)
                     | Oeste == h = (x,y) : posnotab t (x-1,y)
                     | Sul   == h = (x,y) : posnotab t (x,y+1)
                     | otherwise  = (x,y) : posnotab t (x,y-1)

{-|
Função auxiliar a posnotab que calcula a lista de orientações a partir de uma orientação e um caminho.

==Exemplo de utilização

>>> aux_posnotab dirInit [Avanca,CurvaDir,Sobe,CurvaDir,Avanca,CurvaDir,Desce,CurvaDir]
[Este,Sul,Sul,Oeste,Oeste,Norte,Norte,Este]
-}
aux_posnotab :: Orientacao -> Caminho -> [Orientacao]
aux_posnotab a [b] = [a]
aux_posnotab a (q:w:e) = a :(aux_posnotab (orienta a w) (w:e))


{-|
Função que constroi um tabueiro de qualquer dimensão em que todas as peças são lava.

==Exemplo de utilização

>>>tablava (3,4)
[[Peca Lava 0,Peca Lava 0,Peca Lava 0],[Peca Lava 0,Peca Lava 0,Peca Lava 0],[Peca Lava 0,Peca Lava 0,Peca Lava 0],[Peca Lava 0,Peca Lava 0,Peca Lava 0]]
-}
tablava :: Dimensao -> Tabuleiro
tablava (a,0) = [] 
tablava (a,b) = tablinha (a,b) : tablava ( a , (b-1) ) 


{-|
__Função auxiliar__ de tablava que cria linhas onde todas as peças são lava.

==Exemplo de utilização

>>>tablinha (3,4)
[Peca Lava 0,Peca Lava 0,Peca Lava 0]
-}
tablinha :: Dimensao -> [Peca]
tablinha (0,b) = []
tablinha (a,b) = Peca Lava 0 : tablinha ( (a-1) , b )


{-|
Função que pega num tabuleiro de lava e coloca uma determinada peça nesse tabuleiro no sitio exato.

==Exemplo de utilização

>>> modTabuleiro [[Peca Lava 0,Peca Lava 0,Peca Lava 0],[Peca Lava 0,Peca Lava 0,Peca Lava 0],[Peca Lava 0,Peca Lava 0,Peca Lava 0],[Peca Lava 0,Peca Lava 0,Peca Lava 0]] (0,0) (2,3) (Peca Recta 0)
[[Peca Lava 0,Peca Lava 0,Peca Lava 0],[Peca Lava 0,Peca Lava 0,Peca Lava 0],[Peca Lava 0,Peca Lava 0,Peca Lava 0],[Peca Lava 0,Peca Lava 0,Peca Recta 0]]
-}
modTabuleiro :: Tabuleiro -> Posicao -> Posicao -> Peca -> Tabuleiro
modTabuleiro (h:t) (x, y) (b1,b2) p | y == b2   = (aux_modTabuleiro h (0,0) (b1,b2) p) : t
                                    | otherwise = h : (modTabuleiro t (x,y+1) (b1,b2) p)

{-|
__Função auxiliar__ de modTabuleiro que dado uma lista de peças do tipo lava e insere a peça nessa lista

==Exemplo de utilização

>>>aux_modTabuleiro [Peca Lava 0,Peca Lava 0,Peca Lava 0] (0,0) (2,3) (Peca Recta 0)
[Peca Lava 0,Peca Lava 0,Peca Recta 0]
-}
aux_modTabuleiro :: [Peca] -> Posicao -> Posicao -> Peca -> [Peca]
aux_modTabuleiro (h:t) (x,y) (b1,b2) p | x == b1   = p:t
                                       | otherwise = h : aux_modTabuleiro t (x+1,y) (b1,b2) p

{-|
Função que dado um tabuleiro de lava e a lista e a posição das peças ordenadas determina o o tabuleiro resultante de pôr as peças nas posições certas.

==Exemplo de utilização

>>>fazTabuleiro [[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0],[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0],[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0],[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0],[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0]] [Peca Recta 0,Peca (Curva Este) 0,Peca (Rampa Sul) 0,Peca (Curva Sul) 1,Peca Recta 1,Peca (Curva Oeste) 1,Peca (Rampa Sul) 0,Peca (Curva Norte) 0] [(2,1),(3,1),(3,2),(3,3),(2,3),(1,3),(1,2),(1,1)]
[[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0],[Peca Lava 0,Peca (Curva Norte) 0,Peca Recta 0,Peca (Curva Este) 0,Peca Lava 0],[Peca Lava 0,Peca (Rampa Sul) 0,Peca Lava 0,Peca (Rampa Sul) 0,Peca Lava 0],[Peca Lava 0,Peca (Curva Oeste) 1,Peca Recta 1,Peca (Curva Sul) 1,Peca Lava 0],[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0]]
-}
fazTabuleiro :: Tabuleiro -> [Peca] -> [Posicao] ->  Tabuleiro
fazTabuleiro t [] _ = t
fazTabuleiro t (n:m) (a:b) = fazTabuleiro (modTabuleiro t (0,0) a n) m b