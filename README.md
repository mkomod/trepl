# trepl 

A plugin to send code from vim to a REPL in an adjacent tmux pane

## Installation

```
Plug 'mkomod/trepl'
```

## Bindings

```
<space> 	send line
<space> 	send visual selection
<leader>t 	toggle on/off
```

By default trepl is disabled. To enable at startup:

```
let g:trepl_active=1
```

## Demo

![Python Demo](demo/py.gif)


## Todo

 - [x] Add binding to enable / disable
 - [x] Send visual block
 - [x] Fix: sending multiple lines
 - [ ] Fix: single quote marks not being escaped i.e.`'abs'`sends `abc`
 
### Notes

Based of replit.vim

