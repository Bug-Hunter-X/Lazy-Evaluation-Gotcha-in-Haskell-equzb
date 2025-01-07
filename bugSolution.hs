```haskell
import Data.List (sort)

main :: IO ()
main = do
  let xs = [1, 2, 3, 4, 5]
  let ys = sort xs -- This will sort the list
  print ys 

-- Example demonstrating a potential problem with lazy evaluation:

-- Infinite list
infiniteList = [1..] 

-- Safe way to handle a potentially infinite list (taking only the first n elements)
safeTake :: Int -> [a] -> [a]
safeTake n xs = take n xs

main2 :: IO ()
main2 = do
  let firstFive = safeTake 5 infiniteList
  print firstFive -- This will print [1,2,3,4,5] safely

--Another example demonstrating potential problems
myFunc :: Int -> Int
myFunc 0 = 0
myFunc n = n + myFunc (n-1)

main3 :: IO ()
main3 = do
  print (myFunc 5) --Correctly prints 15
  print (myFunc (-1)) -- Stack overflow
```