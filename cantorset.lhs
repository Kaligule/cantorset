Cantorset
=========

> import Diagrams.Prelude
> import Diagrams.Backend.SVG.CmdLine



The cantor set C can be defined as the intersection of all the sets C_n with n <- [0..] where
C_0 = [0,1] (The Intervall of all real numbers between 0 and 1)
C_n = 1/3 * (C_(n-1) U 2 + C_(n-1)) (where U stands for the union of the two sets)

[Source](http://en.wikipedia.org/wiki/Cantor_set)
We will follow this definition when we draw these sets.

All the cantorlines
-------------------

Instead of intersecting all the sets we draw below each other so one can get the idea.

> main :: IO() 
> main = do mainWith (cantorEvolution :: Diagram B R2)

> cantorEvolution :: Diagram B R2
> cantorEvolution = vcat' (with & sep .~ 0.125) (map cantorLine [0 .. 8]) # centerXY
>                                                                       # pad 1.1
>                                                                       # bg white

A single cantorline
-------------------

Instead of C_n we will write cantorLine n, just for convinience.

> cantorLine :: Int -> Diagram B R2
> cantorLine 0 = fromOffsets [unitX] -- # showOrigin 
> cantorLine n = scale (1/3) $ cantorLine (n-1)
>                           <> cantorLine (n-1) # translateX 2

(Note that the origin of a segment is always on its left border instead of the middle. Thats why scaling lets the left boarder unaffected and changes the length of the segmet only on the right side.
We could also have writen ```cantorLine 0 = hrule 1 # translateX (1/2)```)

