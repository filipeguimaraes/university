{-|
Module : Tarefa 2
Description : Módulo com a resolução da tarefa 2
Copyright : Filipe Guimarães <a85308@alunos.uminho.pt>; Gonçalo Ferreira <a84070@alunos.uminho.pt>
Módulo onde é definida a função "valida :: Mapa -> Bool" que ao receber um mapa verifica se é valido ou não.
-}
module Tarefa2_2017li1g49 where

import LI11718

{-|
Função que contem uma lista com tabuleiros teste.
-}
testesT2 :: [Tabuleiro]
testesT2 = [tr,tr1,tr2,tr3,tr4,tr5]

{-|
Tabuleiro para efeitos de teste.
-}
tr,tr1,tr2,tr3,tr4,tr5 :: Tabuleiro
tr  = [[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0],[Peca Lava 0,Peca (Curva Norte) 0,Peca Recta 0,Peca (Curva Este) 0,Peca Lava 0],[Peca Lava 0,Peca (Rampa Sul) 0,Peca Lava 0,Peca (Rampa Sul) 0,Peca Lava 0],[Peca Lava 0,Peca (Curva Oeste) 1,Peca Recta 1,Peca (Curva Sul) 1,Peca Lava 0],[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0]]
tr1 = [[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0],[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca (Curva Norte) 0,Peca Recta 0,Peca (Curva Este) 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0],[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Recta 0,Peca Lava 0,Peca (Rampa Norte) (-1),Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0],[Peca Lava 0,Peca (Curva Norte) 0,Peca Recta 0,Peca Recta 0,Peca (Curva Sul) 0,Peca Lava 0,Peca Recta (-1),Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0],[Peca Lava 0,Peca Recta 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca (Curva Oeste) (-1),Peca (Curva Este) (-1),Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0],[Peca Lava 0,Peca Recta 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca (Curva Oeste) (-1),Peca (Curva Este) (-1),Peca Lava 0,Peca Lava 0,Peca Lava 0],[Peca Lava 0,Peca (Rampa Norte) (-1),Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca (Curva Norte) (-1),Peca (Curva Sul) (-1),Peca Lava 0,Peca Lava 0,Peca Lava 0],[Peca Lava 0,Peca (Rampa Norte) (-2),Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca (Curva Norte) (-1),Peca (Curva Sul) (-1),Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0],[Peca Lava 0,Peca (Curva Oeste) (-2),Peca Recta (-2),Peca (Curva Este) (-2),Peca Lava 0,Peca Lava 0,Peca (Curva Oeste) (-1),Peca Recta (-1),Peca Recta (-1),Peca (Rampa Oeste) (-2),Peca (Curva Este) (-2),Peca Lava 0],[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca (Curva Oeste) (-2),Peca (Curva Este) (-2),Peca Lava 0,Peca (Curva Norte) (-3),Peca (Rampa Este) (-3),Peca Recta (-2),Peca Recta (-2),Peca (Curva Sul) (-2),Peca Lava 0],[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca (Curva Oeste) (-2),Peca (Rampa Oeste) (-3),Peca (Curva Sul) (-3),Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0],[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0]]
tr2 = [[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0],[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca (Curva Norte) 0,Peca Recta 0,Peca (Curva Este) 0,Peca Lava 0],[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Recta 0,Peca Lava 0,Peca Recta 0,Peca Lava 0],[Peca Lava 0,Peca (Curva Norte) 0,Peca Recta 0,Peca Recta 0,Peca Recta 0,Peca (Curva Sul) 0,Peca Lava 0],[Peca Lava 0,Peca Recta 0,Peca Lava 0,Peca Recta 0,Peca Lava 0,Peca Lava 0,Peca Lava 0],[Peca Lava 0,Peca (Curva Oeste) 0,Peca Recta 0,Peca (Curva Sul) 0,Peca Lava 0,Peca Lava 0,Peca Lava 0],[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0]]
tr3 = [[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0],[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca (Curva Norte) 0,Peca Recta 0,Peca (Rampa Este) 0,Peca (Rampa Oeste) 0,Peca (Rampa Oeste) (-1),Peca (Rampa Oeste) (-2),Peca (Rampa Oeste) (-3),Peca (Curva Este) (-3),Peca Lava 0],[Peca Lava 0,Peca Lava 0,Peca (Curva Norte) 0,Peca Recta 0,Peca Recta 0,Peca (Curva Este) 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca (Rampa Norte) (-4),Peca Lava 0],[Peca Lava 0,Peca Lava 0,Peca Recta 0,Peca Lava 0,Peca (Rampa Norte) (-1),Peca (Rampa Norte) (-1),Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Recta (-4),Peca Lava 0],[Peca Lava 0,Peca (Curva Norte) 0,Peca (Curva Sul) 0,Peca Lava 0,Peca (Rampa Norte) (-2),Peca (Curva Oeste) (-1),Peca (Rampa Oeste) (-2),Peca (Rampa Oeste) (-3),Peca (Rampa Oeste) (-4),Peca (Curva Este) (-4),Peca Lava 0,Peca Recta (-4),Peca Lava 0],[Peca Lava 0,Peca Recta 0,Peca Lava 0,Peca Lava 0,Peca Recta (-2),Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca (Curva Norte) (-4),Peca (Curva Sul) (-4),Peca Lava 0,Peca Recta (-4),Peca Lava 0],[Peca Lava 0,Peca (Curva Oeste) 0,Peca (Rampa Oeste) (-1),Peca (Rampa Oeste) (-2),Peca Recta (-2),Peca Recta (-2),Peca (Curva Este) (-2),Peca Lava 0,Peca (Curva Oeste) (-4),Peca (Curva Este) (-4),Peca Lava 0,Peca Recta (-4),Peca Lava 0],[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Recta (-2),Peca Lava 0,Peca (Rampa Norte) (-3),Peca Lava 0,Peca Lava 0,Peca Recta (-4),Peca (Curva Norte) (-4),Peca (Curva Sul) (-4),Peca Lava 0],[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Recta (-2),Peca Lava 0,Peca Recta (-3),Peca Lava 0,Peca Lava 0,Peca (Curva Oeste) (-4),Peca (Curva Sul) (-4),Peca Lava 0,Peca Lava 0],[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca (Curva Oeste) (-2),Peca (Rampa Oeste) (-3),Peca (Curva Sul) (-3),Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0],[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0]]
tr4 = [[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0],[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca (Curva Norte) 0,Peca Recta 0,Peca (Rampa Este) 0,Peca (Rampa Oeste) 0,Peca (Rampa Oeste) (-1),Peca (Rampa Oeste) (-2),Peca (Rampa Oeste) (-3),Peca (Curva Este) (-3),Peca Lava 0],[Peca Lava 0,Peca Lava 0,Peca (Curva Norte) (-2),Peca Recta (-2),Peca Recta 0,Peca (Curva Este) 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca (Rampa Norte) (-4),Peca Lava 0],[Peca Lava 0,Peca Lava 0,Peca Recta (-2),Peca Lava 0,Peca (Rampa Norte) (-1),Peca (Rampa Norte) (-1),Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Recta (-4),Peca Lava 0],[Peca Lava 0,Peca (Curva Norte) (-2),Peca (Curva Sul) (-2),Peca Lava 0,Peca Recta (-1),Peca (Curva Oeste) (-1),Peca (Rampa Oeste) (-2),Peca (Rampa Oeste) (-3),Peca (Rampa Oeste) (-4),Peca (Curva Este) (-4),Peca Lava 0,Peca Recta (-4),Peca Lava 0],[Peca Lava 0,Peca Recta (-2),Peca Lava 0,Peca Lava 0,Peca Recta (-1),Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca (Curva Norte) (-4),Peca (Curva Sul) (-4),Peca Lava 0,Peca Recta (-4),Peca Lava 0],[Peca Lava 0,Peca (Curva Oeste) (-2),Peca Recta (-2),Peca Recta (-2),Peca Recta (-2),Peca Recta (-2),Peca (Curva Este) (-2),Peca Lava 0,Peca (Curva Oeste) (-4),Peca (Curva Este) (-4),Peca Lava 0,Peca Recta (-4),Peca Lava 0],[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Recta (-1),Peca Lava 0,Peca Recta (-2),Peca Lava 0,Peca Lava 0,Peca Recta (-4),Peca (Curva Norte) (-4),Peca (Curva Sul) (-4),Peca Lava 0],[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Recta (-1),Peca Lava 0,Peca Recta (-2),Peca Lava 0,Peca Lava 0,Peca (Curva Oeste) (-4),Peca (Curva Sul) (-4),Peca Lava 0,Peca Lava 0],[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca (Curva Oeste) (-1),Peca (Rampa Oeste) (-2),Peca (Curva Sul) (-2),Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0],[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0]]
tr5 = [[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0],[Peca Lava 0,Peca Lava 0,Peca (Curva Norte) (-2),Peca (Rampa Este) (-2),Peca (Curva Este) (-1),Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca (Curva Norte) 0,Peca Recta 0,Peca (Curva Este) 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0],[Peca Lava 0,Peca Lava 0,Peca Recta (-2),Peca Lava 0,Peca (Rampa Sul) (-1),Peca (Curva Norte) 0,Peca (Curva Este) 0,Peca Lava 0,Peca (Curva Oeste) 0,Peca (Curva Este) 0,Peca (Curva Oeste) 0,Peca (Rampa Este) 0,Peca (Curva Este) 1,Peca Lava 0,Peca Lava 0,Peca Lava 0],[Peca Lava 0,Peca (Curva Norte) (-2),Peca (Curva Sul) (-2),Peca Lava 0,Peca (Curva Oeste) 0,Peca (Curva Sul) 0,Peca (Curva Oeste) 0,Peca (Curva Este) 0,Peca Lava 0,Peca (Rampa Sul) 0,Peca Lava 0,Peca Lava 0,Peca (Curva Oeste) 1,Peca (Curva Este) 1,Peca Lava 0,Peca Lava 0],[Peca Lava 0,Peca (Curva Oeste) (-2),Peca (Curva Este) (-2),Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca (Curva Norte) 0,Peca (Curva Sul) 0,Peca Lava 0,Peca (Curva Oeste) 1,Peca (Curva Este) 1,Peca Lava 0,Peca Lava 0,Peca (Curva Oeste) 1,Peca (Curva Este) 1,Peca Lava 0],[Peca Lava 0,Peca (Curva Norte) (-2),Peca (Curva Sul) (-2),Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca (Curva Oeste) 0,Peca (Curva Este) 0,Peca Lava 0,Peca Lava 0,Peca (Rampa Norte) 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca (Rampa Sul) 1,Peca Lava 0],[Peca Lava 0,Peca (Curva Oeste) (-2),Peca (Curva Este) (-2),Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca (Curva Oeste) 0,Peca (Curva Este) 0,Peca (Curva Norte) 0,Peca (Curva Sul) 0,Peca Lava 0,Peca Lava 0,Peca (Curva Norte) 2,Peca (Curva Sul) 2,Peca Lava 0],[Peca Lava 0,Peca Lava 0,Peca (Rampa Sul) (-2),Peca (Curva Norte) (-1),Peca (Curva Este) (-1),Peca Lava 0,Peca Lava 0,Peca (Curva Norte) 0,Peca Recta 0,Peca (Curva Sul) 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca (Rampa Sul) 2,Peca Lava 0,Peca Lava 0],[Peca Lava 0,Peca Lava 0,Peca (Curva Oeste) (-1),Peca (Curva Sul) (-1),Peca (Curva Oeste) (-1),Peca (Curva Este) (-1),Peca Lava 0,Peca Recta 0,Peca (Curva Oeste) 0,Peca (Rampa Este) 0,Peca Recta 1,Peca (Rampa Este) 1,Peca (Rampa Este) 2,Peca (Curva Sul) 3,Peca Lava 0,Peca Lava 0],[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca (Curva Norte) (-1),Peca (Curva Sul) (-1),Peca (Curva Norte) 0,Peca (Curva Sul) 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0],[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca (Rampa Sul) (-1),Peca (Curva Norte) 0,Peca (Curva Sul) 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0],[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca (Curva Oeste) 0,Peca (Curva Sul) 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0],[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0]]

{-|
Função que valida um mapa.

== Exemplos de utilização

>>> valida (Mapa ((2,1),Este) ([[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0],[Peca Lava 0,Peca (Curva Norte) 0,Peca Recta 0,Peca (Curva Este) 0,Peca Lava 0],[Peca Lava 0,Peca (Rampa Sul) 0,Peca Lava 0,Peca (Rampa Sul) 0,Peca Lava 0],[Peca Lava 0,Peca (Curva Oeste) 1,Peca Recta 1,Peca (Curva Sul) 1,Peca Lava 0],[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0]]))
True
-}
valida :: Mapa -> Bool
valida (Mapa ((x,y),o) t) = validaLpeca (peca2estrada (Mapa ((x,y),o) t) (findPeca (x,y) t) (contaPecas t 0) (x,y) []) && retangulo t && checkLava (bordasLava t (0,0)) && checkLava (takeLava t) && iniFim (peca2estrada (Mapa ((x,y),o) t) (findPeca (x,y) t) (contaPecas t 0) (x,y) [])

{-|
Função que verifica se um determinado tabuleiro é retangulo. 

== Exemplos de utilização

>>>retangulo [[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0],[Peca Lava 0,Peca (Curva Norte) 0,Peca Recta 0,Peca (Curva Este) 0,Peca Lava 0],[Peca Lava 0,Peca (Rampa Sul) 0,Peca Lava 0,Peca (Rampa Sul) 0,Peca Lava 0],[Peca Lava 0,Peca (Curva Oeste) 1,Peca Recta 1,Peca (Curva Sul) 1,Peca Lava 0],[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0]]
True

>>>retangulo [[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0],[Peca Lava 0,Peca (Curva Norte) 0,Peca Recta 0,Peca (Curva Este) 0,Peca Lava 0],[Peca Lava 0,Peca (Rampa Sul) 0,Peca Lava 0,Peca (Rampa Sul) 0,Peca Lava 0],[Peca Lava 0,Peca (Curva Oeste) 1,Peca Recta 1,Peca (Curva Sul) 1,Peca Lava 0],[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0]]
False 
-}
retangulo :: Tabuleiro -> Bool
retangulo [a] = True
retangulo (h:t:m) = if length h == length t then retangulo (t:m) else False

{-|
Função que retira as bordas de um determinado tabuleiro.

== Exemplos de utilização

>>>bordasLava [[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0],[Peca Lava 0,Peca (Curva Norte) 0,Peca Recta 0,Peca (Curva Este) 0,Peca Lava 0],[Peca Lava 0,Peca (Rampa Sul) 0,Peca Lava 0,Peca (Rampa Sul) 0,Peca Lava 0],[Peca Lava 0,Peca (Curva Oeste) 1,Peca Recta 1,Peca (Curva Sul) 1,Peca Lava 0],[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0]] (0,0)
[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0]
-}
bordasLava :: Tabuleiro -> Posicao -> [Peca]
bordasLava [] _ = []
bordasLava [n] (x,y) = []
bordasLava ((h:t):m:n) (x,y) | y == 0 = (h:t) ++ last ((h:t):m:n) ++ bordasLava (m:n) (0,y+1)
                             | x == 0 = [h] ++ [last (h:t)] ++ bordasLava ((t):m:n) (x+1,y)
                             | otherwise = bordasLava (m:n) (0,y)

{-|
Função que pega na lista gerada pela "bordasLava" e verifica se todos os elemetos são peças lava.

== Exemplos de utilização

>>>check lava [Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0]
True

>>>check lava [Peca Recta 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0]
False
-}
checkLava :: [Peca] -> Bool
checkLava [] = True
checkLava (h:t) | (Peca Lava 0) == h = checkLava t
                | otherwise = False

{-|
__Função auxiliar__ do check lava que pega num tabuleiro e faz uma lista com as peças do tipo Lava desse tabuleiro.

== Exemplos de utilização

>>>takeLava [[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0],[Peca Lava 0,Peca (Curva Norte) 0,Peca Recta 0,Peca (Curva Este) 0,Peca Lava 0],[Peca Lava 0,Peca (Rampa Sul) 0,Peca Lava 0,Peca (Rampa Sul) 0,Peca Lava 0],[Peca Lava 0,Peca (Curva Oeste) 1,Peca Recta 1,Peca (Curva Sul) 1,Peca Lava 0],[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0]]
[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0]


-}
takeLava :: Tabuleiro -> [Peca]
takeLava [[(Peca x y)]] | x == Lava = [(Peca x y)]
                        | otherwise = []
takeLava ([]:m) = takeLava (m)                                
takeLava (((Peca x y):t):m) | x /= Lava = takeLava ((t):m)
                              | otherwise = (Peca x y) : takeLava ((t):m)

{-|
__Função auxiliar__ "ValidaLpeca" que verifica se a última peça do tabuleiro é compatível com a primeira.

== Exemplos de utilização

>>> iniFim [(Peca Recta 0,(2,1),Este),(Peca (Curva Este) 0,(3,1),Este),(Peca (Rampa Sul) 0,(3,2),Sul),(Peca (Curva Sul) 1,(3,3),Sul),(Peca Recta 1,(2,3),Oeste),(Peca (Curva Oeste) 1,(1,3),Oeste),(Peca (Rampa Sul) 0,(1,2),Norte),(Peca (Curva Norte) 0,(1,1),Norte)]
[(Peca Recta 0,(2,1),Este),(Peca (Curva Este) 0,(3,1),Este),(Peca (Rampa Sul) 0,(3,2),Sul),(Peca (Curva Sul) 1,(3,3),Sul),(Peca Recta 1,(2,3),Oeste),(Peca (Curva Oeste) 1,(1,3),Oeste),(Peca (Rampa Sul) 0,(1,2),Norte),(Peca (Curva Norte) 0,(1,1),Norte)]

-}
iniFim :: [(Peca,Posicao,Orientacao)] -> Bool
iniFim l = validaLpeca [last l,head l]

{-|
Função que identifica qual é uma peça numa determinada posição.

== Exemplos de utilização

>>>findPeca (2,1) ([[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0],[Peca Lava 0,Peca (Curva Norte) 0,Peca Recta 0,Peca (Curva Este) 0,Peca Lava 0],[Peca Lava 0,Peca (Rampa Sul) 0,Peca Lava 0,Peca (Rampa Sul) 0,Peca Lava 0],[Peca Lava 0,Peca (Curva Oeste) 1,Peca Recta 1,Peca (Curva Sul) 1,Peca Lava 0],[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0]])
Peca Recta 0

-}
findPeca :: Posicao -> Tabuleiro -> Peca
findPeca _ [] = Peca Lava 0
findPeca (x,y) (h:t) | y == 0    = aux_fPeca x h
                     | y < 0 = Peca Lava 0
                     | otherwise = findPeca (x,y-1) t

{-|
_Função auxiliar_ de "findPeca" que procura uma peça numa determinada coluna.

== Exemplos de utilização

>>> aux_fPeca 2 [Peca Lava 0,Peca (Curva Norte) 0,Peca Recta 0,Peca (Curva Este) 0,Peca Lava 0]
Peca Recta 0
-}
aux_fPeca :: Int -> [Peca] -> Peca
aux_fPeca _ [] = Peca Lava 0 
aux_fPeca a (h:t) | a == 0    = h
                  | a < 0 = Peca Lava 0
                  | otherwise = aux_fPeca (a-1) t

{-|
Função que 
== Exemplos de utilização

>>>peca2estrada ((Mapa ((2,1),Este) [[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0],[Peca Lava 0,Peca (Curva Norte) 0,Peca Recta 0,Peca (Curva Este) 0,Peca Lava 0],[Peca Lava 0,Peca (Rampa Sul) 0,Peca Lava 0,Peca (Rampa Sul) 0,Peca Lava 0],[Peca Lava 0,Peca (Curva Oeste) 1,Peca Recta 1,Peca (Curva Sul) 1,Peca Lava 0],[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0]])) (Peca Recta 0) 8 (2,1) []
peca2estrada ((Mapa ((2,1),Este) [[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0],[Peca Lava 0,Peca (Curva Norte) 0,Peca Recta 0,Peca (Curva Este) 0,Peca Lava 0],[Peca Lava 0,Peca (Rampa Sul) 0,Peca Lava 0,Peca (Rampa Sul) 0,Peca Lava 0],[Peca Lava 0,Peca (Curva Oeste) 1,Peca Recta 1,Peca (Curva Sul) 1,Peca Lava 0],[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0]])) (Peca Recta 0) 8 (2,1) []
[(Peca Recta 0,(2,1),Este),(Peca (Curva Este) 0,(3,1),Este),(Peca (Rampa Sul) 0,(3,2),Sul),(Peca (Curva Sul) 1,(3,3),Sul),(Peca Recta 1,(2,3),Oeste),(Peca (Curva Oeste) 1,(1,3),Oeste),(Peca (Rampa Sul) 0,(1,2),Norte),(Peca (Curva Norte) 0,(1,1),Norte)]
-}
peca2estrada :: Mapa -> Peca -> Int -> Posicao -> [Posicao] -> [(Peca,Posicao,Orientacao)] 
peca2estrada (Mapa ((x,y),o) (h:t)) (Peca a z) p k l | p == 0 = []
                                                     | o == Este  && elem k l = ((Peca a z),(x,y),o) : peca2estrada (Mapa ((posPecas (x,y) (oriPecas a o)),(oriPecas a o)) (h:t)) (findPeca (posPecas (x,y) (oriPecas a o)) (h:t)) p (posPecas (x,y) (oriPecas a o)) ((x,y):l)
                                                     | o == Oeste && elem k l = ((Peca a z),(x,y),o) : peca2estrada (Mapa ((posPecas (x,y) (oriPecas a o)),(oriPecas a o)) (h:t)) (findPeca (posPecas (x,y) (oriPecas a o)) (h:t)) p (posPecas (x,y) (oriPecas a o)) ((x,y):l)
                                                     | o == Norte && elem k l = ((Peca a z),(x,y),o) : peca2estrada (Mapa ((posPecas (x,y) (oriPecas a o)),(oriPecas a o)) (h:t)) (findPeca (posPecas (x,y) (oriPecas a o)) (h:t)) p (posPecas (x,y) (oriPecas a o)) ((x,y):l)
                                                     | o == Sul   && elem k l = ((Peca a z),(x,y),o) : peca2estrada (Mapa ((posPecas (x,y) (oriPecas a o)),(oriPecas a o)) (h:t)) (findPeca (posPecas (x,y) (oriPecas a o)) (h:t)) p (posPecas (x,y) (oriPecas a o)) ((x,y):l)
                                                     | o == Este  = ((Peca a z),(x,y),o) : peca2estrada (Mapa ((posPecas (x,y) (oriPecas a o)),(oriPecas a o)) (h:t)) (findPeca (posPecas (x,y) (oriPecas a o)) (h:t)) (p-1) (posPecas (x,y) (oriPecas a o)) ((x,y):l)
                                                     | o == Oeste = ((Peca a z),(x,y),o) : peca2estrada (Mapa ((posPecas (x,y) (oriPecas a o)),(oriPecas a o)) (h:t)) (findPeca (posPecas (x,y) (oriPecas a o)) (h:t)) (p-1) (posPecas (x,y) (oriPecas a o)) ((x,y):l)
                                                     | o == Norte = ((Peca a z),(x,y),o) : peca2estrada (Mapa ((posPecas (x,y) (oriPecas a o)),(oriPecas a o)) (h:t)) (findPeca (posPecas (x,y) (oriPecas a o)) (h:t)) (p-1) (posPecas (x,y) (oriPecas a o)) ((x,y):l)
                                                     | otherwise  = ((Peca a z),(x,y),o) : peca2estrada (Mapa ((posPecas (x,y) (oriPecas a o)),(oriPecas a o)) (h:t)) (findPeca (posPecas (x,y) (oriPecas a o)) (h:t)) (p-1) (posPecas (x,y) (oriPecas a o)) ((x,y):l)

{-|
Função que calcula onde uma determinada peça se situa após uma curva. Onde em __ "oriPecas (Curva a) o" __  __a__ é a orientação da curva e __o__ é de onde vem o carro.

== Exemplos de utilização

>>>oriPecas (Curva Norte) Oeste
Sul
-}
oriPecas :: Tipo -> Orientacao -> Orientacao
oriPecas (Curva a) o | a == Sul   && o == Este  = Norte
                     | a == Sul   && o == Sul   = Oeste
                     | a == Norte && o == Norte = Este
                     | a == Norte && o == Oeste = Sul
                     | a == Oeste && o == Sul   = Este
                     | a == Oeste && o == Oeste = Norte
                     | a == Este  && o == Este  = Sul
                     | otherwise  = Oeste
oriPecas _ o = o

{-|
__Função auxiliar__ da "peca2estrada" que  calcula a posição em que estamos no tabuleiro apósuma dada orientação.

== Exemplos de utilização

>>>posPecas (2,3) Norte
(2,2)

-}
posPecas :: Posicao -> Orientacao -> Posicao
posPecas (x,y) o | o == Norte = (x,y-1)
                 | o == Sul   = (x,y+1)
                 | o == Oeste = (x-1,y)
                 | otherwise  = (x+1,y)

{-|
Função que conta quantas peças que não são Lava num determinado tabuleiro.

== Exemplos de utilização

>>> contaPecas [[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0],[Peca Lava 0,Peca (Curva Norte) 0,Peca Recta 0,Peca (Curva Este) 0,Peca Lava 0],[Peca Lava 0,Peca (Rampa Sul) 0,Peca Lava 0,Peca (Rampa Sul) 0,Peca Lava 0],[Peca Lava 0,Peca (Curva Oeste) 1,Peca Recta 1,Peca (Curva Sul) 1,Peca Lava 0],[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0]] 0
8
-}
contaPecas :: Tabuleiro -> Int -> Int
contaPecas [] a = a
contaPecas ([]:t) a = contaPecas t a
contaPecas ((n:m):t) a | n == Peca Lava 0 = contaPecas ((m):t) a
                       | otherwise        = contaPecas ((m):t) (a+1)

{-|
Função que verifica se as peças são compatives com as em sua volta.

== Exemplos de utilização

>>> validaLpeca [(Peca Recta 0,(2,1),Este),(Peca (Curva Este) 0,(3,1),Este),(Peca (Rampa Sul) 0,(3,2),Sul),(Peca (Curva Sul) 1,(3,3),Sul),(Peca Recta 1,(2,3),Oeste),(Peca (Curva Oeste) 1,(1,3),Oeste),(Peca (Rampa Sul) 0,(1,2),Norte),(Peca (Curva Norte) 0,(1,1),Norte)]
True

>>> validaLpeca [(Peca Recta 0,(2,1),Sul),(Peca (Curva Este) 0,(3,1),Este),(Peca (Rampa Sul) 0,(3,2),Sul),(Peca (Curva Sul) 1,(3,3),Sul),(Peca Recta 1,(2,3),Oeste),(Peca (Curva Oeste) 1,(1,3),Oeste),(Peca (Rampa Sul) 0,(1,2),Norte),(Peca (Curva Norte) 0,(1,1),Norte)]
False
-}
validaLpeca :: [(Peca,Posicao,Orientacao)] -> Bool
validaLpeca [a] = True
validaLpeca ((Peca Recta h1,l1,o1):(Peca Recta h2,l2,o2):e) = h1 == h2 && validaLpeca ((Peca Recta h2,l2,o2):e)
validaLpeca (((Peca (Curva o1) h1),x,q):((Peca (Curva o2) h2),y,w):e) | q == Sul   && w == Este  && o1 == Oeste && o2 == Este  && h1 == h2 = validaLpeca ((Peca (Curva o2) h2,y,w):e)
                                                                      | q == Sul   && w == Oeste && o1 == Sul   && o2 == Norte && h1 == h2 = validaLpeca ((Peca (Curva o2) h2,y,w):e)
                                                                      | q == Sul   && w == Este  && o1 == Oeste && o2 == Sul   && h1 == h2 = validaLpeca ((Peca (Curva o2) h2,y,w):e)
                                                                      | q == Sul   && w == Oeste && o1 == Sul   && o2 == Oeste && h1 == h2 = validaLpeca ((Peca (Curva o2) h2,y,w):e)
                                                                      | q == Norte && w == Oeste && o1 == Este  && o2 == Oeste && h1 == h2 = validaLpeca ((Peca (Curva o2) h2,y,w):e)
                                                                      | q == Norte && w == Este  && o1 == Norte && o2 == Sul   && h1 == h2 = validaLpeca ((Peca (Curva o2) h2,y,w):e)
                                                                      | q == Norte && w == Oeste && o1 == Este  && o2 == Norte && h1 == h2 = validaLpeca ((Peca (Curva o2) h2,y,w):e)
                                                                      | q == Norte && w == Este  && o1 == Norte && o2 == Este  && h1 == h2 = validaLpeca ((Peca (Curva o2) h2,y,w):e)
                                                                      | q == Este  && w == Sul   && o1 == Este  && o2 == Oeste && h1 == h2 = validaLpeca ((Peca (Curva o2) h2,y,w):e)
                                                                      | q == Este  && w == Norte && o1 == Sul   && o2 == Norte && h1 == h2 = validaLpeca ((Peca (Curva o2) h2,y,w):e)
                                                                      | q == Este  && w == Sul   && o1 == Este  && o2 == Sul   && h1 == h2 = validaLpeca ((Peca (Curva o2) h2,y,w):e)
                                                                      | q == Este  && w == Norte && o1 == Sul   && o2 == Este  && h1 == h2 = validaLpeca ((Peca (Curva o2) h2,y,w):e)                                                                      
                                                                      | q == Oeste && w == Norte && o1 == Oeste && o2 == Este  && h1 == h2 = validaLpeca ((Peca (Curva o2) h2,y,w):e)
                                                                      | q == Oeste && w == Sul   && o1 == Norte && o2 == Sul   && h1 == h2 = validaLpeca ((Peca (Curva o2) h2,y,w):e)
                                                                      | q == Oeste && w == Sul   && o1 == Norte && o2 == Oeste && h1 == h2 = validaLpeca ((Peca (Curva o2) h2,y,w):e)
                                                                      | q == Oeste && w == Norte && o1 == Oeste && o2 == Norte && h1 == h2 = validaLpeca ((Peca (Curva o2) h2,y,w):e)
                                                                      | otherwise = False
validaLpeca (((Peca (Curva o) h1),l1,o1):((Peca Recta h2),l2,o2):e) | o == Este  && o2 == Sul   && o1 == Este  && h1 == h2 = validaLpeca ((Peca Recta h2,l2,o2):e)
                                                                    | o == Este  && o2 == Oeste && o1 == Norte && h1 == h2 = validaLpeca ((Peca Recta h2,l2,o2):e)
                                                                    | o == Oeste && o2 == Norte && o1 == Oeste && h1 == h2 = validaLpeca ((Peca Recta h2,l2,o2):e)
                                                                    | o == Oeste && o2 == Este  && o1 == Sul   && h1 == h2 = validaLpeca ((Peca Recta h2,l2,o2):e)
                                                                    | o == Norte && o2 == Este  && o1 == Norte && h1 == h2 = validaLpeca ((Peca Recta h2,l2,o2):e)
                                                                    | o == Norte && o2 == Sul   && o1 == Oeste && h1 == h2 = validaLpeca ((Peca Recta h2,l2,o2):e)
                                                                    | o == Sul   && o2 == Norte && o1 == Este  && h1 == h2 = validaLpeca ((Peca Recta h2,l2,o2):e)
                                                                    | o == Sul   && o2 == Oeste && o1 == Sul   && h1 == h2 = validaLpeca ((Peca Recta h2,l2,o2):e)
                                                                    | otherwise = False 
validaLpeca (((Peca Recta h2),l2,o2):((Peca (Curva o) h1),l1,o1):e) | o == Este  && o1 == Este  && o2 == Este  && h1 == h2 = validaLpeca (((Peca (Curva o) h1),l1,o1):e)
                                                                    | o == Sul   && o1 == Este  && o2 == Este  && h1 == h2 = validaLpeca (((Peca (Curva o) h1),l1,o1):e)
                                                                    | o == Norte && o1 == Norte && o2 == Norte && h1 == h2 = validaLpeca (((Peca (Curva o) h1),l1,o1):e)
                                                                    | o == Este  && o1 == Norte && o2 == Norte && h1 == h2 = validaLpeca (((Peca (Curva o) h1),l1,o1):e)
                                                                    | o == Norte && o1 == Oeste && o2 == Oeste && h1 == h2 = validaLpeca (((Peca (Curva o) h1),l1,o1):e)
                                                                    | o == Oeste && o1 == Oeste && o2 == Oeste && h1 == h2 = validaLpeca (((Peca (Curva o) h1),l1,o1):e)
                                                                    | o == Oeste && o1 == Sul   && o2 == Sul   && h1 == h2 = validaLpeca (((Peca (Curva o) h1),l1,o1):e)
                                                                    | o == Sul   && o1 == Sul   && o2 == Sul   && h1 == h2 = validaLpeca (((Peca (Curva o) h1),l1,o1):e)
                                                                    | otherwise = False
validaLpeca ((Peca (Rampa o) h1,l1,o1):(Peca (Rampa a) h2,l2,o2):e) | o2 == o1 && o == a && h1 == h2+1 = validaLpeca (((Peca (Rampa a) h2),l2,o2):e)
                                                                    | o2 == o1 && o == a && h1 == h2-1 = validaLpeca (((Peca (Rampa a) h2),l2,o2):e)
                                                                    | o2 == o1 && o /= a && h1 == h2   = validaLpeca (((Peca (Rampa a) h2),l2,o2):e)
                                                                    | otherwise = False
validaLpeca ((Peca (Rampa o) h1,l1,o1):((Peca x h2),l2,o2):e) | h1 == h2     && o /= o1 = True && validaLpeca (((Peca x h2),l2,o2):e)
                                                              | h1 == (h2-1) && o == o1 = True && validaLpeca (((Peca x h2),l2,o2):e)
                                                              | otherwise = False
validaLpeca ((Peca x h1,l1,o1):(Peca (Rampa o) h2,l2,o2):e) | h1 == h2     && o == o2 = True && validaLpeca ((Peca (Rampa o) h2,l2,o2):e)
                                                            | h1 == (h2+1) && o /= o2 = True && validaLpeca ((Peca (Rampa o) h2,l2,o2):e)
                                                            | otherwise = False
validaLpeca ((Peca x _,_,_):(Peca Lava _,_,_):_) = False
validaLpeca ((Peca Lava _,_,_):(Peca _ _,_,_):_) = False
validaLpeca ([]) = False