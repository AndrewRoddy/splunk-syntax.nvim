if exists("b:current_syntax")
  finish
endif

runtime! syntax/xml.vim
unlet! b:current_syntax

syn include @SplunkSPL <sfile>:p:h/splunk.vim
unlet! b:current_syntax

" splunk.vim sets syn case ignore; restore for XML tag matching
syn case match

" SPL inside query and time-range tags
syn region splunkXMLQuery     matchgroup=xmlTag start="<query>"    end="</query>"    contains=@SplunkSPL keepend
syn region splunkXMLTimeField matchgroup=xmlTag start="<earliest>" end="</earliest>" contains=@SplunkSPL keepend
syn region splunkXMLTimeField matchgroup=xmlTag start="<latest>"   end="</latest>"   contains=@SplunkSPL keepend

" Re-declared last so it takes priority over xmlTag (which also starts with "<")
syn region xmlComment start="<!--" end="-->" keepend contains=@Spell

syn sync fromstart

let b:current_syntax = "splunkxml"
