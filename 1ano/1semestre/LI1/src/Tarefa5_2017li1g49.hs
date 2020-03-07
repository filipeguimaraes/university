{-|
Module : Tarefa 5
Description : Módulo com a resolução da tarefa 5
Copyright : Filipe Guimarães <a85308@alunos.uminho.pt>; Gonçalo Ferreira <a84070@alunos.uminho.pt>
-}

module Main where

import LI11718
import Mapas
import Tarefa3_2017li1g49
import Tarefa4_2017li1g49
import Data.Maybe
import Graphics.Gloss                       -- interface gloss
import Graphics.Gloss.Data.Picture          -- importar o tipo Picture
import Graphics.Gloss.Interface.Pure.Game   -- importar o tipo Event
import GHC.Float

------------------------------------------

{-|
Função com um mapa para a criação da pista onde o carro irá andar
-}
mapinha3 :: Mapa
mapinha3 = Mapa ((6,4),Este) [[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0]
                       ,[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca (Curva Norte) (-2),Peca (Rampa Oeste) (-3),Peca (Rampa Oeste) (-4),Peca Recta (-4),Peca Recta (-4),Peca Recta (-4),Peca (Rampa Este) (-4),Peca Recta (-3),Peca (Curva Este) (-3),Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0]
                       ,[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Recta (-2),Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca (Curva Norte) (-3),Peca Recta (-3),Peca Recta (-3),Peca (Curva Sul) (-3),Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0]
                       ,[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Recta (-2),Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Recta (-3),Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0]
                       ,[Peca Lava 0,Peca (Curva Norte) (-2),Peca Recta (-2),Peca Recta (-2),Peca Recta (-2),Peca Recta (-2),Peca Recta (-2),Peca Recta (-2),Peca Recta (-2),Peca (Curva Este) (-2),Peca (Curva Oeste) (-3),Peca Recta (-3),Peca (Rampa Este) (-3),Peca Recta (-2),Peca Recta (-2),Peca (Rampa Este) (-2),Peca (Rampa Oeste) (-2),Peca Recta (-2),Peca (Curva Este) (-2),Peca Lava 0]
                       ,[Peca Lava 0,Peca Recta (-2),Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca (Rampa Sul) (-2),Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca (Curva Oeste) (-2),Peca (Curva Este) (-2),Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Recta (-2),Peca Lava 0]
                       ,[Peca Lava 0,Peca Recta (-2),Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca (Rampa Sul) (-1),Peca (Curva Norte) 0,Peca Recta 0,Peca (Curva Este) 0,Peca Lava 0,Peca (Curva Oeste) (-2),Peca (Curva Este) (-2),Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca (Curva Norte) (-2),Peca (Curva Sul) (-2),Peca Lava 0]
                       ,[Peca Lava 0,Peca Recta (-2),Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Recta 0,Peca Recta 0,Peca Lava 0,Peca Recta 0,Peca Lava 0,Peca Lava 0,Peca Recta (-2),Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Recta (-2),Peca Lava 0,Peca Lava 0]
                       ,[Peca Lava 0,Peca Recta (-2),Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca (Curva Oeste) 0,Peca Recta 0,Peca Recta 0,Peca (Curva Sul) 0,Peca Lava 0,Peca Lava 0,Peca Recta (-2),Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca (Rampa Norte) (-3),Peca Lava 0,Peca Lava 0]
                       ,[Peca Lava 0,Peca (Curva Oeste) (-2),Peca Recta (-2),Peca (Rampa Este) (-2),Peca Recta (-1),Peca (Rampa Este) (-1),Peca (Curva Sul) 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca (Rampa Sul) (-2),Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca (Rampa Norte) (-4),Peca Lava 0,Peca Lava 0]
                       ,[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca (Rampa Sul) (-1),Peca (Curva Norte) (-2),Peca (Curva Este) (-2),Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Recta (-4),Peca Lava 0,Peca Lava 0]
                       ,[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Recta 0,Peca Recta (-2),Peca Recta (-2),Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Recta (-4),Peca Lava 0,Peca Lava 0]
                       ,[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Recta 0,Peca Recta (-2),Peca (Rampa Norte) (-3),Peca Lava 0,Peca (Curva Norte) (-4),Peca Recta (-4),Peca (Curva Sul) (-4),Peca Lava 0,Peca Lava 0]
                       ,[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca (Rampa Norte) (-1),Peca (Rampa Sul) (-2),Peca (Rampa Norte) (-4),Peca Lava 0,Peca Recta (-4),Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0]
                       ,[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Recta (-1),Peca Recta (-1),Peca Recta (-4),Peca Lava 0,Peca Recta (-4),Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0]
                       ,[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca (Curva Oeste) (-1),Peca (Curva Sul) (-1),Peca (Curva Oeste) (-4),Peca Recta (-4),Peca (Curva Sul) (-4),Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0]
                       ,[Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0,Peca Lava 0]]

{-|
Função com propriedades do Jogo
-}
pistaNormal :: Propriedades
pistaNormal = Propriedades {k_atrito = 2.0, k_pneus = 3.0, k_acel = 4.0, k_peso = 2.0, k_nitro = 15.0, k_roda = 180.0}

{-|
Função com propriedades para o Carro nº1
-}
carro1Inicial :: Carro
carro1Inicial = (Carro {posicao = (6,4), direcao = 0, velocidade = (0,0)})

{-|
Função com propriedades para o Carro nº1
-}
carro2Inicial :: Carro
carro2Inicial = (Carro {posicao = (6.2,4), direcao = 0, velocidade = (0,0)})

{-| 
Função com a quantidade de nitro inicial
-}
nitroInicial :: Tempo
nitroInicial = 5

{-|
Função que, juntamente com as anteriores
-}
jogoInicial :: Jogo
jogoInicial = Jogo {mapa = mapinha3, 
                    pista = pistaNormal,
                    carros = [carro1Inicial,carro2Inicial],
                    nitros = [3.0,3.0],
                    historico = [[(6,4)],[(6,4)]]}
tamanhoMapa :: (Float,Float)
tamanhoMapa = (1000,500)
----------------------------------------------------------------------------------------

{-|
Conteúdo de um estado: Dimensões do mapa, Jogo, Imagens das peças que formam o mapa, Imagem do carro1, Imagem do carro2, Tempo passado desde o início do jogo.
-}
type Estado = ((Float,Float),Jogo,[Picture],Picture,Picture,Float)

{-|
Função onde é criado o estado inicial do jogo bem como o carregamento de "bmp's" com as imagens dos carros
-}
estadoInicial :: IO Estado
estadoInicial = do
              reta <- loadBMP "images_Tarefa5_2017li1g49/reta100.bmp" -- carrega a imagem da car
              lava <- loadBMP "images_Tarefa5_2017li1g49/lava100.bmp" 
              curva <- loadBMP "images_Tarefa5_2017li1g49/curvanorte100.bmp" 
              rampa <- loadBMP "images_Tarefa5_2017li1g49/rampa2100.bmp" 
              car1 <- loadBMP "images_Tarefa5_2017li1g49/car1.bmp"
              car2 <- loadBMP "images_Tarefa5_2017li1g49/car3.bmp"
              return (tamanhoMapa,jogoInicial,[lava,reta,curva,rampa],car1,car2,0)





{-|
Função que atribui a cada tipo de Peca uma Picture diferente.
-}
peca2pic :: Peca -> Estado -> Picture
peca2pic (Peca a b) ((x,y),j,[lava,reta,curva,rampa],car1,car2,tp) | a == Lava = lava
                                                                   | a == (Curva Norte) = (Rotate 180 curva)
                                                                   | a == (Curva Este) = (Rotate 90 curva)
                                                                   | a == (Curva Sul) = (Rotate 0 curva)
                                                                   | a == (Curva Oeste) = (Rotate 270 curva)
                                                                   | a == Recta = reta
                                                                   | a == (Rampa Norte) = (Rotate 180 rampa)
                                                                   | a == (Rampa Este) = (Rotate 90 rampa)
                                                                   | a == (Rampa Sul) = (Rotate 0 rampa)
                                                                   | a == (Rampa Oeste) = (Rotate 270 rampa)


{-|
Função que a uma linha de PEcas atribui uma linha com Picture's
-}
linha2pic :: [Peca] -> (Float,Float) -> Estado -> [Picture]
linha2pic [] _ _= []
linha2pic (h:t) (a,b) (dm,j,[lava,reta,curva,rampa],car1,car2,tp) = ((Translate a b (peca2pic h (dm,j,[lava,reta,curva,rampa],car1,car2,tp))) : (linha2pic t (a+100,b) ((dm,j,[lava,reta,curva,rampa],car1,car2,tp)))) 

{-|
Função que a partir de um tabuleiro faz uma lista com todas as linhas de imagens.
-}
tab2pic :: Tabuleiro -> (Float,Float) -> Estado -> [Picture]
tab2pic [] _ _ = []
tab2pic (h:t) (a,b) (dm,j,[lava,reta,curva,rampa],car1,car2,tp) = ((Translate a b (Pictures (linha2pic h (a,b) (dm,j,[lava,reta,curva,rampa],car1,car2,tp)))) : (tab2pic t (a,b+50) (dm,j,[lava,reta,curva,rampa],car1,car2,tp)))

{-
Função que dado um estado que contem um mapa usa as funções linha2pic e tab2pic para criar uma Picture com o mapa completo
-}
pics2pic :: Estado -> Picture
pics2pic ((xMapa,yMapa),(Jogo (Mapa (x,y) t) p c n h),[lava,reta,curva,rampa],car1,car2,tp) = Translate (-xMapa/2) (-yMapa/2) (Pictures (tab2pic t (0,0) ((xMapa,yMapa),(Jogo (Mapa (x,y) t) p c n h),[lava,reta,curva,rampa],car1,car2,tp)))






{-
Função que tem como propósito desenhar tudo o que se passa "por trás" do jogo tal como os carros, o mapa e o tempo.
-}
desenhaEstado :: Estado -> Picture
desenhaEstado ((xMapa,yMapa),(Jogo m p [(Carro (x1,y1) d1 v1),(Carro (x2,y2) d2 v2)] n h),[lava,reta,curva,rampa],car1,car2,tp) = Pictures [mapa, carro1, carro2, time]
       where 
        mapa = Translate (((-xMapa)/4)+75) (((-yMapa)/2)+25) (Scale 0.4 0.4 (Pictures [(pics2pic ((xMapa,yMapa),(Jogo m p [(Carro (x1,y1) d1 v1),(Carro (x2,y2) d2 v2)] n h),[lava,reta,curva,rampa],car1,car2,tp))]))
        carro1 = Translate (((-xMapa)/2)-50) (((-yMapa)/2)-220) (Translate (double2Float (y1*100)) (double2Float (x1*50)) (Scale 0.7 0.7 car1))
        carro2 = Translate (((-xMapa)/2)-50) (((-yMapa)/2)-220) (Translate (double2Float (y2*100)) (double2Float (x2*50)) (Scale 0.7 0.7 car2))
        time = Translate (450) (300) (Scale 0.3 0.3 (Text  (show  tp)))

        
{-|
Função auxiliar de reageEvento que calcula o novo jogo.
-}
atualizaMovimenta :: Tempo -> Jogo -> Int -> Acao -> Jogo
atualizaMovimenta t (Jogo (Mapa (x,y) tab) p [cr1,cr2] n h) nj a = jogoAct t nj (Jogo (Mapa (x,y) tab) p (carrosAct t tab [cr1,cr2]) n h) a 

{-|
Função auxiliar de atualixaMovimenta que usa a atualiza definida na tarefa 4
-}
jogoAct :: Tempo -> Int -> Jogo -> Acao -> Jogo
jogoAct tp n jg a = atualiza tp jg n a


{-|
Função auxiliar de atualixaMovimenta que usa a movimenta definida na tarefa 3
-}
carrosAct :: Tempo -> Tabuleiro -> [Carro] -> [Carro]
carrosAct _ _ [] = []
carrosAct tp t (c1:ct) = (fromMaybe c1 (movimenta t tp c1)) : (carrosAct tp t ct)


{-|
Função que define o que acontece ao pressionar as diversas teclas definidas para se poder interagir com o jogo
-}
reageEvento :: Event -> Estado -> Estado
reageEvento (EventKey (SpecialKey KeyUp) Down _ _) (dm,(Jogo mp p c [n1,n2] h),im,c1,c2,tp) = (dm,(atualizaMovimenta 0.3 (Jogo mp p c [n1,n2] h) 1 (Acao True False False False Nothing)),im,c1,c2,tp)
reageEvento (EventKey (SpecialKey KeyDown) Down _ _) (dm,(Jogo mp p c [n1,n2] h),im,c1,c2,tp) = (dm,(atualizaMovimenta 0.3 (Jogo mp p c [n1,n2] h) 1 (Acao False True False False Nothing)),im,c1,c2,tp)
reageEvento (EventKey (SpecialKey KeyLeft) Down _ _) (dm,(Jogo mp p c [n1,n2] h),im,c1,c2,tp) = (dm,(atualizaMovimenta 0.3 (Jogo mp p c [n1,n2] h) 1 (Acao False False True False Nothing)),im,c1,c2,tp)
reageEvento (EventKey (SpecialKey KeyRight) Down _ _) (dm,(Jogo mp p c [n1,n2] h),im,c1,c2,tp) = (dm,(atualizaMovimenta 0.3 (Jogo mp p c [n1,n2] h) 1 (Acao False False False True Nothing)),im,c1,c2,tp)
reageEvento (EventKey (SpecialKey KeyShiftR) Down _ _) (dm,(Jogo mp p c [n1,n2] h),im,c1,c2,tp) = (dm,(atualizaMovimenta 0.3 (Jogo mp p c [(n1-1),n2] h) 1 (Acao False False False False (Just 1))),im,c1,c2,tp)
reageEvento (EventKey (SpecialKey KeyPad8) Down _ _) (dm,(Jogo mp p c [n1,n2] h),im,c1,c2,tp) = (dm,(atualizaMovimenta 0.3 (Jogo mp p c [n1,n2] h) 2 (Acao True False False False Nothing)),im,c1,c2,tp)
reageEvento (EventKey (SpecialKey KeyPad4) Down _ _) (dm,(Jogo mp p c [n1,n2] h),im,c1,c2,tp) = (dm,(atualizaMovimenta 0.3 (Jogo mp p c [n1,n2] h) 2 (Acao False True False False Nothing)),im,c1,c2,tp)
reageEvento (EventKey (SpecialKey KeyPad6) Down _ _) (dm,(Jogo mp p c [n1,n2] h),im,c1,c2,tp) = (dm,(atualizaMovimenta 0.3 (Jogo mp p c [n1,n2] h) 2 (Acao False False True False Nothing)),im,c1,c2,tp)
reageEvento (EventKey (SpecialKey KeyPad5) Down _ _) (dm,(Jogo mp p c [n1,n2] h),im,c1,c2,tp) = (dm,(atualizaMovimenta 0.3 (Jogo mp p c [n1,n2] h) 2 (Acao False False False True Nothing)),im,c1,c2,tp)
reageEvento (EventKey (SpecialKey KeyPad7) Down _ _) (dm,(Jogo mp p c [n1,n2] h),im,c1,c2,tp) = (dm,(atualizaMovimenta 0.3 (Jogo mp p c [n1,(n2-1)] h) 2 (Acao False False False False (Just 1))),im,c1,c2,tp)
reageEvento _ s = s


{-|
Função que altera o estado quando o tempo avança t segundos
-}
reageTempo :: Float -> Estado -> Estado
reageTempo t (dm,j,i,car1,car2,tp)  = (dm,j,i,car1,car2,tp+t)


{-|
Função que cria o jogo
-}
joga :: Estado -> IO ()
joga inicio = play
    (InWindow "Novo Jogo" (1280,720) (0, 0))  -- tamanho da janela do jogo
    (makeColorI 50 10 0 0)                    -- cor do fundo da janela
    60                                        -- refresh rate
    inicio                                    -- estado inicial
    desenhaEstado                             -- função que desenha o estado do jogo
    reageEvento                               -- reage a um evento
    reageTempo                                -- reage ao passar do tempo

{-|
Função principal usada para animar um jogo completo.
Compilar com o GHC.
-}
main :: IO ()
main = do
       inicio <- estadoInicial 
       joga inicio