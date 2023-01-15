# Neovim config 
This repository presents a NeoVim config that I use day-to-day, based on a fork of [nvim-basic-ide](https://github.com/LunarVim/nvim-basic-ide)

https://user-images.githubusercontent.com/57716666/212529326-2f6c9e65-a001-4e21-b12f-fa565b7d7c5f.mp4

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
I don't like using a mouse when programming, and if you are here looking for a NeoVim config I assume you don't either. Switching between a mouse and a keyboard is using time that can be spent elsewhere. This might sound like an overstatement but once I tried a 'mouseless' text editor, such as Vim, I started to enjoy the uninterrupted typing experience. A downside of these text editors is that they have a steep learning curve and even when you overcome it you are left with an editor that still misses a lot of functionality of flagship IDEs like VSCode. 

In this repository I am trying to solve the aforementioned problems by providing a NeoVim configuration that is **lightweight**, **easy to install**, **easy to understand and customize** and has a detailed **documentation for 99% of commands I use day-to-day**. This repository is based on a fork of https://github.com/LunarVim/nvim-basic-ide by chris@machine who has done most of the lua code skeleton. What I offer here is my customization with detailed documentation that I hope will prove useful for Vim/Neovim beginners and even some more advanced users.

✔️ Detailed documentation  ✔️ VSCode look  ✔️ File Explorer (NvimTree)  ✔️ Integrated terminal  (ToggleTerm)  
✔️ Debugging (DAP)  ✔️ Latex  ✔️ Grep and fuzzy search (FZF, RipGrep)  ✔️ Auto-Completion    
✔️ LSP ✔️ Linting  ✔️ Git UI  ✔️ View markdown

Disclamers:
1. <i>I'am by no means an expert in NeoVim or lua for that matter, this repo is a culmination of my hours of research and experience on the subject of using Vim.</i>
2. <i>As a Machine Learning Engineer and Researcher I might be biased in my workflow and therefore configuration so make sure to perform customizations specific to you and the programming languages you use.</i>
3. <i>Even though I am comfortable working with this configuration, there are still modifications/updates/fixes I will want to add in the near future. Look at this repository as a work in progress.</i> 
  
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

apt install xsel wl-clipboard ripgrep
pip install pynvim

git clone https://github.com/ronniedroid/getnf.git
cd getnf
./install.sh

# Latex
sudo apt-get install latexmk texlive-latex-base texlive-fonts-recommended texlive-fonts-extra texlive-latex-extra texlive-publishers latexmk
```

### Dockerfile 
I tend to use containers a lot in my workflow, especially when developing ML models as those tend to require a complicated environment. I actually often develop/debug inside a running container. In order to be able to do this using this NeoVim configuration I add the dependencies inside the Dockerfile and build the image that way. In this repo I provide a generic Dockerfile which would install this NeoVim configuration. 

```
$ cd repo_location
$ docker build -t image_name .
$ docker run -t -d --name container_name image_name 
$ docker exec -ti container_name /bin/bash
```

# Usage

leader, modes explain, explain tabs buffers I changed the wording for some stuff (modes )
 if you begginer look at some video first the best

 explain y,c,d

insert mode is only for writing text
normal mode is for moving and jumping 

## Vim Basics

### Modes
| Prerequisite | Command | Description |
|--- | --- | --- |
|Normal mode |`i`| Most basic way to enter insert mode at cursor position |
|Insert mode |`jj`| Escape from insert mode to normal mode|
|Normal mode |`<SHIFT>v`| Enter visual mode  |
|Normal mode |`<SHIFT>v`| Enter visual line mode  |
|Normal mode |`<CTRL>v`| Enter visual block mode  |
|Visual mode |`<ESC>`| Escape from any visual or command to normal mode |
|Normal mode |`:` | Enter command mode |
|Terminal mode |`<CTRL>\` | Toggle terminal (Toggleterm plugin) mode |

### Entering insert mode
Different ways to enter insert mode (EIM). Change is another way of saying delete and EIM.

| Prerequisite | Command | Description |
|--- | --- | --- |
|Normal mode |`i`| Most basic way to enter insert mode at cursor position |
|Normal mode |`<shift>i`| EIM at the beginning of the line  |
|Normal mode |`a`| EIM after the cursor  |
|Normal mode |`<SHIFT>a`| EIM at the end of the line  |
|Normal mode |`o`| EIM on a new line below the current one  |
|Normal mode |`O`| EIM on a new line above the current one  |
|Normal mode |`c<m>`| change whay you define as a movement <m>, e.g. 'w' for word|
|Normal mode |`cc`| change line |
|Normal mode |`C`| change line from cursor |
|Normal mode |`ct<char>`| change up to <char> |
|Normal mode |`cf<char>`| change up to (including) <char> |
|Normal mode |`caw`| change cursor word |
|Normal mode |`cap`| change paragraph |

### Copy, Delete, Paste, Replace
Some tips for using the below commands:
- Yank is the vim naming for copy
- Delete also performs a copy (what is deleted is ready to be pasted with `p`)

| Command | Description |
| --- | --- |
|Visual mode |`y`| Yank what is selected with any visual mode|
|Normal mode |`yy` | Yank line|
|Normal mode |`<SHIFT>y` | Yank line from cursor|
|Normal mode |`yt<char>` | Yank up to <char>|
|Normal mode |`yf<char>` | Yank up to (including)|
|Normal mode |`yaw` | Yank a word the cursor is on|
|Normal mode |`yap` | Yank paragraph you are on|
|Visual mode |`d`| Delete what is selected with any visual mode |
|Normal mode |`dd` | Delete line (also copies)|
|Normal mode |`<SHIFT>d` | Delete line from cursor|
|Normal mode |`dt<char>` | Delete up to <char>|
|Normal mode |`df<char>` | Delete up to (including)|
|Normal mode |`daw` | Delete the word the cursor is on |
|Normal mode |`dap` | Delete paragraph you are on |
|Normal mode |`x` | Delete char in front of cursor |
|Normal mode |`p`| Paste text after the current cursor position|
|Normal mode |`P`| Paste text before the current cursor position|
|Normal mode |`r<char>`| replace the one character under your cursor with another|
|Normal mode |`<SHIFT>R`| start replacing under cursor  |

### File Operations  
| Command | Description |
| --- | --- |
|`<leader>w` | Write (save) file  |
|`<leader>q` | Quit file (must be saved beforehand) |
|`:q!` | Force quit file without saving |
|`<SHIFT>q`| Close buffer |
|`:sort` | sort file  |
|`:e <file_path>`| Edit (open) file |
|`e path/**/<file_name>`| Fuzzy find and open file |

### Navigation (Text, Windows, Files, Tabs)

#### Vertical text movement

| Command | Description |
| --- | --- |
|`G`| Go to bottom of file|
|`gg`| Go to top of file|
|`<CTRL>u` | Move whole screen up|
|`<CTRL>d` | Move whole screen down|
|`<CTRL>i`| Based on jump list jump forward |
|`<CTRL>o`| Based on jump list jump backward|


#### Horizontal text movement

| Command | Description |
| --- | --- |
|`0`| Move to beggining of line|
|`$`| Move to the end of the line|
|`w`| Move forward one word|
|`b`| Move backward one word|
|`e`| Move to the end of the current word|
|`f<char>`| Jump and land on the <char> charachter |
|`t<char>`| Jump and land before the <char> charachter |
|`%`| Move to matching bracket when on one|

#### Window Operations  
| Command | Description |
| --- | --- |
|`:sp`| Split Horizontally |
|`:40sp`| Split Horizontally with size 50 |
|`:vs`| Split Verically |
|`:40vs`| Split Verically with size 50 |
|`<CTRL>j` | Move to below window  |
|`<CTRL>k` | Move to above window  | 
|`<CTRL>h` | Move to left window  |
|`<CTRL>l` | Move to right window  |
|`:resize 10`| Resize window to 10 rows |
|`:vertical resize 10`| Resize window to 10 columns | 
|`:<SHIFT>l`| Move to next (right) buffer (in my setup it looks like a tab) | 
|`:<SHIFT>h`| Move to previous (left) buffer (in my setup it looks like a tab) | 

#### Tab Operations
I rarely use tab operations and they don't cooperate much with this setup but I included them for completeness.

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

#### Undo, Redo
| Command | Description |
| --- | --- |
|`u`| Undo last action|
|`<CTRL>r`| Redo last action |

## Vim Advanced

### Copying to a register

Copying text with yank will be overwritten with the delete commands (since they also copy).
You might also want to store multiple copies of text. To tackle this you can use registers for copying:
1. Select text
2. Choose a register, and yank with y: `"<register_letter>y`. (e.g. `"ay`)
3. To paste select the register and paste with p: `"<register_letter>p` (e.g. `"ap`)

### Search and replace 

#### Search for a term
To search for a <search_term> perform the below command: `/<search_text><ENTER>`

To search for a word under the cursor, do: `*`

While in the search mode you can:
| Command | Description |
| --- | --- |
|`n`| Move forward in search|
|`N`| Move backward in search|

#### Search and replace inside file
| Command | Description |
| --- | --- |
|`:%s/<text_to_replace>/<text_to_replace_with>/g`| Globally (File scope) replace|
|`:%s/<text_to_replace>/<text_to_replace_with>/gc`| Globally (File scope) replace and ask confirmation for each change|

You can make the pattern use the last term you searched for (e.g. word under cursor with `*`) by leaving the first part (<text_to_replace>) blank 

#### Search and replace/delete in project:
1. `,f` to open fzf grep search (see Fzf section)
2. Type patterns 
3. `<CTRL><SHIFT>` to add individual files or `<ALT>a` to select all matches entries #TODO CHECK
4. `<ENTER>` to add to quickfix list
5. `:cfdo %s/foo/bar/g | :w` to replace or `:cfdo g/to_replace/d | :w` to delete 

### Commenting/Uncommenting
1. Select text lines in visual mode
2. `<leader>/`

### Macros
Macros feature is one of the most powerful features of Vim. It allows you to record a set of commands you do on text and apply it anywhere you want. 

**To record a command:**
1. Go on one of the lines you want to perform the command on
2. Start recording the command by storing it into a letter denoted register: `q<register>`. (e.g. `qa`)
3. Perform your command  
4. When your command sequence is done press `q`
5. Your command is now saved

**To apply the recorded commands:**
1. Go to a position in text
2. Do `@<register>`, e.g. `@a`

**To apply the recorded commands to each selected line:**
1. Select lines with visual mode
2. Do `:normal @<register>`

- https://stackoverflow.com/questions/390174/in-vim-how-do-i-apply-a-macro-to-a-set-of-lines
- https://vim.fandom.com/wiki/Delete_all_lines_containing_a_pattern
If you want to delete that line instead do `:cfdo g/to_replace/d | :w`

### Other
| Command | Description |
| --- | --- |
|`<CTRL>+` | Zoom in|
|`<CTRL>-` | Zoom out|
|`:set spell spelllang=en_us`| Spell check strings |
|`:set nospell`| Disable spell check|

# Plugins

## Terminal (ToggleTerm)
[ToggleTerm]() allows you to open a state persisting terminal window inside Vim for quick command line operations. 

Toggle it with: `<CTRL>\`

## File and Text search (Fzf) 
My favorite vim plugin, Fzf, allows you to live search files and text recursively inside the working directory with blazing speed. Preview of each match is also shown which makes searching for the right match easy. I recommend using this plugin to quickly jump to files rather than using a file explorer or typing a file path manually.

Depending on the use-case, use one of the below commands to open Fzf:
- Search files by matching their file name/path: `,p`
- Search text while matching only the text: `,f`
- Search text while matching both the text and path: `,v`

Navigation:
- Once inside Fzf you can navigate over matches with `<CTRL>j` or `<CTRL>K`. 
- To move page up and down in the preview window use `<SHIFT><UP>` and `<SHIFT><DOWN>` respectively.
- To open a file corresponding to a match press `<ENTER>`
- To close Fzf use `<ESC>`

Fzf can be also used to populate a quickfix list (list of matches) which you can target for project-wide search and replace operations.

## File explorer (NvimTree)
[NvimTree](https://github.com/nvim-tree/nvim-tree.lua) is used as a file explorer. Use it for viewing the directory/project structure and for creating/removing/renaming files. I don't recommend using it for opening files as that can be done much faster with Fzf
 
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
- A debug adapter [Adapter Installation](https://github.com/mfussenegger/nvim-dap/wiki/Debug-Adapter-installation)
- A debug configuration (How to launch your application to debug or how to attach to a running application)

### Configuring the adapter and the configuration (Python)
Here I showcase how to install everything needed for debugging python.

**Install the dubug adapter:**
- You can do this with Mason by installing debugpy

**Point DAP to the debug adapter:**:
- see `~/.config/nvim/user/lua/dap.lua` for `dap.adapters.python`

```
dap.adapters.python = {
  type = 'executable';
  command = '/home/bkoch/.local/share/nvim/mason/bin/debugpy-adapter' # My path
}
```

**Create launch.json inside the working directory of the project:**
- For `pythonPath` add your python path (can be e.g. from a conda env)
- When you start debugging the `,dc` command will try to load this configuration automatically

```
{
    "version": "0.2.0",
    "configurations": [
        {
            "type": "python",
            "request": "launch",
            "name": "Launch file",
            "program": "${file}",
            "pythonPath":"/eg_path_to_python/anaconda3/envs/env_name/bin/python3"
        }
    ]
}
```
 
 
### How to debug
To debug, open the file and create a breakpoint. Then, start the debugger with `,dc`

| Command | Description |
| --- | --- |
|`,dc` | Start Debugger / Continue (Will also try to load the launch.json config from cwd) |
|`,dt` | Terminate Debugger  |
|`,db` | Toggle Breakpoint  |
|`,dj` | Step over  |
|`,dl` | Step into  |
|`,dk` | Step out  |
|`,dc` | Run to cursor|
|`,dv` | View value of cursor variable|
 

## Git (VimFugative)
Performing git operations from inside vim is done with [VimFugative](https://github.com/tpope/vim-fugitive) which you invoke with `:G`. Once opened you can navigate with the usual `j` and `k` and perform actions on files. Regular git commands can be called with VimFugative by capitalizing the git command: `:Git <your-command>`. In order to get familiar with using VimFugative I recommend taking a look at the video tutorial in the reference section.

| Command | Description |
| --- | --- |
|`:G`| Open vim fugative|
|`g?`| Help |
|`X`| Delete change on unstaged file|
|`s`| Stage file |
|`u` | Unstage file|
|`=` | Toggle inline diff for file|
|`dv`| Toggle vertical diff, to quit dq|
|`cc`| Commit staged files|
|`ca`| Amend staged files|
|`:Gvdiffsplit`| Toggle vertical diff from previous commit for a file|
|`:Gvdiffsplit <branch_name>` | Toggle vertical diff from <branch_name> branch for a file|
| `:Gvdiffsplit!` | when in file to merge|
|`]c`| When merging to jump to next conflict |
|`d2o`| Accept change from left window when merging |
|`:d3o` | Accept change from right window when merging|

You can also do interesting stuff while editing a file:
- To call git blame on a line do: `:Gitsigns blame_line`
- To preview the change made on a part of the file do: `:Gitsigns preview_hunk`
 
## Mason
 
## LSP
LSP 

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
|`<leader>lj`| Go to next diagnostic|
|`<leader>lk`| Go to previous diagnostic|
|`<leader>lr`| Rename |
|`<leader>ls`| Signature help|
|`<leader>lq`| Diagnostic set location list |


# Tips
- If you want to expand your mouseless setup take a look at [Vimium](https://chrome.google.com/webstore/detail/vimium/dbepggeogbaibhgnhhndojpepiihcmeb?hl=en). 
- Depending on your OS you might also explore using a window manager.
- In order to move faster in vim with `j k h l` increase your cursor speed inside your OS.


# To-Do
- [ ] Zathura for latex support 
- [ ] Github Copilot 
- [ ] ChatGPT Prompt Window
- [ ] Explain markdown support
  
# References
- [1]: This repository is based on a fork of: https://github.com/LunarVim/nvim-basic-ide by chris@machine
- [2]: chris@machine's youtube channel for various vim topics: https://www.youtube.com/@chrisatmachine
- [3]: Neovim from scratch with Lua tutorial series: https://youtu.be/ctH-a-1eUME
- [4]: Very useful youtube channel for vim: https://www.youtube.com/@ThePrimeagen
- [5]: VimFugative tutorial: https://youtu.be/uUrKrYCAl1Y
 

# License
This repository is under an MIT License

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)]()
