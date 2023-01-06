# Neovim config 
This repository presents a lightweight neovim config based on a fork of https://github.com/LunarVim/nvim-basic-ide. 

## Table of Contents
* [About](#about)
* [Setup](#setup)
* [Usage](#usage)
* [License](#license)
* [References](#references)

# About
Detailed documentation

✔️ VSCode look  
✔️ File Explorer (NvimTree)  
✔️ Integrated terminal  (ToggleTerm)  
✔️ Debugging (DAP)  
✔️ Latex editing ()  
✔️ Grep and fuzzy search (FZF, RipGrep)  
✔️ Auto-Completion   
✔️ Linting  
✔️ Git support  
✔️ View markdown

# Setup
Tested on the following OS-es and environments:
- Linux Ubuntu 18.04 and 20.04
- Windows WSL2 Ubuntu 18.04

```bash
apt update
apt-get update

apt-get install ninja-build gettext libtool libtool-bin autoconf automake cmake g++ pkg-config unzip curl doxygen

git clone https://github.com/neovim/neovim.git
cd neovim
git checkout release-0.8
make CMAKE_BUILD_TYPE=Release
sudo make install

git clone https://github.com/bkoch4142/neovim-custom ~/.config/nvim

apt install xsel # for X11
apt install wl-clipboard # for wayland
pip install pynvim
apt install ripgrep

git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

git clone https://github.com/ronniedroid/getnf.git
cd getnf
./install.sh
```

# Usage

## Unsorted 



### Search and replace inside file
|`:%s/what/with_what/gc`| Globally (File scope) replace|
|`:%s/what/with_what/gc`| Globally (File scope) replace and ask confirmation for each change|

### Search and replace/delete in project:
```
1. `,f` to open fzf grep search
2. Type patterns 
3. `<CTRL>+<SHIFT>` to add individual files or `<CTRL>a` to select all matches entries
4. `<ENTER>` to add to quickfix list
5. `:cfdo %s/foo/bar/g | :w` to replace or `:cfdo g/to_replace/d | :w` to delete 
```

### Commenting
- select text in visual mode
- `<leader>/`

### Copy and paste
In order for copied text to not be overwritten by delete commands copy to a register instead:
- select text
- select register "a" and yank with y: `"ay"`
- to paste select register "a" and paster with p: `"ap`

### Macros
Macros feature is one of the most powerful features of Vim. It allows you to record a set of commands you do on text and apply it anywhere you want. 

To record a command:
1. Go on one of the lines you want to perform the command on
2. Start recording the command and store it in a register denoted by a letter (e.g. 'a')
  - `q<register>`, e.g. `qa` stores the command in 'a' register
3. When your command sequence is done press `q`
4. Your command is now saved

To apply the recorded commands
- Go to a position in text
- Do `@<register>`, e.g. `@a`

To apply the recorded commands to each selected line
- Select lines with visual mode
- Do `:normal @<register>`

- https://stackoverflow.com/questions/390174/in-vim-how-do-i-apply-a-macro-to-a-set-of-lines
- https://vim.fandom.com/wiki/Delete_all_lines_containing_a_pattern
If you want to delete that line instead do `:cfdo g/to_replace/d | :w`

## Vim Basics

| Command | Description |
| --- | --- |
|i| insert before the cursor  |
|a| append after the cursor  ||
|I| insert at the beginning of the line  |
|A| append at the end of the line  |
|o| open a new line below the current one  |
|O| open a new line above the current one  |
|r| replace the one character under your cursor|
|R| replace the character under your cursor, but just keep typing afterwards  |
|select and Cntrl R| you will be prompted to enter text to replace with. Press enter and then confirm each change you agree with y or decline with n|
|cm| change whatever you define as a movement (m)  |
|C| change the current line from where you're at  |
|ct?| change change up to the question mark  |
|s| substitute from where you are to the next command (noun)  |
|S| substitute the entire current line|
|`y`| Yank what is selected with visual mode|
|`p`| Paste yanked text after the current cursor position|
|`P`| Paste yanked text before the current cursor position|
|`yy` | Yank line|
|`gd` | Go to definition|
|`u`| Undo last action|
|`<CTRL>r`| Redo last action |
|`<CTRL>+` | Zoom in|
|`<CTRL>-` | Zoom out|
|`<SHIFT>s`| Construct Find and replace expression|
|`:set spell spelllang=en_us`| Spell check strings |
|`:set nospell`| Disable spell check|
|`/search_term`| Search for search_term in file|


### File Operations  
| Command | Description |
| --- | --- |
|`ZQ` | Force Quit  |
|`ZZ` | Save and Quit  |
|`,w` | Write (save) file  |
|`:sort` | sort file  |
|`:e file`| Edit (open) file |
|`e src/**/file.txt`| Fuzzy find and open file |





## Navigation (Files, Windows, Text, Tabs)

### Text Movements
| Command | Description |
| --- | --- |
|`G`| Go to bottom of file|
|`gg`| Go to top of file|
|`0`| Move to beggining of line|
|`$`| Move to the end of the line|
|`w`| Move forward one word|
|`b`| Move backward one word|
|`e`| Move to the end of the current word|
|`<CTRL>i`| Jump to previous navigation location |
|`<CTRL>o`| Jump back to where you were |
|`jj`| Exit normal mode |
|`f<`| Jump and land on the < charachter |
|`t<`| Jump and land before the < charachter |
|`%`| Move to matching bracket when on one|
|`zz `| Recenter view so the current line is in middle|
|`gd` | Go to definition| 
|`<SHIFT>i` | Go into insert mode at the beggining of the line|
|`<SHIFT>a` | Go into insert mode at the end of the line (append)|
|`<CTRL>u` | Move whole screen up|
|`<CTRL>d` | Move whole screen down|


### Window Operations  
| Command | Description |
| --- | --- |
|`:sp`| Split Horizontally |
|`:50sp`| Split Horizontally with size 50 |
|`:vs`| Split Verically |
|`:50vs`| Split Verically with size 50 |
|`<CTRL>wn`| Open new window |
|`<CTRL>j` | Move to below window  |
|`<CTRL>k` | Move to above window  | 
|`<CTRL>h` | Move to left window  |
|`<CTRL>l` | Move to right window  |
|`:resize 10`| Resize window to 10 rows |
|`:vertical resize 10`| Resize window to 10 columns | 


### Tab Operations
| Command | Description |
| --- | --- |
|`:tabedit path` | Open file in a new tab  |
|`:tabc` | Close current tab  |
|`:tabonly` | Keep only current tab|  
|`:qa` | Close all tabs  |
|`:tabclose i` | Close i-th tab  |
|`<CTRL><PageUp>` | Cycle tabs  |
|`<CTRL><PageDown>` | Cycle tabs  |
|`:tabn` | Go to next tab  |
|`:tabp` | Go to previous tab  |
|`:tabfirst` | Go to first tab  |
|`:tablast` | Go to last tab  |
|`gt` | Go to next tab |
|`gT` | Go to previous tab  |

## Terminal (ToggleTerm)
[ToggleTerm]() allows you to open a state persisting terminal window inside Vim for quick command line operations. 

Toggle it with `<CTRL>/`

## File and Text search (Fzf, Ripgrep) 

## File explorer (NvimTree)
[NvimTree](https://github.com/nvim-tree/nvim-tree.lua) is used as a file explorer. Use it for viewing the directory/project structure and for creating/removing/renaming files. I don't recommend using it for opening files as that can be done much faster with Fzf (TODO link to fzf) 
 
| Command | Description |
| --- | --- |
|`,e` | Open/Clone the file tree| 
|`j` | Move down| 
|`k` | Move up| 
|`h` | Collapse directory| 
|`l` | Expand directory|
|`a` | Create file/directory (for a directory end name with '/'|
|`r` | Rename file/directory | 
|`d` | Delete file/direcotry | 




## Debugging (DAP)
Debugging is done with [dap](https://github.com/mfussenegger/nvim-dap). DAP is a Debug Adapter Protocol client implementation for Neovim. 

To debug applications, you need to configure two things per language:
- A debug adapter
- A debug configuration (How to launch your application to debug or how to attach to a running
  application)

### Configuring the adapter and the configuration (Python)
 
 
 
### How to debug
| Command | Description |
| --- | --- |
|`,dc` | Start Debugger / Continue  |
|`,dt` | Terminate Debugger  |
|`,dj` | Step over  |
|`,dl` | Step into  |
|`,dk` | Step out  |
|`,db` | Toggle Breakpoint  |
 

## Git (VimFugative)
Performing git operations from inside vim is done with [VimFugative](https://github.com/tpope/vim-fugitive) which you invoke with `:G`. Once opened you can navigate with the usual `j` and `k` and perform actions on files. Regular git commands can be called with VimFugative by capitalizing the git command: `:Git <your-command>`
| Command | Description |
| --- | --- |
|`:G`| Open vim fugative|
|`g?`| Help |
|`s`| Stage file |
|`u` | Unstage file|
|`=` | Toggle inline diff for file|
|`dv`| Toggle vertical diff, to quit dq|
|`X`| Delete change on unstaged file|
|`cc`| Commit staged files|
|`ca`| Amend staged files|
|`:Gvdiffsplit`| Toggle vertical diff from previous commit for a file|
|`:Gvdiffsplit <branch_name>` | Toggle vertical diff from <branch_name> branch for a file|
| `:Gvdiffsplit!` | when in file to merge|
|`]c`| When merging to jump to next conflict |
|`d2o`| Accept change from left window when merging |
|`:d3o` | Accept change from right window when merging|
 
# Other unsorted
 
 ### Copying and pasting
Copy paste yank outside of vim
```
 "*y
 "*p
```

### Get info on line warning or error
`gl`

### Other
| Command | Description |
| --- | --- |

buffers:
- shift q to exit
 
 :Gitsigns
- blame_line  (see who edited line last)
- preview_hunk (see changes on a line)
 
|`,di` | Inspect Variable  |
|`,<ENTER>`| Change value in variables|
|`<DEL>`|Delete watch|

To add variable to watch: go to watch window, go into insert mode and type the name of the variable and hit enter

# References
This repository is based on a fork of: https://github.com/LunarVim/nvim-basic-ide by chris@machine

Other references:
- Neovim from scratch with Lua tutorial series: https://youtu.be/ctH-a-1eUME

# License
This repository is under an MIT License

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)]()
