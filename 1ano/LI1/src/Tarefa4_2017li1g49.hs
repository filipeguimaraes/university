{-|
Module : Tarefa 4
Description : Módulo com a resolução da tarefa 4
Copyright : Filipe Guimarães <a85308@alunos.uminho.pt>; Gonçalo Ferreira <a84070@alunos.uminho.pt>
Módulo onde é definida a função "atualiza :: Tempo -> Jogo -> Int -> Acao -> Jogo" que atualiza o estado do jogo referente a uma Acao e a um Tempo.
-}
module Tarefa4_2017li1g49 where

import LI11718

{-|
O testes a serem considerados pelo sistema de /feedback/
para a função 'atualiza'.
-}
testesT4 :: [(Tempo,Jogo,Acao)]
testesT4 = [(0.25, Jogo {mapa = (Mapa ((2,1),Este) [[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0],[Peca Lava 0,Peca (Curva Norte) 0,Peca Recta 0,Peca (Rampa Este) 0,Peca (Curva Este) 1,Peca Lava 0],[Peca Lava 0,Peca Recta 0,Peca Lava 0,Peca Lava 0,Peca Recta 1,Peca Lava 0],[Peca Lava 0,Peca (Curva Oeste) 0,Peca Recta 0,Peca (Rampa Este) 0,Peca (Curva Sul) 1,Peca Lava 0],[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0]]), pista = Propriedades {k_atrito = 2.0, k_pneus = 3.0, k_acel = 4.0, k_peso = 2.0, k_nitro = 15.0, k_roda = 180.0},carros = [(Carro {posicao = (2,1.5), direcao = 0, velocidade = (0,0)})],nitros = [3.0],historico = [[(2,3)]]},Acao {acelerar = True, travar = False, esquerda = False, direita = False, nitro = Nothing}),
            (0.25, Jogo {mapa = (Mapa ((2,1),Este) [[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0],[Peca Lava 0,Peca (Curva Norte) 0,Peca Recta 0,Peca (Rampa Este) 0,Peca (Curva Este) 1,Peca Lava 0],[Peca Lava 0,Peca Recta 0,Peca Lava 0,Peca Lava 0,Peca Recta 1,Peca Lava 0],[Peca Lava 0,Peca (Curva Oeste) 0,Peca Recta 0,Peca (Rampa Este) 0,Peca (Curva Sul) 1,Peca Lava 0],[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0]]), pista = Propriedades {k_atrito = 2.0, k_pneus = 3.0, k_acel = 4.0, k_peso = 2.0, k_nitro = 15.0, k_roda = 180.0},carros = [(Carro {posicao = (2,1.5), direcao = 0, velocidade = (0.2,0)})],nitros = [3.0],historico = [[(2,3)]]},Acao {acelerar = True, travar = False, esquerda = False, direita = False, nitro = Nothing}),
            (0.25, Jogo {mapa = (Mapa ((2,1),Este) [[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0],[Peca Lava 0,Peca (Curva Norte) 0,Peca Recta 0,Peca (Rampa Este) 0,Peca (Curva Este) 1,Peca Lava 0],[Peca Lava 0,Peca Recta 0,Peca Lava 0,Peca Lava 0,Peca Recta 1,Peca Lava 0],[Peca Lava 0,Peca (Curva Oeste) 0,Peca Recta 0,Peca (Rampa Este) 0,Peca (Curva Sul) 1,Peca Lava 0],[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0]]), pista = Propriedades {k_atrito = 2.0, k_pneus = 3.0, k_acel = 4.0, k_peso = 2.0, k_nitro = 15.0, k_roda = 180.0},carros = [(Carro {posicao = (2,1.5), direcao = 0, velocidade = (0.2,0)})],nitros = [3.0],historico = [[(2,3)]]},Acao {acelerar = True, travar = False, esquerda = False, direita = True, nitro = Nothing}),
            (0.8 , Jogo {mapa = (Mapa ((2,1),Este) [[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0],[Peca Lava 0,Peca (Curva Norte) 0,Peca Recta 0,Peca (Rampa Este) 0,Peca (Curva Este) 1,Peca Lava 0],[Peca Lava 0,Peca Recta 0,Peca Lava 0,Peca Lava 0,Peca Recta 1,Peca Lava 0],[Peca Lava 0,Peca (Curva Oeste) 0,Peca Recta 0,Peca (Rampa Este) 0,Peca (Curva Sul) 1,Peca Lava 0],[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0]]), pista = Propriedades {k_atrito = 2.0, k_pneus = 3.0, k_acel = 4.0, k_peso = 2.0, k_nitro = 15.0, k_roda = 180.0},carros = [(Carro {posicao = (2,1.5), direcao = 0, velocidade = (1,0)})],nitros = [3.0],historico = [[(2,1)]]},Acao {acelerar = True, travar = False, esquerda = False, direita = False, nitro = Nothing}),
            (0.3 , Jogo {mapa = (Mapa ((2,1),Este) [[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0],[Peca Lava 0,Peca (Curva Norte) 0,Peca Recta 0,Peca (Rampa Este) 0,Peca (Curva Este) 1,Peca Lava 0],[Peca Lava 0,Peca Recta 0,Peca Lava 0,Peca Lava 0,Peca Recta 1,Peca Lava 0],[Peca Lava 0,Peca (Curva Oeste) 0,Peca Recta 0,Peca (Rampa Este) 0,Peca (Curva Sul) 1,Peca Lava 0],[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0]]), pista = Propriedades {k_atrito = 2.0, k_pneus = 3.0, k_acel = 4.0, k_peso = 2.0, k_nitro = 15.0, k_roda = 180.0},carros = [(Carro {posicao = (2,1.5), direcao = 24, velocidade = (0,0)})],nitros = [3.0],historico = [[(2,1)]]},Acao {acelerar = True, travar = False, esquerda = True, direita = True, nitro = Nothing}),
            (0.3 , Jogo {mapa =  Mapa ((2,1),Este) [[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0],[Peca Lava 0,Peca (Curva Norte) 0,Peca Recta 0,Peca (Rampa Este) 0,Peca (Curva Este) 1,Peca Lava 0],[Peca Lava 0,Peca Recta 0,Peca Lava 0,Peca Lava 0,Peca Recta 1,Peca Lava 0],[Peca Lava 0,Peca (Curva Oeste) 0,Peca Recta 0,Peca (Rampa Este) 0,Peca (Curva Sul) 1,Peca Lava 0],[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0]], pista = Propriedades {k_atrito = 2.0, k_pneus = 3.0, k_acel = 4.0, k_peso = 2.0, k_nitro = 15.0, k_roda = 180.0}, carros = [Carro {posicao = (2.0,1.5), direcao = 24.0, velocidade = (1.096254549171121,-0.48808397169096024)}], nitros = [3.0], historico = [[(2,1)]]},Acao {acelerar = True, travar = False, esquerda = True, direita = True, nitro = Nothing}),
            (0.2 , Jogo {mapa = (Mapa ((2,1),Este) [[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0],[Peca Lava 0,Peca (Curva Norte) 0,Peca Recta 0,Peca (Rampa Este) 0,Peca (Curva Este) 1,Peca Lava 0],[Peca Lava 0,Peca Recta 0,Peca Lava 0,Peca Lava 0,Peca Recta 1,Peca Lava 0],[Peca Lava 0,Peca (Curva Oeste) 0,Peca Recta 0,Peca (Rampa Este) 0,Peca (Curva Sul) 1,Peca Lava 0],[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0]]), pista = Propriedades {k_atrito = 2.0, k_pneus = 3.0, k_acel = 4.0, k_peso = 2.0, k_nitro = 15.0, k_roda = 180.0},carros = [(Carro {posicao = (2,1.5), direcao = 20, velocidade = (1,1)})],nitros = [3.0],historico = [[(2,3)]]},Acao {acelerar = True, travar = False, esquerda = False, direita = False, nitro = Nothing}),
            (0.2 , Jogo {mapa = (Mapa ((2,1),Este) [[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0],[Peca Lava 0,Peca (Curva Norte) 0,Peca Recta 0,Peca (Rampa Este) 0,Peca (Curva Este) 1,Peca Lava 0],[Peca Lava 0,Peca Recta 0,Peca Lava 0,Peca Lava 0,Peca Recta 1,Peca Lava 0],[Peca Lava 0,Peca (Curva Oeste) 0,Peca Recta 0,Peca (Rampa Este) 0,Peca (Curva Sul) 1,Peca Lava 0],[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0]]), pista = Propriedades {k_atrito = 2.0, k_pneus = 3.0, k_acel = 4.0, k_peso = 2.0, k_nitro = 15.0, k_roda = 180.0},carros = [(Carro {posicao = (2,1.5), direcao = 20, velocidade = (-1,-1)})],nitros = [3.0],historico = [[(2,3)]]},Acao {acelerar = True, travar = False, esquerda = False, direita = False, nitro = Nothing}),
            (0.2 , Jogo {mapa = (Mapa ((2,1),Este) [[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0],[Peca Lava 0,Peca (Curva Norte) 0,Peca Recta 0,Peca (Rampa Este) 0,Peca (Curva Este) 1,Peca Lava 0],[Peca Lava 0,Peca Recta 0,Peca Lava 0,Peca Lava 0,Peca Recta 1,Peca Lava 0],[Peca Lava 0,Peca (Curva Oeste) 0,Peca Recta 0,Peca (Rampa Este) 0,Peca (Curva Sul) 1,Peca Lava 0],[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0]]), pista = Propriedades {k_atrito = 2.0, k_pneus = 3.0, k_acel = 4.0, k_peso = 2.0, k_nitro = 15.0, k_roda = 180.0},carros = [(Carro {posicao = (2,1.5), direcao = -45, velocidade = (1,1)})],nitros = [3.0],historico = [[(2,3)]]},Acao {acelerar = True, travar = False, esquerda = False, direita = False, nitro = Nothing}),
            (0.2 , Jogo {mapa = (Mapa ((2,1),Este) [[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0],[Peca Lava 0,Peca (Curva Norte) 0,Peca Recta 0,Peca (Rampa Este) 0,Peca (Curva Este) 1,Peca Lava 0],[Peca Lava 0,Peca Recta 0,Peca Lava 0,Peca Lava 0,Peca Recta 1,Peca Lava 0],[Peca Lava 0,Peca (Curva Oeste) 0,Peca Recta 0,Peca (Rampa Este) 0,Peca (Curva Sul) 1,Peca Lava 0],[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0]]), pista = Propriedades {k_atrito = 2.0, k_pneus = 3.0, k_acel = 4.0, k_peso = 2.0, k_nitro = 15.0, k_roda = 180.0},carros = [(Carro {posicao = (2,1.5), direcao = 20, velocidade = (1,1)})],nitros = [3.0],historico = [[(2,3)]]},Acao {acelerar = False, travar = False, esquerda = True, direita = False, nitro = Just 0}),
            (0.2 , Jogo {mapa = (Mapa ((2,1),Este) [[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0],[Peca Lava 0,Peca (Curva Norte) 0,Peca Recta 0,Peca (Rampa Este) 0,Peca (Curva Este) 1,Peca Lava 0],[Peca Lava 0,Peca Recta 0,Peca Lava 0,Peca Lava 0,Peca Recta 1,Peca Lava 0],[Peca Lava 0,Peca (Curva Oeste) 0,Peca Recta 0,Peca (Rampa Este) 0,Peca (Curva Sul) 1,Peca Lava 0],[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0]]), pista = Propriedades {k_atrito = 2.0, k_pneus = 3.0, k_acel = 4.0, k_peso = 2.0, k_nitro = 15.0, k_roda = 180.0},carros = [(Carro {posicao = (2,1.5), direcao = 20, velocidade = (1,1)})],nitros = [3.0],historico = [[(2,3)]]},Acao {acelerar = True, travar = False, esquerda = False, direita = False, nitro = Just 0}),
            (0.2 , Jogo {mapa = (Mapa ((2,1),Este) [[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0],[Peca Lava 0,Peca (Curva Norte) 0,Peca Recta 0,Peca (Rampa Este) 0,Peca (Curva Este) 1,Peca Lava 0],[Peca Lava 0,Peca Recta 0,Peca Lava 0,Peca Lava 0,Peca Recta 1,Peca Lava 0],[Peca Lava 0,Peca (Curva Oeste) 0,Peca Recta 0,Peca (Rampa Este) 0,Peca (Curva Sul) 1,Peca Lava 0],[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0]]), pista = Propriedades {k_atrito = 2.0, k_pneus = 3.0, k_acel = 4.0, k_peso = 2.0, k_nitro = 15.0, k_roda = 180.0},carros = [(Carro {posicao = (2,1.5), direcao = 20, velocidade = (1,1)})],nitros = [3.0],historico = [[(2,3)]]},Acao {acelerar = False, travar = False, esquerda = True, direita = False, nitro = Nothing})]

{-|
Função usada para atualizar o estado do jogo dadas as
ações de um jogador num determinado período de tempo.
-}
atualiza :: Tempo -- ^ a duração da ação
         -> Jogo  -- ^ o estado do jogo
         -> Int   -- ^ o identificador do jogador
         -> Acao  -- ^ a ação tomada pelo jogador
         -> Jogo  -- ^ o estado atualizado do jogo
atualiza t j e (Acao acel trav esq dir x) | acel = acelerar' t j e (Acao acel trav esq dir x)
                                                 | trav = travar' t j e (Acao acel trav esq dir x)
                                                 | x /= Nothing = Jogo m p (r8++[(Carro {posicao = (x3,y3) , direcao = u5 , velocidade = (v1 + a1 + r1 + q8 ,v2 + a2 + r2 + q9)})]++r9) n8 (hist (x3,y3) h e)
                                                 | esq || dir  = Jogo m p (r8++[(Carro {posicao = (x3,y3) , direcao = u5 , velocidade = (v1 + a1 + r1 ,v2 + a2 + r2)})]++r9) n (hist (x3,y3) h e)
                                                 | otherwise = Jogo m p (r8++[(Carro {posicao = (x3,y3) , direcao = u , velocidade = (v1 + a1 + r1 ,v2 + a2 + r2)})]++r9) n (hist (x3,y3) h e)
            where Jogo m p c n h = j
                  Propriedades ka kp kac kpq kn kr = p
                  (u1,u2) = cart2polar (v1,v2)
                  (a1,a2) = polar2cart (ka*v1*(-1)*t,u2)
                  (p1,p2) = polar2cart (r1*t,r2)
                  (r1,r2) = kpneus (v1,v2) u kp
                  (n8,(q8,q9)) = (nitrotempo n t x ,nitro' n t kn u x)
                  (Carro {posicao = (x3,y3) , direcao = u , velocidade = (v1,v2)}) = numP e c
                  (r8,r9) = numP1 e c
                  u5 = direcao1 kr u (Acao acel trav esq dir x) t

{-|
Função que dado uma lista e um Int, retira o elemento correspondente ao Int.

== Exemplos de utilização

>>> numP [1,2,3,4] 1
2
-}
numP :: Int -> [a] -> a
numP x [a] = a
numP x (h:t) | x <= 0 = h
             | otherwise = numP (x-1) (t)

{-|
Função que dado uma lista e um Int, retira os elementos antes e após a esse elemento.

== Exemplos de utilização

>>> numP1 [1,2,3,4] 1
([1],[3,4])
-}
numP1 :: Int -> [a] -> ([a],[a])
numP1 0 [] = ([],[])
numP1 0 (h:[]) = ([],[])
numP1 0 (h:t) = ([],t)
numP1 x (h:t) = ([h]++n,m)
          where (n,m) = numP1 (x-1) (t)

{-|
Função que converte graus para radianos.

== Exemplos de utilização

>>> convTrig 160
2.792526803190927
-}
convTrig :: Double -> Double
convTrig q = (q * pi) / 180

{-|
Função que uma constante, o Angulo, a Acao e Tempo, dá o novo Angulo.

== Exemplos de utilização

>>> direcao1 180 0 (Acao False False True False Nothing) 0.2
36.0
-}
direcao1 :: Double -> Double -> Acao -> Tempo -> Double
direcao1 k u (Acao _ _ esq dir _) t | esq       = u + (k*t)
                                    | dir       = u - (k*t)
                                    | otherwise = u

{-|
Função que pega num Ponto Cartersiano e passa para um Ponto Polar.

== Exemplos de utilização

>>> cart2polar (1,1)
(1.4142135623730951,0.7853981633974483)
-}
cart2polar :: Ponto -> Ponto
cart2polar (x,y) | x == 0 && y == 0 = ( 0,0 )
                 | y == 0 && x > 0 = ( sqrt (x^2 + y^2) , 0 )
                 | y == 0 && x < 0 = ( sqrt (x^2 + y^2) , pi )
                 | x == 0 && y > 0 = ( sqrt (x^2 + y^2) , pi/2 )
                 | x == 0 && y < 0 = ( sqrt (x^2 + y^2) , (3*pi)/2 )
                 | x < 0  && y < 0 = ( sqrt (x^2 + y^2) , atan (x/y) + pi )
                 | x > 0  && y < 0 = ( sqrt (x^2 + y^2) , atan (x/y) + (2*pi) )
                 | x < 0  && y > 0 = ( sqrt (x^2 + y^2) , atan (x/y) + pi )
                 | otherwise = ( sqrt (x^2 + y^2) , atan (x/y) )

{-|
Função que com um Ponto polar reverte o mesmo Ponto cartesiano.

== Exemplos de utilização

>>> polar2cart (1.4142135623730951,0.7853981633974483)
(1.0000000000000002,1.0)
-}
polar2cart :: Ponto -> Ponto
polar2cart (d,u) =( d * (cos u) , d * (sin u) )

{-|
Função que dado Tempo, Jogo, Int e Acao, reverte o Jogo atualizado quando acelerar.

== Exemplos de utilização

>>> acelerar' 0.2 (Jogo {mapa = Mapa ((2,1),Este) [[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0],[Peca Lava 0,Peca (Curva Norte) 0,Peca Recta 0,Peca (Rampa Este) 0,Peca (Curva Este) 1,Peca Lava 0],[Peca Lava 0,Peca Recta 0,Peca Lava 0,Peca Lava 0,Peca Recta 1,Peca Lava 0],[Peca Lava 0,Peca (Curva Oeste) 0,Peca Recta 0,Peca (Rampa Este) 0,Peca (Curva Sul) 1,Peca Lava 0],[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0]], pista = Propriedades {k_atrito = 2.0, k_pneus = 3.0, k_acel = 4.0, k_peso = 2.0, k_nitro = 15.0, k_roda = 180.0}, carros = [Carro {posicao = (2.0,1.5), direcao = 20.0, velocidade = (1.0,1.0)}], nitros = [3.0], historico = [[(2,1)]]}) 0 (Acao {acelerar = True, travar = False, esquerda = True, direita = True, nitro = Nothing})
Jogo {mapa = Mapa ((2,1),Este) [[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0],[Peca Lava 0,Peca (Curva Norte) 0,Peca Recta 0,Peca (Rampa Este) 0,Peca (Curva Este) 1,Peca Lava 0],[Peca Lava 0,Peca Recta 0,Peca Lava 0,Peca Lava 0,Peca Recta 1,Peca Lava 0],[Peca Lava 0,Peca (Curva Oeste) 0,Peca Recta 0,Peca (Rampa Este) 0,Peca (Curva Sul) 1,Peca Lava 0],[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0]], pista = Propriedades {k_atrito = 2.0, k_pneus = 3.0, k_acel = 4.0, k_peso = 2.0, k_nitro = 15.0, k_roda = 180.0}, carros = [Carro {posicao = (2.0,1.5), direcao = 20.0, velocidade = (1.2058884341838392,-0.2791084429768091)}], nitros = [3.0], historico = [[(2,1)]]}
-}
acelerar' :: Tempo -> Jogo -> Int -> Acao -> Jogo
acelerar' t (Jogo m (Propriedades {k_atrito = ka, k_pneus = kp, k_acel = kac, k_peso = kpe, k_nitro = kn, k_roda = kr}) c n h)  x1 (Acao acel trav esq dir ni) | t <= 0     = (Jogo m (Propriedades {k_atrito = ka, k_pneus = kp, k_acel = kac, k_peso = kpe, k_nitro = kn, k_roda = kr}) (r8++[(Carro {posicao = (x,y) , direcao = u , velocidade = ( if v1 + a1 <= 0 then 0 else v1+a1 , if v2 + a2 <= 0 then 0 else v2 + a2 )})]++r9) n8 (hist (x,y) h x1))
                                                                                                                                                                                                                              | trav       = (Jogo m (Propriedades {k_atrito = ka, k_pneus = kp, k_acel = kac, k_peso = kpe, k_nitro = kn, k_roda = kr}) (r8++[(Carro {posicao = (x,y) , direcao = (direcao1 kr u (Acao acel trav esq dir ni) t) , velocidade = (v1,v2)})]++r9) n8 h)
                                                                                                                                                                                                                              | dir && esq = (Jogo m (Propriedades {k_atrito = ka, k_pneus = kp, k_acel = kac, k_peso = kpe, k_nitro = kn, k_roda = kr}) (r8++[(Carro {posicao = (x,y) , direcao = u , velocidade = ( v1 + a1 + z1 + p1 + q8 , v2 + a2 + z2 + p2 + q9 )})]++r9) n8 (hist (x,y) h x1))
                                                                                                                                                                                                                              | dir        = (Jogo m (Propriedades {k_atrito = ka, k_pneus = kp, k_acel = kac, k_peso = kpe, k_nitro = kn, k_roda = kr}) (r8++[(Carro {posicao = (x,y) , direcao = (direcao1 kr u (Acao acel trav esq dir ni) t) , velocidade = ( v1 + a1 + z1 + p1 + q8 , v2 + a2 + z2 + p2 + q9 )})]++r9) n8 (hist (x,y) h x1))
                                                                                                                                                                                                                              | esq        = (Jogo m (Propriedades {k_atrito = ka, k_pneus = kp, k_acel = kac, k_peso = kpe, k_nitro = kn, k_roda = kr}) (r8++[(Carro {posicao = (x,y) , direcao = (direcao1 kr u (Acao acel trav esq dir ni) t) , velocidade = ( v1 + a1 + z1 + p1 + q8 , v2 + a2 + z2 + p2 + q9 )})]++r9) n8 (hist (x,y) h x1))
                                                                                                                                                                                                                              | otherwise  = (Jogo m (Propriedades {k_atrito = ka, k_pneus = kp, k_acel = kac, k_peso = kpe, k_nitro = kn, k_roda = kr}) (r8++[(Carro {posicao = (x,y) , direcao = u , velocidade = ( v1 + a1 + z1 + p1 + q8 , v2 + a2 + z2 + p2 + q9 )})]++r9) n8 (hist (x,y) h x1))
   where (u1,u2) = cart2polar (v1,v2)
         (a1,a2) = polar2cart (ka*v1*(-1)*t,u2)
         (p1,p2) = polar2cart (r1*t,r2)
         (z1,z2) = polar2cart (kac*t, angulos' (convTrig (360-u)))
         (r1,r2) = kpneus (v1,v2) u kp
         (n8,(q8,q9)) = (nitrotempo n t ni ,nitro' n t kn u ni)
         (Carro {posicao = (x,y) , direcao = u , velocidade = (v1,v2)}) = numP x1 c
         (r8,r9) = numP1 x1 c

{-|
Função que dado Tempo, Jogo, Int e Acao, reverte o Jogo atualizado quando travar.

== Exemplos de utilização

>>> travar' 0.2 (Jogo {mapa = Mapa ((2,1),Este) [[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0],[Peca Lava 0,Peca (Curva Norte) 0,Peca Recta 0,Peca (Rampa Este) 0,Peca (Curva Este) 1,Peca Lava 0],[Peca Lava 0,Peca Recta 0,Peca Lava 0,Peca Lava 0,Peca Recta 1,Peca Lava 0],[Peca Lava 0,Peca (Curva Oeste) 0,Peca Recta 0,Peca (Rampa Este) 0,Peca (Curva Sul) 1,Peca Lava 0],[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0]], pista = Propriedades {k_atrito = 2.0, k_pneus = 3.0, k_acel = 4.0, k_peso = 2.0, k_nitro = 15.0, k_roda = 180.0}, carros = [Carro {posicao = (2.0,1.5), direcao = 0.0, velocidade = (0,0)}], nitros = [3.0], historico = [[(2,1)]]}) 0 (Acao {acelerar = False, travar = True, esquerda = True, direita = True, nitro = Nothing})
Jogo {mapa = Mapa ((2,1),Este) [[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0],[Peca Lava 0,Peca (Curva Norte) 0,Peca Recta 0,Peca (Rampa Este) 0,Peca (Curva Este) 1,Peca Lava 0],[Peca Lava 0,Peca Recta 0,Peca Lava 0,Peca Lava 0,Peca Recta 1,Peca Lava 0],[Peca Lava 0,Peca (Curva Oeste) 0,Peca Recta 0,Peca (Rampa Este) 0,Peca (Curva Sul) 1,Peca Lava 0],[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0]], pista = Propriedades {k_atrito = 2.0, k_pneus = 3.0, k_acel = 4.0, k_peso = 2.0, k_nitro = 15.0, k_roda = 180.0}, carros = [Carro {posicao = (2.0,1.5), direcao = 0.0, velocidade = (-0.8,0.0)}], nitros = [3.0], historico = [[(2,1)]]}
-}
travar' :: Tempo -> Jogo -> Int -> Acao -> Jogo
travar' t (Jogo m (Propriedades {k_atrito = ka, k_pneus = kp, k_acel = kac, k_peso = kpe, k_nitro = kn, k_roda = kr}) c n h)  x1 (Acao acel trav esq dir ni) | t <= 0     = (Jogo m (Propriedades {k_atrito = ka, k_pneus = kp, k_acel = kac, k_peso = kpe, k_nitro = kn, k_roda = kr}) (r8++[(Carro {posicao = (x,y) , direcao = u , velocidade = ( if v1 + a1 <= 0 then 0 else v1+a1 , if v2 + a2 <= 0 then 0 else v2 + a2 )})]++r9) n8 (hist (x,y) h x1))
                                                                                                                                                                                                                              | acel       = (Jogo m (Propriedades {k_atrito = ka, k_pneus = kp, k_acel = kac, k_peso = kpe, k_nitro = kn, k_roda = kr}) (r8++[(Carro {posicao = (x,y) , direcao = (direcao1 kr u (Acao acel trav esq dir ni) t) , velocidade = (v1,v2)})]++r9) n8 h)
                                                                                                                                                                                                                              | dir && esq = (Jogo m (Propriedades {k_atrito = ka, k_pneus = kp, k_acel = kac, k_peso = kpe, k_nitro = kn, k_roda = kr}) (r8++[(Carro {posicao = (x,y) , direcao = u , velocidade = ( v1 + a1 + z1 + p1 + q8 , v2 + a2 + z2 + p2 + q9 )})]++r9) n8 (hist (x,y) h x1))
                                                                                                                                                                                                                              | dir        = (Jogo m (Propriedades {k_atrito = ka, k_pneus = kp, k_acel = kac, k_peso = kpe, k_nitro = kn, k_roda = kr}) (r8++[(Carro {posicao = (x,y) , direcao = (direcao1 kr u (Acao acel trav esq dir ni) t) , velocidade = ( v1 + a1 + z1 + p1 + q8 , v2 + a2 + z2 + p2 + q9 )})]++r9) n8 (hist (x,y) h x1))
                                                                                                                                                                                                                              | esq        = (Jogo m (Propriedades {k_atrito = ka, k_pneus = kp, k_acel = kac, k_peso = kpe, k_nitro = kn, k_roda = kr}) (r8++[(Carro {posicao = (x,y) , direcao = (direcao1 kr u (Acao acel trav esq dir ni) t) , velocidade = ( v1 + a1 + z1 + p1 + q8 , v2 + a2 + z2 + p2 + q9 )})]++r9) n8 (hist (x,y) h x1))
                                                                                                                                                                                                                              | otherwise  = (Jogo m (Propriedades {k_atrito = ka, k_pneus = kp, k_acel = kac, k_peso = kpe, k_nitro = kn, k_roda = kr}) (r8++[(Carro {posicao = (x,y) , direcao = u , velocidade = ( v1 + a1 + z1 + p1 + q8 , v2 + a2 + z2 + p2 + q9 )})]++r9) n8 (hist (x,y) h x1))
   where (u1,u2) = cart2polar (v1,v2)
         (a1,a2) = polar2cart (ka*v1*(-1)*t,u2)
         (p1,p2) = polar2cart (r1*t,r2)
         (z1,z2) = polar2cart (kac*(-1)*t, angulos' (convTrig (360-u)))
         (r1,r2) = kpneus (v1,v2) u kp
         (n8,(q8,q9)) = (nitrotempo n t ni ,nitro' n t kn u ni)
         (Carro {posicao = (x,y) , direcao = u , velocidade = (v1,v2)}) = numP x1 c
         (r8,r9) = numP1 x1 c

{-|
Função que dada Velocidade, Angulo e Double, dá o vetor da força dos pneus.

== Exemplos de utilização

>>> kpneus (1,1) 20 3
(-3.8451382923347315,1.2217304763960306)
-}
kpneus :: Velocidade -> Angulo -> Double -> Ponto
kpneus (v1,v2) u kp | v1 == 0 && v2 == 0 = (0,0)
                    | u2 == convTrig (u) = (0,0) 
                    | angulos' ((abs (convTrig u)) + (abs (u2))) == pi/2 = (0,0)
                    | (angulos' (convTrig (360-u))) - z2 < 0 = (kp*(sin (abs(u2-(angulos' (convTrig (360-u))))))*u1,convTrig (-u-90))
                    | (angulos' (convTrig (360-u))) - z2 > 0 = (kp*(sin (abs(u2-(angulos' (convTrig (360-u))))))*u1,convTrig (-u+90))
                    | otherwise = (0,0)
      where (u1,u2) = cart2polar (v1,v2)
            (z1,z2) = (u1,angulos' (u2+(2*pi)))

{-|
Função que reduz os angulos para um intervalo [(-2)*pi,2*pi].

== Exemplos de utilização

>>> angulos' ((3*pi)/4)
2.356194490192345
-}
angulos' :: Angulo -> Angulo
angulos' a | a >= 2*pi    = angulos' (a-(2*pi))
           | a <= (-2)*pi = angulos' (a+(2*pi))
           | otherwise    = a 

{-|
Função que dado o Ponto do carro, a lista de historico e o numero do jogadro, dá a lista de historico.

== Exemplos de utilização

>>> hist (2,1) [[(1,1)],[(5,5)]] 0
[[(2,1),(1,1)],[(5,5)]]
-}
hist :: Ponto -> [[Posicao]] -> Int -> [[Posicao]]
hist (x,y) [] _ = [[ponto2posicao (x,y) (0,0)]]
hist (x,y) (h:t) a | a > 0 = h : hist (x,y) t (a-1) 
                   | elem (ponto2posicao (x,y) (0,0)) h = h:t
                   | otherwise = ( [(ponto2posicao (x,y) (0,0))] ++ h ) : t

{-|
Função que um Ponto dá uma Posicao.

== Exemplos de utilização

>>> ponto2posicao (5.213978,2.5956) (0,0)
(5,2)
-}
ponto2posicao :: Ponto -> Posicao -> Posicao
ponto2posicao (x,y) (a,b) | x >= 1 = ponto2posicao (x-1,y) (a+1,b)
                          | y >= 1 = ponto2posicao (x,y-1) (a,b+1)
                          | otherwise = (a,b)

{-|
Função que calcula o vetor de nitro aplicado ao carro.

== Exemplos de utilização

>>> nitro' [1,2,3] 0.2 3 45 (Just 2)
(0.42426406871192845,-0.42426406871192857)
-}
nitro' :: [Tempo] -> Tempo -> Double -> Angulo -> Maybe Int -> Ponto
nitro' [] _ _ _ _= (0,0)
nitro' _ _ _ _ Nothing = (0,0)
nitro' (h:t) t1 k u (Just n) | h1 <= t1  = ( (cos (convTrig (360-u))) * h1 * k, (sin (convTrig (360-u))) * h1 * k )
                             | otherwise = ( (cos (convTrig (360-u))) * t1 * k, (sin (convTrig (360-u))) * t1 * k )
                       where h1 = numP n (h:t)

{-|
Função que Calcula a lista atualizada de nitros.

== Exemplos de utilização

>>> nitrotempo [1,2,3] 0.2 (Just 2)
[1.0,2.0,2.8]
-}
nitrotempo :: [Tempo] -> Tempo -> Maybe Int -> [Tempo]
nitrotempo [] _ _ = []
nitrotempo l _ Nothing = l
nitrotempo (h:t) t1 (Just n) | n < 1 && h <= t1 = 0.0 : t
                             | n < 1 && h > t1  = (h-t1) : t
                             | otherwise        = h : nitrotempo t t1 (Just (n-1))