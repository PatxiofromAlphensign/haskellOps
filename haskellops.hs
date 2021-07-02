{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE ConstrainedClassMethods #-}
{-# LANGUAGE MultiParamTypeClasses #-} 

module Main where

import qualified Data.List as DList

data F a = T a
class Mnd a b where 
	mf :: (Monad m)=>a -> m b
	xx :: (Num a)=>a->b->F a

intToNum :: (Monad m, Num a)=>a->m a
intToNum a = return a 
intToNum' a = T a 

sumlist :: (Num a)=>[a]->a
sumlist [] = 0 
sumlist (x:xs) = x + sumlist xs

instance Mnd Int (F a) where
	mf x = return x >>= T
	-- x `xx` y = do
	-- 	(a:as)<-[1..5]
	-- 	return a	>>= return

b::(Mnd md a)=>a->md 
b x = mf x 

x = map intToNum' [1..5]

main = print 22
