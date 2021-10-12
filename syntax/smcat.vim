" Vim syntax file for smcat rules.
"
" Language:     smcat
" Maintainer:   Jesus Baizabal <baizabal.jesus@gmail.com>
" Home Page:    https://github.com/amabagasdowa/vim-syntax-smcat
" Last Change:  2021-10-09 15:00:00 +0200
"
" The MIT License (MIT)
"
" Copyright (c) 2017 Jesus Baiabal <baizabal.jesus@gmail.com> and contributors.
"
" Permission is hereby granted, free of charge, to any person obtaining a copy
" of this software and associated documentation files (the "Software"), to deal
" in the Software without restriction, including without limitation the rights
" to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
" copies of the Software, and to permit persons to whom the Software is
" furnished to do so, subject to the following conditions:
"
" The above copyright notice and this permission notice shall be included in
" all copies or substantial portions of the Software.
"
" THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
" IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
" FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
" AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
" LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
" OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
" SOFTWARE.

" Quit if the syntax file has already been loaded.

if exists("b:current_syntax")
	finish
endif


"syntax case match
"
" Keywords 
syntax keyword smcatKeyword initial final regular history deephistory choice fork join forkjoin junction parallel terminate 
syntax keyword smcatTodo contained NOTE TODO ALERT WARNING FIXME BUG XXX WORKING

"" Keywords that are identical to a Vim option have to be defined via match, see
"" https://vimhelp.org/syntax.txt.html#E789.
"syntax match smcatKeyword /\<contains\>/
"syntax keyword smcatRuleSection condition meta strings
"
"" Identifiers
syntax match smcatIdentifier /#.*/
"
"" Strings
syntax region smcatStringText start=/"/ end=/"/ skip=/\(\\\\\|\\"\)/ contains=smcatStringTextFormat
syntax match smcatStringTextFormat /\(\\"\|\\\\\|\\t\|\\n\|\\x[0-9a-fA-F]\{2\}\)/ contained
syntax match smcatStringHex /{\([-0-9a-fA-F \t()\[\]|?]\|\n\)\+[-0-9a-fA-F()\[\]|?]\([-0-9a-fA-F \t()\[\]|?]\|\n\)\+}/ contains=smcatStringHexFormat
syntax match smcatStringHexFormat /[-()\[\]|?]/ contained
syntax region smcatStringRegex start=/\// end=/\// skip=/\(\\\\\|\\\/\)/
syntax match smcatStringRegexModifiers /\/\@<=[is]\+\>/
"
"" Numbers
syntax match smcatNumberInt /\<\([0-9]\+\|0x[0-9a-fA-F]\+\)\>/
syntax match smcatNumberFloat /\<[0-9]\+\.[0-9]\+\>/
syntax match smcatNumberSize /\<\([0-9]\+\|0x[0-9a-fA-F]\+\)\(MB\|KB\)\>/
"
"" Comments

syntax match smcatCommentInline /\/\/.*/
syntax region smcatCommentBlock start=/\/\*/ end=/\*\// contains=smcatTodo
"
"highlight default link smcatRuleSection PreProc
highlight default link smcatKeyword Keyword
highlight default link smcatTodo Todo
"
highlight default link smcatIdentifier Identifier

highlight default link smcatStringText String
highlight default link smcatStringTextFormat Special
highlight default link smcatStringHex String
highlight default link smcatStringHexFormat Special
highlight default link smcatStringRegex String
highlight default link smcatStringRegexModifiers Special
highlight default link smcatNumberInt Number
highlight default link smcatNumberFloat Number
highlight default link smcatNumberSize Number
highlight default link smcatCommentInline Comment
highlight default link smcatCommentBlock Comment
"
"
"" Make sure that the syntax file is loaded at most once.
let b:current_syntax = "smcat"
