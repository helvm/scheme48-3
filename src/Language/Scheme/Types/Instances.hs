module Language.Scheme.Types.Instances where

import Language.Scheme.Types

instance Show Number where
    show = showNumber

instance Show LispVal where
    show = showVal

showNumber :: Number -> String
showNumber (Integer contents) = show contents
showNumber (Real contents) = show contents
showNumber (Rational contents) = show contents
showNumber (Complex contents) = show contents

showVal :: LispVal -> String
showVal (String contents) = "\"" ++ contents ++ "\""
showVal (Atom name) = name
showVal (Character name) = [name]
showVal (Number contents) = show contents
showVal (Bool True) = "#t"
showVal (Bool False) = "#f"
showVal (List contents) = "(" ++ unwordsList contents ++ ")"
showVal (DottedList head' tail') = "(" ++ unwordsList head' ++ " . " ++ showVal tail' ++ ")"

unwordsList :: [LispVal] -> String
unwordsList = unwords . map showVal
