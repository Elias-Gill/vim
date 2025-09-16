" colorscheme.vim
set background=dark
highlight clear
if exists("syntax_on")
  syntax reset
endif

" Highlight groups
highlight ColorColumn    guibg=#313134
highlight Conceal        guifg=#1b1b1c
highlight Cursor         guifg=#27272a guibg=#c9c7cd
highlight lCursor        guifg=#27272a guibg=#c9c7cd
highlight CursorIM       guifg=#27272a guibg=#c9c7cd
highlight CursorLine     guibg=#2a2a2c cterm=NONE
highlight Directory      guifg=#aca1cf
highlight DiffAdd        guibg=#90b99f guifg=#27272a
highlight DiffChange     guifg=#e6b99d gui=underline
highlight DiffDelete     guibg=#f5a191 guifg=#27272a
highlight DiffText       guibg=#e6b99d guifg=#27272a
highlight EndOfBuffer    guifg=#1c1c1c
highlight ErrorMsg       guifg=#f5a191
highlight VertSplit      guifg=#444444 guibg=NONE cterm=NONE
highlight WinSeparator   guifg=#313134
highlight Folded         guifg=#f5a191 guibg=#2a2a2c gui=italic
highlight FoldColumn     guifg=#6c6874 guibg=#2a2a2c
highlight SignColumn     guibg=#1c1c1c guifg=#6c6874
highlight IncSearch      guifg=#27272a guibg=#e6b99d
highlight CurSearch      guifg=#27272a guibg=#e6b99d
highlight Search         guifg=#dedede guibg=#3a3a3a
highlight LineNr         guifg=#3b3b3e
highlight CursorLineNr   guifg=#b4b1ba cterm=NONE
highlight MatchParen     guifg=#e6b99d gui=underline
highlight ModeMsg        guifg=#313134 gui=bold
highlight MoreMsg        guifg=#ecaad6
highlight NonText        guifg=#6c6874
highlight Normal         guifg=#c9c7cd guibg=#1c1c1c
highlight NormalNC       guifg=#c9c7cd guibg=#1c1c1c
highlight NormalFloat    guifg=#c9c7cd guibg=#18181a
highlight FloatBorder    guifg=#313134 guibg=#1c1c1c
highlight Pmenu          guifg=#c9c7cd guibg=#27272a
highlight PmenuSel       guifg=#ffffff guibg=#3b3b3e
highlight PmenuSbar      guibg=#2a2a2c
highlight PmenuThumb     guibg=#313134
highlight Question       guifg=#aca1cf
highlight QuickFixLine   guifg=#ea83a5 guibg=#2a2a2c
highlight SpecialKey     guifg=#f1a262
highlight SpellBad       guifg=#f5a191 gui=underline
highlight SpellCap       guifg=#e6b99d
highlight SpellLocal     guifg=#e6b99d
highlight SpellRare      guifg=#e6b99d
highlight StatusLine     cterm=NONE guibg=NONE
highlight StatusLineNc   cterm=NONE guibg=NONE
highlight StatusLineTerm guifg=#c9c7cd guibg=#3a3a3c cterm=NONE
highlight StatusLineTermNc guifg=#c9c7cd guibg=#2a2a2c cterm=NONE
highlight TabLine        guifg=#7c68a4 guibg=NONE cterm=NONE
highlight TabLineFill    guibg=NONE cterm=NONE term=NONE
highlight TabLineSel     guifg=#c9c7cd guibg=#404040 cterm=underline
highlight Terminal       guifg=#c9c7cd guibg=#27272a
highlight Title          guifg=#90b99f
highlight Italic         guifg=#92a2d5 gui=italic
highlight Visual         guibg=#3b3b3e
highlight VisualNOS      guibg=#3b3b3e
highlight WarningMsg     guifg=#e6b99d
highlight WildMenu       guifg=#27272a guibg=#aca1cf
highlight Winbar         guifg=#c9c7cd guibg=#1b1b1c
highlight WinbarNC       guifg=#6c6874 guibg=#131314

" Syntax highlight groups
highlight Comment guifg=#8b8693
highlight Constant guifg=#ea83a5
highlight String guifg=#90b99f
highlight Character guifg=#90b99f
highlight Number guifg=#e29eca
highlight Boolean guifg=#e6b99d
highlight Float guifg=#e29eca
highlight Identifier guifg=#c9c7cd
highlight Function guifg=#c9c7cd
highlight Statement guifg=#c9c7cd
highlight Conditional guifg=#92a2d5
highlight Repeat guifg=#aca1cf
highlight Label guifg=#aca1cf
highlight Operator guifg=#e6b99d
highlight Keyword guifg=#aca1cf
highlight Exception guifg=#aca1cf
highlight PreProc guifg=#ea83a5
highlight Include guifg=#aca1cf
highlight Define guifg=#ea83a5
highlight Macro guifg=#ea83a5
highlight PreCondit guifg=#ea83a5
highlight Type guifg=#e6b99d
highlight StorageClass guifg=#e6b99d
highlight Structure guifg=#ea83a5
highlight Typedef guifg=#e6b99d
highlight Special guifg=#92a2d5
highlight SpecialChar guifg=#e6b99d
highlight Tag guifg=#e6b99d
highlight SpecialComment guifg=#6c6874
highlight Debug guifg=#e6b99d
highlight Underlined gui=underline
highlight Error guifg=#f5a191
highlight Todo guifg=#A0D6DB cterm=underline gui=underline guibg=NONE

" HTML highlight groups
highlight htmlArg guifg=#b9aeda gui=italic
highlight htmlEndTag guifg=#b4b1ba
highlight htmlTitle guifg=#c9c7cd
highlight htmlTag guifg=#b4b1ba
highlight htmlTagN guifg=#b4b1ba
highlight htmlTagName guifg=#ea83a5

" Diff highlight groups
highlight DiffAdd guifg=#9dc6ac guibg=#1c1c1c
highlight DiffChange guifg=#6c6874 guibg=#2a2a2c
highlight DiffDelete guifg=#f5a191 guibg=#2a2a2c
highlight DiffText guibg=#6c6874

highlight diffAdded guifg=#9dc6ac guibg=#1c1c1c
highlight diffChanged guifg=#6c6874 guibg=#2a2a2c
highlight diffNewFile guifg=#c9c7cd gui=bold
highlight diffOldFile guifg=#c9c7cd gui=bold
highlight diffRemoved guifg=#6c6874 guibg=#2a2a2c

" Markdown highlight groups
highlight markdownH1 guifg=#a6b6e9 gui=bold
highlight markdownH2 guifg=#99c9ce gui=bold
highlight markdownH3 guifg=#9dc6ac gui=bold
highlight markdownH4 guifg=#ffae9f gui=bold
highlight markdownH5 guifg=#ecaad6 gui=bold
highlight markdownH6 guifg=#ecaad6 gui=bold
highlight markdownHeadingDelimiter guifg=#6c6874
highlight markdownHeadingRule guifg=#6c6874
highlight markdownId guifg=#c9c7cd
highlight markdownIdDeclaration guifg=#aca1cf
highlight markdownIdDelimiter guifg=#ea83a5
highlight markdownLinkDelimiter guifg=#6c6874
highlight markdownLinkText guifg=#aca1cf gui=italic
highlight markdownListMarker guifg=#6c6874
highlight markdownOrderedListMarker guifg=#6c6874
highlight markdownRule guifg=#6c6874
highlight markdownUrl guifg=#90b99f guibg=NONE
highlight markdownBlockquote guifg=#c9c7cd
highlight markdownBold guifg=#f591b2 guibg=NONE gui=bold
highlight markdownItalic guifg=#99c9ce guibg=NONE gui=italic
highlight markdownCode guifg=#e6b99d
highlight markdownCodeBlock guifg=#e6b99d
highlight markdownCodeDelimiter guifg=#6c6874
