if !has('conceal')
    finish
endif

setlocal conceallevel=1
syntax clear smcatOperator

syntax match smcatOperator "++" conceal cchar=⧺

syntax match smcatOperator "=\@<!===\@!" conceal cchar=≖
syntax match smcatOperator "!=" conceal cchar=≠
syntax match smcatOperator "<=" conceal cchar=≤
syntax match smcatOperator ">=" conceal cchar=≥

syntax match smcatOperator "<<" conceal cchar=«
syntax match smcatOperator ">>" conceal cchar=»

syntax match smcatOperator "::" conceal cchar=∷
syntax match smcatOperator "->" conceal cchar=→
syntax match smcatOperator "=>" conceal cchar=⇒

syntax match smcatOperator "||" conceal cchar=∥

hi! link smcatOperator Operator
"hi! link Conceal Operator
