# splunk-syntax.nvim

Syntax highlighting for Splunk SPL and Splunk dashboard XML in Neovim.

## Filetypes

| Filetype    | Triggered by                                              |
|-------------|-----------------------------------------------------------|
| `splunk`    | `*.spl`, `*.splunk` files without a `<dashboard>`/`<form>` root |
| `splunkxml` | `*.xml` and `*.splunk` files with a `<dashboard>` or `<form>` root |

## Highlighted

**SPL (`splunk`)**
- Commands (`stats`, `eval`, `where`, `tstats`, ...)
- Functions (`if`, `coalesce`, `mvappend`, `json_extract`, ...)
- Keywords, operators, booleans, fields, time expressions
- Strings, numbers, macros, subsearches
- Comments: triple-backtick blocks, `` `comment(...)` ``, and `<!-- -->`

**Dashboard XML (`splunkxml`)**
- Full XML highlighting via Neovim's built-in xml syntax
- SPL highlighting inside `<query>`, `<earliest>`, and `<latest>` tags
- `<!-- -->` comments

## Install

**lazy.nvim**
```lua
{ "AndrewRoddy/splunk-syntax.nvim", ft = { "splunk", "splunkxml" } }
```

**vim-plug**
```vim
Plug 'AndrewRoddy/splunk-syntax.nvim'
```
