" Vim syntax file for Catlang
" Language: Catlang

if exists("b:current_syntax")
  finish
endif

" Case sensitivity
syntax case match

" Numbers
syn match cNumbers display transparent "\<\d\|\.\d" contains=cNumber
syn match cNumber display contained "\d\+\(u\=l\{0,2}\|ll\=u\)\>"

" Strings
syn region String start=+L\="+ skip=+\\\\\|\\"\|\\$+ excludenl end=+"+ end='$' contains=cSpecial,@Spell

" Keywords
syn keyword Conditional if then
syn keyword Repeat loop
syn keyword Boolean true false
syn keyword Keyword let proc foreign fn
syn keyword Typedef type

" Operators
syn match Operator "[+\-*/%=<>!&|^]"
syn match As "as\s*" nextgroup=TypeIdentifier,TypePtr,TypeArray,TypeBlock


" Comments
syn match Comment "//.*$"

" Types
" Base types (e.g., int, float, char)
syn match TypeIdentifier "\<\w\+\>" contained
" Pointer types (e.g., *char, *int)
syn match TypePtr "\*" contained nextgroup=TypeIdentifier
" Array types (e.g., [10]int, [5]float)
syn match TypeArray "\[[0-9]\+\]" contained contains=cNumber nextgroup=TypeIdentifier
" Struct and tuple types (e.g., {.name: *char, .age: int})
syn region TypeBlock start=/{/ end=/}/ contained contains=TypeExpr
" Type expressions (e.g., : int, : *char, : {.name: *char})
syn match TypeExpr "" contained nextgroup=TypeIdentifier,TypePtr,TypeArray,TypeBlock
syn match Colon ":\s*" nextgroup=TypeExpr

" Function calls
syn match Function "\<\w\+\>\s*\ze(.*)"

" Highlighting rules
hi def link cNumber Number
hi def link String String
hi def link Conditional Conditional
hi def link Repeat Repeat
hi def link Boolean Boolean
hi def link Keyword Keyword
hi def link Typedef Typedef
hi def link Operator Operator
hi def link As Operator
hi def link Comment Comment
hi def link Colon Typnfe
hi def link TypeIdentifier Type
hi def link TypePtr Type
hi def link TypeArray Type
hi def link TypeBlock Operator
hi def link TypeExpr Type
hi def link Function Function

let b:current_syntax = 'catlang'
