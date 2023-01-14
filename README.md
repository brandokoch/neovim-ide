# Neovim config 
This repository presents a NeoVim config that I use day-to-day, based on a fork of [nvim-basic-ide](https://github.com/LunarVim/nvim-basic-ide)


## Table of Contents
* [About](#about)
* [Setup](#setup)
* [Usage](#usage)
  * [Vim Basics](#vim)
  * [Vim Advanced](#vim-advanced)
  * [Plugins](#plugins)
  * [Tips](#tips)
* [License](#license)
* [References](#references)

# About
I don't like using a mouse when programming, and if you are here looking for a NeoVim config I assume you don't either. Switching between a mouse and a keyboard is using time that can be spent elsewhere. This might sound like an overstatement but once I tried 'mouseless' text editor, such as Vim, I started to enjoy the uninterrupted typing experience. A downside of these text editors is that they have a steep learning curve and even when you overcome it you are left with an editor that still misses a lot of functionality of flagship IDEs like VSCode. 

In this repository I am trying to solve the aforementioned problems by providing a NeoVim configuration that is **lightweight**, **easy to install**, **easy to understand and customize** and has a detailed **documentation for 99% of commands I use day-to-day**. This repository is based on a fork of https://github.com/LunarVim/nvim-basic-ide by chris@machine who has done most of the lua code skeleton. What I offer here is my customization with detailed documentation that I hope will prove useful for Vim/Neovim beginners and even some more advanced users.

✔️ Detailed documentation  ✔️ VSCode look  ✔️ File Explorer (NvimTree)  ✔️ Integrated terminal  (ToggleTerm)  
✔️ Debugging (DAP)  ✔️ Latex  ✔️ Grep and fuzzy search (FZF, RipGrep)  ✔️ Auto-Completion    
✔️ LSP ✔️ Linting  ✔️ Git UI  ✔️ View markdown

Disclamers:
1. <i>I'am by no means an expert in NeoVim or lua for that matter, this repo is a culmination of my hours of research and experience on the subject of using Vim.</i>
2. <i>As a Machine Learning Engineer and Researcher I might be biased in my workflow and therefore configuration so make sure to perform customizations specific to you and the programming languages you use.</i>
3. <i>Even though I am comfortable working with this configuration, there are still modifications/updates/fixes I will want to add in the near future. Look at this repository as a work in progress.</i> 
  


### Workflow for working on multiple projects repositories
- open one file from one repository 
- open another window
- `:e <path_to_file_in_another_repo>`
- for jumping to other files inside each repo go on the file belonging to that repo and either open explorer or use fzf

  
# Setup

### Choice of OS
This configuration works best if you are on a linux based operating system such as Ubuntu. I have also tested this configuration on WSL2 Ubuntu 18.04 using the windows terminal but noticed the following problems which I am yet to solve: copying/pasting from clipboard, inserting images, icon rendering. 

### Ubuntu installation 
I didn't choose to package this code in any special way in order to provide easy customization. 

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

git clone https://github.com/ronniedroid/getnf.git
cd getnf
./install.sh

# Latex
sudo apt-get install texlive-latex-base texlive-fonts-recommended texlive-fonts-extra texlive-latex-extra
sudo apt-get install texlive-publishers
sudo apt-get install -y latexmk
```

### Dockerfile 
I tend to use containers a lot in my workflow, especially when developing ML models as those tend to require a complicated environment. I actually often develop/debug inside a running container. In order to be able to do this using this NeoVim configuration I add the dependencies inside the Dockerfile and build the image that way. Here I provide a generic Dockerfile which would install this NeoVim configuration. 

```
$ docker build -t image_name. 

$ docker run -t -d --name container_name image_name 

$ docker exec -ti container_name /bin/bash
```

# Usage


## Vim Basics

| Command | Description |
| --- | --- |
|i| insert before the cursor |
|a| append after the cursor  |
|I| insert at the beginning of the line  |
|A| append at the end of the line  |
|o| open a new line below the current one  |
|O| open a new line above the current one  |
|r| replace the one character under your cursor|
|R| replace the character under your cursor, but just keep typing afterwards  |
|select and Cntrl R| you will be prompted to enter text to replace with. Press enter and then confirm each change you agree with y or decline with n|
|cm| change whatever you define as a movement (m)  |
|C| change the current line from where you're at  |
|ct<letter>| change up to <letter |
|s| substitute from where you are to the next command (noun)  |
|S| substitute the entire current line|
|`y`| Yank what is selected with visual mode|
|`p`| Paste yanked text after the current cursor position|
|`P`| Paste yanked text before the current cursor position|
|`yy` | Yank line|
|`u`| Undo last action|
|`<CTRL>r`| Redo last action |
|`<CTRL>+` | Zoom in|
|`<CTRL>-` | Zoom out|
|`<SHIFT>s`| Construct Find and replace expression|
|`:set spell spelllang=en_us`| Spell check strings |
|`:set nospell`| Disable spell check|
|`/<search_text>`| Search for search_term in file|


### File Operations  
| Command | Description |
| --- | --- |
|`,w` | Write (save) file  |
|`,q` | Quit file (must be saved beforehand |
|`:sort` | sort file  |
|`:e <file_path>`| Edit (open) file |
|`e src/**/<file_name>`| Fuzzy find and open file |

### Navigation (Files, Windows, Text, Tabs)

#### Text Movements
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


#### Window Operations  
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
|`:<SHIFT>l`| Move to next (right) buffer (in my setup it looks like a tab) | 
|`:<SHIFT>h`| Move to previous (left) buffer (in my setup it looks like a tab) | 

#### Tab Operations
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

# Advanced Vim

## Search and replace 
  
### Search and replace word on cursor
- `*`
- `:%s//replace_with_this/g`

### Search and replace inside file
| Command | Description |
| --- | --- |
|`:%s/<text_to_replace>/<text_to_replace_with>/gc`| Globally (File scope) replace|
|`:%s/<text_to_replace>/<text_to_replace_with>/gc`| Globally (File scope) replace and ask confirmation for each change|

- search word under cursor: `*`

### Start search pattern and begin to replace
- Shift+s
- start typing the word you want to replace
- add separator `/`
- start typing the word you want to replace with (if any)
- confirm

### Search and replace/delete in project:
```
1. `,f` to open fzf grep search
2. Type patterns 
3. `<CTRL>+<SHIFT>` to add individual files or `<ALT>a` to select all matches entries
4. `<ENTER>` to add to quickfix list
5. `:cfdo %s/foo/bar/g | :w` to replace or `:cfdo g/to_replace/d | :w` to delete 
```

### Commenting
- select text lines in visual mode
- `<leader>/`

### Copy, paste, delete

Copying text with yank will be overwritten with the delete commands (since they also copy).
You might also want to store multiple copies of text. To tackle this you can use registers for copying:
- select text
- select register, and yank with y: `"<register_letter>y`
  - e.g. `"ay`
- to paste select the register and pastee with p: `"<register_letter>p`
  - e.g. `"ap`

Operations on text around the cursor location:
- yank whole word: `yaw`
- delete whole word: `daw`
- change whole word: `caw`
- yank whole paragraph (cursor on it): `yap`
- delete whole paragraph: `dap`


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


# Plugins

## Terminal (ToggleTerm)
[ToggleTerm]() allows you to open a state persisting terminal window inside Vim for quick command line operations. 

Toggle it with `<CTRL>\`

## File and Text search (Fzf) 
My favorite vim plugin, Fzf, allows you to live search files and text recursively inside the working directory with blazing speed. Preview of each match is also shown which makes searching for the right match easy. I recommend using this plugin to jump to files rather than using a file explorer or typing a file path manually.

Depending on the use-case, use one of the below commands to open Fzf:
- Search files by matching their file name/path
  - `,p`
- Search text while matching only the text
  - `,f`
- Search text while matching both the text and path
  - `,v`

Navigation:
- Once inside Fzf you can navigate over matches with `<CTRL>j` or `<CTRL>K`. 
- To move page up and down in the preview window use `<SHIFT><UP>` and `<SHIFT><DOWN>` respectively.
- To open a file corresponding to a match press `<ENTER>`

Fzf can be also used to populate a quickfix list (list of matches) which you can target for project-wide search and replace operations. This is demonstrated in section (TODO)

## File explorer (NvimTree)
[NvimTree](https://github.com/nvim-tree/nvim-tree.lua) is used as a file explorer. Use it for viewing the directory/project structure and for creating/removing/renaming files. I don't recommend using it for opening files as that can be done much faster with Fzf (TODO link to fzf) 
 
| Command | Description |
| --- | --- |
|`,e` | Open/Clone the file tree| 
|`j` | Move down| 
|`k` | Move up| 
|`h` | Collapse directory| 
|`l` | Expand directory|
|`a` | Create file/directory (for a directory, end name with '/'|
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
 
## LSP
| Command | Description |
| --- | --- |
|`gD`| Go to declaration|
|`gd`| Go to definition |
|`K`| Buffer hover |
|`gI` | Buffer implementation|
|`gr` | References |
|`gl`| On diagnostic (warning/error) line shows description|
|`<leader>lf`| Format |
|`<leader>li`| View LSP Info |
|`<leader>lI`| VIew LSP install info|
|`<leader>la`| Code action|
|`<leader>lj`|  Go to next diagnostic|
|`<leader>lk`| Go to previous diagnostic|
|`<leader>lr`| Rename |
|`<leader>ls`| Signature help|
|`<leader>lq`| Diagnostic set location list |
  
  
# Other unsorted
 
 ### Copying and pasting
Copy paste yank outside of vim
```
 "*y
 "*p
```



### Other
| Command | Description |
| --- | --- |

# TODO
how to find help

" For replacing occurences visually selected text
" Select text and press Cntrl r
vnoremap <C-r> "hy:%s/<C-r>h//gc<left><left><left>
  
- how to work on multiple projects

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
1. This repository is based on a fork of: https://github.com/LunarVim/nvim-basic-ide by chris@machine
2. chris@machine's youtube channel for various vim topics: https://www.youtube.com/@chrisatmachine
3. Neovim from scratch with Lua tutorial series: https://youtu.be/ctH-a-1eUME
4. Very useful youtube channel for vim: https://www.youtube.com/@ThePrimeagen
5. VimFugative tutorial: https://youtu.be/uUrKrYCAl1Y
 

# License
This repository is under an MIT License

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)]()
