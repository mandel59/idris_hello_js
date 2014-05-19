module Main

getElementById : String -> IO Ptr
getElementById s = mkForeign (FFun "document.getElementById(%0)" [FString] FPtr) s

setInnerHTML : String -> Ptr -> IO String
setInnerHTML s e = mkForeign (FFun "%1.innerHTML = %0" [FString, FPtr] FString) s e

main : IO ()
main = do
  elm <- getElementById "hello"
  setInnerHTML "Hello, world!" elm
  return ()
