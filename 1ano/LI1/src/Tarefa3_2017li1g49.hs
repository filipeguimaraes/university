{-|
Module : Tarefa 3
Description : Módulo com a resolução da tarefa 3
Copyright : Filipe Guimarães <a85308@alunos.uminho.pt>; Gonçalo Ferreira <a84070@alunos.uminho.pt>
Módulo onde é definida a função "movimenta :: Tabuleiro -> Tempo -> Carro -> Maybe Carro" que calcula a proxima localização do Carro no mapa.
-}
module Tarefa3_2017li1g49 where

import LI11718
import Data.Maybe

{-|
Função que contém exemplos de teste para colisões.
-}
testesT3 :: [(Tabuleiro,Tempo,Carro)]
testesT3 = [(tr1,2,(Carro {posicao = (4.51,1.55), direcao = 45, velocidade = (1,0.22)}))]

{-|
Tabuleiro para efeitos de teste.
-}
tr,tr1,tr2 :: Tabuleiro
tr  = [[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0],[Peca Lava 0,Peca (Curva Norte) 0,Peca Recta 0,Peca (Curva Este) 0,Peca Lava 0],[Peca Lava 0,Peca (Rampa Sul) 0,Peca Lava 0,Peca (Rampa Sul) 0,Peca Lava 0],[Peca Lava 0,Peca (Curva Oeste) 1,Peca Recta 1,Peca (Curva Sul) 1,Peca Lava 0],[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0]]
tr1 = [[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0],[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca (Curva Norte) 0,Peca Recta 0,Peca (Curva Este) 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0],[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Recta 0,Peca Lava 0,Peca (Rampa Norte) (-1),Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0],[Peca Lava 0,Peca (Curva Norte) 0,Peca Recta 0,Peca Recta 0,Peca (Curva Sul) 0,Peca Lava 0,Peca Recta (-1),Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0],[Peca Lava 0,Peca Recta 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca (Curva Oeste) (-1),Peca (Curva Este) (-1),Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0],[Peca Lava 0,Peca Recta 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca (Curva Oeste) (-1),Peca (Curva Este) (-1),Peca Lava 0,Peca Lava 0,Peca Lava 0],[Peca Lava 0,Peca (Rampa Norte) (-1),Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca (Curva Norte) (-1),Peca (Curva Sul) (-1),Peca Lava 0,Peca Lava 0,Peca Lava 0],[Peca Lava 0,Peca (Rampa Norte) (-2),Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca (Curva Norte) (-1),Peca (Curva Sul) (-1),Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0],[Peca Lava 0,Peca (Curva Oeste) (-2),Peca Recta (-2),Peca (Curva Este) (-2),Peca Lava 0,Peca Lava 0,Peca (Curva Oeste) (-1),Peca Recta (-1),Peca Recta (-1),Peca (Rampa Oeste) (-2),Peca (Curva Este) (-2),Peca Lava 0],[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca (Curva Oeste) (-2),Peca (Curva Este) (-2),Peca Lava 0,Peca (Curva Norte) (-3),Peca (Rampa Este) (-3),Peca Recta (-2),Peca Recta (-2),Peca (Curva Sul) (-2),Peca Lava 0],[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca (Curva Oeste) (-2),Peca (Rampa Oeste) (-3),Peca (Curva Sul) (-3),Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0],[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0]]
tr2 = [[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0],[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca (Curva Norte) 0,Peca Recta 0,Peca (Curva Este) 0,Peca Lava 0],[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Recta 0,Peca Lava 0,Peca Recta 0,Peca Lava 0],[Peca Lava 0,Peca (Curva Norte) 0,Peca Recta 0,Peca Recta 0,Peca Recta 0,Peca (Curva Sul) 0,Peca Lava 0],[Peca Lava 0,Peca Recta 0,Peca Lava 0,Peca Recta 0,Peca Lava 0,Peca Lava 0,Peca Lava 0],[Peca Lava 0,Peca (Curva Oeste) 0,Peca Recta 0,Peca (Curva Sul) 0,Peca Lava 0,Peca Lava 0,Peca Lava 0],[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0]]

{-|
Função que dado um Tabuleiro, Tempo e Carro, calcula o proximo estado (Maybe Carro) do carro.

== Exemplos de utilização

>>> movimenta [[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0],[Peca Lava 0,Peca (Curva Norte) 0,Peca Recta 0,Peca (Curva Este) 0,Peca Lava 0],[Peca Lava 0,Peca (Rampa Sul) 0,Peca Lava 0,Peca (Rampa Sul) 0,Peca Lava 0],[Peca Lava 0,Peca (Curva Oeste) 1,Peca Recta 1,Peca (Curva Sul) 1,Peca Lava 0],[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0]] 1 (Carro {posicao = (1.55,1.55) , direcao = 45 , velocidade = (1,0)})
Just (Carro {posicao = (2.5499999999999887,1.55), direcao = 45.0, velocidade = (1.0,0.0)})

>>> movimenta [[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0],[Peca Lava 0,Peca (Curva Norte) 0,Peca Recta 0,Peca (Curva Este) 0,Peca Lava 0],[Peca Lava 0,Peca (Rampa Sul) 0,Peca Lava 0,Peca (Rampa Sul) 0,Peca Lava 0],[Peca Lava 0,Peca (Curva Oeste) 1,Peca Recta 1,Peca (Curva Sul) 1,Peca Lava 0],[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0]] 1 (Carro {posicao = (1.55,1.55) , direcao = 45 , velocidade = (1,1)})
Nothing
-}
movimenta :: Tabuleiro -> Tempo -> Carro -> Maybe Carro
movimenta m t c = pufLava m t c (Peca Lava 0)

{-|
Função que dado um Tabuleiro, Tempo e Carro, calcula se o carro cai à lava ou se faz ricochete.

== Exemplos de utilização

>>> pufLava [[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0],[Peca Lava 0,Peca (Curva Norte) 0,Peca Recta 0,Peca (Curva Este) 0,Peca Lava 0],[Peca Lava 0,Peca (Rampa Sul) 0,Peca Lava 0,Peca (Rampa Sul) 0,Peca Lava 0],[Peca Lava 0,Peca (Curva Oeste) 1,Peca Recta 1,Peca (Curva Sul) 1,Peca Lava 0],[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0]] 1 (Carro {posicao = (1.55,1.55) , direcao = 45 , velocidade = (1,0)})
Just (Carro {posicao = (2.5499999999999887,1.55), direcao = 45.0, velocidade = (1.0,0.0)})

>>> pufLava [[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0],[Peca Lava 0,Peca (Curva Norte) 0,Peca Recta 0,Peca (Curva Este) 0,Peca Lava 0],[Peca Lava 0,Peca (Rampa Sul) 0,Peca Lava 0,Peca (Rampa Sul) 0,Peca Lava 0],[Peca Lava 0,Peca (Curva Oeste) 1,Peca Recta 1,Peca (Curva Sul) 1,Peca Lava 0],[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0]] 1 (Carro {posicao = (1.55,1.55) , direcao = 45 , velocidade = (1,1)})
Nothing
-}
pufLava :: Tabuleiro -> Tempo -> Carro -> Peca -> Maybe Carro
pufLava [] _ _ _  = Nothing
pufLava tab t (Carro {posicao = (x,y) , direcao = u , velocidade = (v1,v2)}) (Peca r q) |t > 0 && findPeca (x,y) tab /= Peca Lava 0 = pufLava tab (t-0.01) (Carro {posicao = (x+(0.01*v1),y+(0.01*v2)) , direcao = u , velocidade = (v1,v2)}) (findPeca (x,y) tab)
                                                                                        | otherwise = pufAuxiliar (findPeca (x,y) tab) (Carro {posicao = (x,y) , direcao = u , velocidade = (v1,v2)})
 
{-|
Função que dado um Ponto e um Tabuleiro retira a peça nessa mesma coordenada.

== Exemplos de utilização

>>> findPeca (1,1) [[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0],[Peca Lava 0,Peca (Curva Norte) 0,Peca Recta 0,Peca (Curva Este) 0,Peca Lava 0],[Peca Lava 0,Peca (Rampa Sul) 0,Peca Lava 0,Peca (Rampa Sul) 0,Peca Lava 0],[Peca Lava 0,Peca (Curva Oeste) 1,Peca Recta 1,Peca (Curva Sul) 1,Peca Lava 0],[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0]]
Peca (Curva Norte) 0
-}
findPeca :: Ponto -> Tabuleiro -> Peca
findPeca _ [] = Peca Lava 0
findPeca (x,y) (h:t) | y < 0     = Peca Lava 0
                     | y < 1     = aux_fPeca x h
                     | otherwise = findPeca (x,y-1) t

{-|
__Função auxiliar__ de "aux_fPeca" que procura a coluna onde esta a peça pretendida em "findPeca".

== Exemplos de utilização

>>> aux_fPeca (1,1) [Peca Lava 0,Peca (Curva Norte) 0,Peca Recta 0,Peca (Curva Este) 0,Peca Lava 0]
Peca (Curva Norte) 0
-}
aux_fPeca :: Double -> [Peca] -> Peca
aux_fPeca _ [] = Peca Lava 0
aux_fPeca a (h:t) | a < 0     = Peca Lava 0
                  | a < 1     = h
                  | otherwise = aux_fPeca (a-1) t


{-|
__Função auxiliar__ de "pufAuxiliar" que verifica se o carro está numa posição correta na sua posição final.

== Exemplos de utilização

>>> pufAuxiliar (Peca (Curva Este) 0) (Carro {posicao = (1.3,1.45), direcao = 45.0, velocidade = (1.0,1.0)})
Just (Carro {posicao = (1.3,1.45), direcao = 45.0, velocidade = (1.0,1.0)})

>>> pufAuxiliar (Peca (Curva Este) 0) (Carro {posicao = (1.5,1.45), direcao = 45.0, velocidade = (1.0,1.0)})
Nothing
-}
pufAuxiliar :: Peca -> Carro -> Maybe Carro
pufAuxiliar (Peca (Curva o) h) (Carro {posicao = (x,y) , direcao = u , velocidade = (v1,v2)}) | o == Norte && y > (-x) + b1 = Just (Carro {posicao = (x,y) , direcao = u , velocidade = (v1,v2)})
                                                                                              | o == Sul   && y < (-x) + b1 = Just (Carro {posicao = (x,y) , direcao = u , velocidade = (v1,v2)})
                                                                                              | o == Oeste && y < x + b2    = Just (Carro {posicao = (x,y) , direcao = u , velocidade = (v1,v2)})
                                                                                              | o == Este  && y > x + b2    = Just (Carro {posicao = (x,y) , direcao = u , velocidade = (v1,v2)})
                                                                                            where b1 = (toInteiro y) + ((toInteiro x) + 1)
                                                                                                  b2 = (toInteiro y) - (toInteiro x)
pufAuxiliar (Peca (Rampa o) h) (Carro {posicao = (x,y) , direcao = u , velocidade = (v1,v2)}) = Just (Carro {posicao = (x,y) , direcao = u , velocidade = (v1,v2)})
pufAuxiliar (Peca Recta h) (Carro {posicao = (x,y) , direcao = u , velocidade = (v1,v2)})     = Just (Carro {posicao = (x,y) , direcao = u , velocidade = (v1,v2)})
pufAuxiliar _ _ = Nothing

{-|
Função que pega num Double e devolve um Double sem as suas casas décimais.

== Exemplos de utilização

>>> toInteiro 1.7
1

>>> toInteiro 3.412192418248
3
-}
toInteiro :: Double -> Double
toInteiro a = if a >= 0 then 1 + toInteiro (a-1) else 0