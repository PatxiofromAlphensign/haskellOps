{-# LANGUAGE DeriveGeneric, FlexibleContexts #-}
{-# LANGUAGE ConstrainedClassMethods #-}
{-# LANGUAGE MultiParamTypeClasses,FlexibleInstances #-} 

module Haskellops where

import qualified Data.List as DList
import Language.Haskell.TH.Lib (DecsQ)
data F a = T a 
data F' a = F {f :: a -> a}


class Mnd a b where 
	mf :: (Monad m)=>a -> m b -- figure out why recursive type defination
	xx :: (Num a)=>a->b->F a
	recurseXx :: (Monad m)=>m a -> m b -- intentional recursive typeStruct 

x +++ y = return x

intToNum :: (Monad m, Num a)=>a->m b->m a
intToNum x y = y >>=  (+++) x >>= return 
intToNum' a = T a 

test0 :: (Monad m)=>m a->m b->m (m b)  
test0 a b = a >>= (+++) b

sumlist :: (Num a)=>[a]->a
sumlist [] = 0 
sumlist (x:xs) = x + sumlist xs

instance Mnd Int (F Int) where
	mf x =  return $ T x
	x `xx` y = do
		let gf (a:_)  = a
	 	T $ gf [1..5] 

test :: (Num a)=>[a] -> F a
test xx = do 
	ff [intToNum' x | x<-xx]
	where ff (a:_) = a

xxx::(Mnd ma a, Num ma)=>ma -> a ->F ma
xxx  a b = xx a b

testx :: (Monad m)=>m (m Int)
testx = test0 (return 1) (return 2)
testx' = test [1..5]

makeBaseFunctor :: (Ord a, Num a, Enum a)=> a -> [a]
makeBaseFunctor a  = map ((\f s -> if s > 9 then f (s-1) else s ) (\f->f*2)) [1..a]

basefunctor =  makeBaseFunctor 10
-- template args 

based :: a -> DecsQ
based  a | a<10 =  based (a+1) | otherwise = a



b::(Mnd m a, Monad md)=>m->md a -- can not deduce class
b x = mf x 

x = map intToNum' [1..5]
--x' = intToNum 5 (return 1)


