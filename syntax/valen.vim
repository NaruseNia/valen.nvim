if exists("b:current_syntax")
  finish
endif

" Keywords
syn keyword valenKeyword fn let mut self return if else match class data enum
syn keyword valenKeyword trait impl pub internal private open abstract sealed
syn keyword valenKeyword override package import for in while loop break continue
syn keyword valenKeyword as safe annotation typealias type

" Reserved
syn keyword valenReserved suspend async await yield

" Boolean
syn keyword valenBoolean true false

" Built-in types
syn keyword valenType Int Long Float Double Char Bool Byte Short String Unit Nothing
syn keyword valenType Option Result Some None Ok Err

" Operators
syn match valenOperator /[+\-*/%&|^!<>=]/
syn match valenOperator /&&\|||\|==\|!=\|<=\|>=\|===\|!==\|->\|=>/
syn match valenOperator /::/
syn match valenOperator /?/

" Numbers
syn match valenNumber /\<\d\+\>/
syn match valenNumber /\<\d\+L\>/
syn match valenNumber /\<\d\+\.\d\+\>/
syn match valenNumber /\<\d\+\.\d\+f\>/
syn match valenNumber /\<0[xX][0-9a-fA-F]\+\>/

" Strings
syn region valenString start=/"/ skip=/\\"/ end=/"/
syn region valenFString start=/f"/ skip=/\\"/ end=/"/ contains=valenInterp
syn match valenInterp /{\([^}]*\)}/ contained
syn region valenChar start=/'/ skip=/\\'/ end=/'/

" Comments
syn match valenLineComment /\/\/.*/
syn region valenBlockComment start=/\/\*/ end=/\*\//
syn match valenDocComment /\/\/\/.*/

" Annotations
syn match valenAnnotation /@\w\+/

" Function definitions
syn match valenFuncDef /fn\s\+\zs\w\+\ze\s*[<(]/

" Type definitions
syn match valenTypeDef /\(class\|enum\|trait\|data\s\+class\)\s\+\zs\w\+/

hi def link valenKeyword    Keyword
hi def link valenReserved   Keyword
hi def link valenBoolean    Boolean
hi def link valenType       Type
hi def link valenOperator   Operator
hi def link valenNumber     Number
hi def link valenString     String
hi def link valenFString    String
hi def link valenInterp     Special
hi def link valenChar       Character
hi def link valenLineComment  Comment
hi def link valenBlockComment Comment
hi def link valenDocComment   SpecialComment
hi def link valenAnnotation   PreProc
hi def link valenFuncDef      Function
hi def link valenTypeDef      Type

let b:current_syntax = "valen"
