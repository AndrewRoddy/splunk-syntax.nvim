if exists("b:current_syntax")
  finish
endif

syn case ignore

" Regions — defined last = highest priority

syn region splunkSubsearch    matchgroup=splunkBracket start="\[" end="\]" contains=ALL

syn region splunkMacro        start="`"        end="`"
syn region splunkComment      start="```"      end="```"      contains=@Spell
syn region splunkCommentMacro start="`comment(" end=")`"     contains=@Spell

syn region splunkString       start=/"/ skip=/\\"/ end=/"/ contains=splunkStringEscape
syn region splunkString       start=/'/ skip=/\\'/ end=/'/

syn region splunkXMLComment   start=/<!--/ end=/-->/ contains=@Spell

" Matches

syn match splunkPipe         /|/
syn match splunkStringEscape /\\[\\n"']/ contained
syn match splunkNumber       /\<\d\+\(\.\d\+\)\?\>/
syn match splunkOperator     /[=!<>]=\?/
syn match splunkOperator     /[+\-*\/%]/

syn match splunkTimeExpr /[+-]\?\d\+\(s\|sec\|secs\|second\|seconds\|m\|min\|mins\|minute\|minutes\|h\|hr\|hrs\|hour\|hours\|d\|day\|days\|w\|week\|weeks\|mon\|month\|months\|q\|qtr\|quarter\|quarters\|y\|yr\|year\|years\)\(@\(s\|sec\|secs\|second\|seconds\|m\|min\|minute\|minutes\|h\|hr\|hrs\|hour\|hours\|d\|day\|days\|w\|week\|weeks\|mon\|month\|months\|q\|qtr\|quarter\|quarters\|y\|yr\|year\|years\)\)\?\>/
syn keyword splunkTimeExpr now

" Commands

syn keyword splunkCommand
  \ abstract accum accumulate
  \ addcoltotals addinfo addtotals
  \ analyzefields
  \ anomalies anomalydetection anomalousvalue
  \ append appendcols appendpipe
  \ apply arules associate audit autoregress
  \ bin bucket bucketdir
  \ chart cluster
  \ collect concurrency contingency convert
  \ correlate crawl
  \ datamodel dbinspect dbxquery
  \ dedup delete delta diff
  \ erex eval eventcount eventstats extract
  \ fieldformat fields fieldsummary fieldalias
  \ filldown fillnull findtypes folderize
  \ fit foreach format
  \ gauge gentimes geom geomfilter geostats
  \ head highlight history
  \ iconify input inputcsv inputlookup
  \ iplocation join
  \ kmeans kvform kv
  \ loadjob localize localop logreduce lookup
  \ makecontinuous makeresults makemv map
  \ mcatalog mcollect
  \ metadata metasearch
  \ mstats multikv multisearch
  \ mvcombine mvexpand
  \ noop nomv normalize
  \ outlier outputcsv outputlookup outputtext overlap
  \ pivot predict
  \ rangemap rare regex reltime relevancy rename replace rest
  \ return reverse rex rtorder run
  \ savedsearch score script scrub search searchtxn selfjoin
  \ sendalert sendemail sendresults sendsplunk
  \ set setfields sichart sirare sistats sitimechart sitop
  \ sort spath stats strcat streamstats
  \ table tags tail timechart timewrap transaction transpose
  \ trendline tstats typeahead typelearner typer
  \ uniq union untable
  \ walklex where
  \ x11 xmlkv xmlunescape xpath xyseries
  \ from

" Keywords / clauses

syn keyword splunkKeyword
  \ by as over output outputnew
  \ groupby limit
  \ delim nullstr keepempty
  \ maxspan maxpause mvlist mvmax mvmin
  \ startswith connected uselookups
  \ in like notin
  \ span agg allnum
  \ bins bottom top
  \ cont fixedrange minspan
  \ otherstr usenull useother
  \ partial sep single
  \ truelabel falselabel
  \ field end start
  \ fillna

" Functions (eval + stats + JSON + geo — all in one block, no duplicates)

syn keyword splunkFunction
  \ abs ceiling ceil floor round exp ln log pow sqrt sigfig exact
  \ len lower upper ltrim rtrim trim substr replace split
  \ tostring tonumber
  \ isbool isint isnum isstr isnull isnotnull isnan
  \ coalesce nullif
  \ mvappend mvcount mvdedup mvfilter mvfind mvindex mvjoin
  \ mvrange mvsort mvzip mvmap
  \ time strftime strptime relative_time
  \ cosh sinh tanh acos asin atan atan2 cos hypot sin tan pi
  \ max min random
  \ urldecode
  \ md5 sha1 sha256 sha512
  \ typeof validate searchmatch match cidrmatch
  \ printf if case spath commands
  \ avg mean
  \ c count dc distinct_count distinctcount
  \ earliest earliest_time latest latest_time
  \ estdc estdc_error estdcerr exactperc
  \ first last list values
  \ median mode
  \ p perc percentile upperperc
  \ per_day per_hour per_minute per_second
  \ range sparkline
  \ stdev stdevp sum sumsq var varp
  \ json_array json_array_to_mv
  \ json_extract json_extract_exact
  \ json_keys json_object
  \ json_set json_set_exact json_valid
  \ json_append json_delete
  \ json_dict_to_mv json_mv_to_dict
  \ bool num str
  \ haversine

syn keyword splunkBoolean  true false
syn keyword splunkNull     null
syn keyword splunkBoolOp   AND OR NOT

syn keyword splunkField
  \ _time _raw _bkt _cd _indextime _kv _serial _si
  \ _sourcetype _subsecond
  \ host index linecount punct source sourcetype
  \ splunk_server splunk_server_group
  \ timeendpos timestartpos
  \ _fullpath _multivalue _tc
  \ date_hour date_mday date_minute date_month date_second
  \ date_wday date_year date_zone

" Multi-char time units only — single chars (s m h d w q y) omitted to avoid
" false positives on short variable names
syn keyword splunkTimeUnit
  \ sec secs second seconds
  \ min mins minute minutes
  \ hr hrs hour hours
  \ day days week weeks
  \ mon month months
  \ qtr quarter quarters
  \ yr year years

" Highlight links

hi def link splunkComment       Comment
hi def link splunkCommentMacro  Comment
hi def link splunkXMLComment    Comment
hi def link splunkPipe          Operator
hi def link splunkBracket       Delimiter
hi def link splunkSubsearch     Normal
hi def link splunkMacro         Special
hi def link splunkString        String
hi def link splunkStringEscape  SpecialChar
hi def link splunkNumber        Number
hi def link splunkBoolean       Boolean
hi def link splunkNull          Constant
hi def link splunkBoolOp        Keyword
hi def link splunkOperator      Operator
hi def link splunkCommand       Statement
hi def link splunkKeyword       Keyword
hi def link splunkFunction      Function
hi def link splunkField         Identifier
hi def link splunkTimeExpr      PreProc
hi def link splunkTimeUnit      PreProc

syn sync fromstart

let b:current_syntax = "splunk"
