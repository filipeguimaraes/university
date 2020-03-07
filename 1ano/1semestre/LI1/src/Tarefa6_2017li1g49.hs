{-|
Module : Tarefa 6
Description : Módulo com a resolução da tarefa 6
Copyright : Filipe Guimarães <a85308@alunos.uminho.pt>; Gonçalo Ferreira <a84070@alunos.uminho.pt>
Módulo onde é definida a função "bot :: Tempo -> Jogo -> Int -> Acao" que atualiza Acao feita pelo bot.
-}
module Tarefa6_2017li1g49 where

import LI11718
import Tarefa2_2017li1g49

{-|
Função usada para simular um /bot/ no jogo /Micro Machines/.
Em cada instante, dado o tempo decorrido, o estado do jogo
e o identificador do jogador, toma uma ação.
-}
bot :: Tempo  -- ^ tempo decorrido desde a última decisão
    -> Jogo   -- ^ estado atual do jogo
    -> Int    -- ^ identificador do jogador dentro do estado
    -> Acao   -- ^ a decisão tomada pelo /bot/
bot tick (Jogo (Mapa ((x,y),o) t) p c n h) q = avaliatrajeto (pecAtual (trajeto (Jogo (Mapa ((x,y),o) t) p c n h)) (toInteiro x1,toInteiro y1)) (jogador c q) q
                 where Carro (x1,y1) u (v1,v2) = jogador c q
      

tick = 0.01

{-|
Função que dado o Jogo com recurso á "peca2estrada" fornece o trajato precorrido pelo Carro.

== Exemplos de utilização

>>> trajeto (Jogo {mapa = Mapa ((2,1),Este) [[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0],[Peca Lava 0,Peca (Curva Norte) 0,Peca Recta 0,Peca (Rampa Este) 0,Peca (Curva Este) 1,Peca Lava 0],[Peca Lava 0,Peca Recta 0,Peca Lava 0,Peca Lava 0,Peca Recta 1,Peca Lava 0],[Peca Lava 0,Peca (Curva Oeste) 0,Peca Recta 0,Peca (Rampa Este) 0,Peca (Curva Sul) 1,Peca Lava 0],[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0]], pista = Propriedades {k_atrito = 2.0, k_pneus = 3.0, k_acel = 4.0, k_peso = 2.0, k_nitro = 15.0, k_roda = 180.0}, carros = [Carro {posicao = (2.0,1.5), direcao = 0.0, velocidade = (0.0,0.0)},Carro {posicao = (2.0,1.5), direcao = 20.0, velocidade = (1.0,1.0)},Carro {posicao = (2.0,1.5), direcao = 20.0, velocidade = (1.2058884341838392,-0.2791084429768091)}], nitros = [3.0,2.0], historico = [[(2,1)],[(2,1)]]})
[(Peca Recta 0,(2,1),Este),(Peca (Rampa Este) 0,(3,1),Este),(Peca (Curva Este) 1,(4,1),Este),(Peca Recta 1,(4,2),Sul),(Peca (Curva Sul) 1,(4,3),Sul),(Peca (Rampa Este) 0,(3,3),Oeste),(Peca Recta 0,(2,3),Oeste),(Peca (Curva Oeste) 0,(1,3),Oeste),(Peca Recta 0,(1,2),Norte),(Peca (Curva Norte) 0,(1,1),Norte)]
-}
trajeto :: Jogo -> [(Peca,Posicao,Orientacao)]
trajeto (Jogo (Mapa ((x,y),o) t) p c n h) = peca2estrada (Mapa ((x,y),o) t) (findPeca (x,y) t) (contaPecas t 0) (x,y) []

{-|
Função que dado as informações do jogo ("Jogo") decide qual será a Acao efetuada pelo bot.

== Exemplos de utilização

>>> avaliatrajeto (Peca Recta 0,(1,1),Este) (Carro (1,1) (-45) (1,1)) 1
Acao {acelerar = True, travar = False, esquerda = True, direita = False, nitro = Nothing}

>>> avaliatrajeto (Peca Recta 0,(1,1),Oeste) (Carro (1,1) (180) (1,1)) 1
Acao {acelerar = True, travar = False, esquerda = False, direita = False, nitro = Just 1}
-}
avaliatrajeto :: (Peca,Posicao,Orientacao) -> Carro -> Int -> Acao
avaliatrajeto (Peca Recta _,(x1,y1),Este)  (Carro (x2,y2) u (v1,v2)) n | convTrig (-u) > convTrig 2    && convTrig (-u) < pi = Acao True False True False Nothing
                                                                       | convTrig (-u) < convTrig (-2) && convTrig (-u) > pi = Acao True False False True Nothing
                                                                       | otherwise = Acao True False False False (Just n)
                                        where u2 = (atan (v1/v2))
avaliatrajeto (Peca Recta _,(x1,y1),Oeste) (Carro (x2,y2) u (v1,v2)) n | convTrig (-u) < convTrig 178 && convTrig (-u) > 0    = Acao True False False True Nothing
                                                                       | convTrig (-u) > convTrig 182 && convTrig (-u) < 2*pi = Acao True False True False Nothing
                                                                       | otherwise = Acao True False False False (Just n)
                                        where u2 = (atan (v1/v2))
avaliatrajeto (Peca Recta _,(x1,y1),Norte) (Carro (x2,y2) u (v1,v2)) n | convTrig (-u) < convTrig 268 && convTrig (-u) > pi/2 = Acao True False False True Nothing
                                                                       | convTrig (-u) > convTrig 272 && convTrig (-u) < 2*pi = Acao True False True False Nothing
                                                                       | otherwise = Acao True False False False (Just n)
                                        where u2 = (atan (v1/v2))
avaliatrajeto (Peca Recta _,(x1,y1),Sul)   (Carro (x2,y2) u (v1,v2)) n | convTrig (-u) > convTrig 92 && convTrig (-u) < (3*pi)/2 = Acao True False True False Nothing
                                                                       | convTrig (-u) < convTrig 88 && convTrig (-u) > 0        = Acao True False False True Nothing
                                                                       | otherwise = Acao True False False False (Just n)
                                        where u2 = (atan (v1/v2))
avaliatrajeto (Peca (Rampa o1) _,(x1,y1),o2) (Carro (x2,y2) u (v1,v2)) n = Acao True False False False Nothing
avaliatrajeto (Peca (Curva Este) _,(x1,y1),o2) (Carro (x2,y2) u (v1,v2)) n | o2 == Norte && convTrig (-u) < convTrig (-185) = Acao True False True False Nothing
                                                                           | o2 == Este  && convTrig (-u) > convTrig (-85)  = Acao True False False True Nothing
                                                                           | otherwise = Acao True False False False (Just n)
        where u2 = (atan (v1/v2))
avaliatrajeto (Peca (Curva Oeste) _,(x1,y1),o2) (Carro (x2,y2) u (v1,v2)) n | o2 == Oeste && convTrig (-u) > convTrig (-265) = Acao True False False True Nothing
                                                                            | o2 == Sul   && convTrig (-u) < convTrig (-5)   = Acao True False True False Nothing
                                                                            | otherwise = Acao True False False False (Just n) 
        where u2 = (atan (v1/v2))
avaliatrajeto (Peca (Curva Sul) _,(x1,y1),o2) (Carro (x2,y2) u (v1,v2)) n | o2 == Sul  && convTrig (-u) < convTrig (-180) = Acao True False False True Nothing
                                                                          | o2 == Este && convTrig (-u) > convTrig (-90) = Acao True False True False Nothing
                                                                          | otherwise = Acao True False False False (Just n)
       where u2 = (atan (v1/v2))
avaliatrajeto (Peca (Curva Norte) _,(x1,y1),o2) (Carro (x2,y2) u (v1,v2)) n | o2 == Norte && convTrig (-u) < convTrig (-10) = Acao True False False True Nothing
                                                                            | o2 == Oeste && convTrig (-u) > convTrig (-265) = Acao True False True False Nothing
                                                                            | otherwise = Acao True False False False (Just n)
         where u2 = (atan (v1/v2))

{-|
Função que dado [(Peca,Posicao,Orientacao)] e uma Posicao retira o trio que tem Posicao igual.

== Exemplos de utilização

>>> pecAtual [(Peca Recta 0,(2,1),Este),(Peca (Rampa Este) 0,(3,1),Este),(Peca (Curva Este) 1,(4,1),Este),(Peca Recta 1,(4,2),Sul),(Peca (Curva Sul) 1,(4,3),Sul),(Peca (Rampa Este) 0,(3,3),Oeste),(Peca Recta 0,(2,3),Oeste),(Peca (Curva Oeste) 0,(1,3),Oeste),(Peca Recta 0,(1,2),Norte),(Peca (Curva Norte) 0,(1,1),Norte)] (4,1)
(Peca (Curva Este) 1,(4,1),Este)
-}
pecAtual :: [(Peca,Posicao,Orientacao)] -> Posicao -> (Peca,Posicao,Orientacao)
pecAtual ((a,(x1,y1),b):t) (x2,y2) = if x1 == x2 && y1 == y2 then (a,(x1,y1),b) else pecAtual t (x2,y2)

{-|
Função que dado um Double torna-o num inteiro.

== Exemplos de utilização

>>> toInteiro 2.146146145
2
-}
toInteiro :: Double -> Int
toInteiro a = if a >= 1 then 1 + toInteiro (a-1) else 0

{-|
Função que dado uma lista e um Int, retira o elemento correspondente ao Int.

== Exemplos de utilização

>>> jogador [1,2,3,4] 1
2
-}
jogador :: [a] -> Int -> a
jogador (h:t) a = if a <= 0 then h else jogador t (a-1) 

{-|
Função que converte graus para radianos.

== Exemplos de utilização

>>> convTrig 160
2.792526803190927
-}
convTrig :: Double -> Double
convTrig q | q >= 360  = convTrig (q-360)
           | q < 0     = convTrig (q+360)
           | otherwise = ((q * pi) / 180)

{-|
Função que passa os angulos em radianos para um intervalo [0,2*pi].

== Exemplos de utilização

>>> angPos (-2.792526803190927)
3.490658503988659
-}
angPos :: Double -> Double
angPos q | q >= 2*pi = angPos (q-(2*pi))
         | q < 0     = angPos (q+(2*pi))
         | otherwise = q