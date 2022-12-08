# Installation
```
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

# Commands

## Common Operations
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

## Search and replace inside file
|`%s/what/with_what/gc`| Globally replace and ask for confirmation|
|`/search_term`| Search for search_term in file|

## Search and replace in project:
```
1. leader f to open fzf
2. search for pattern and when all entries match continue
3. cntrl a (to select all entries)
4. enter (to add them to quicklist)
5. :cfdo %s/foo/bar/g | :w 
```

## Macros
https://stackoverflow.com/questions/390174/in-vim-how-do-i-apply-a-macro-to-a-set-of-lines

If you want to delete that line instead do `:cfdo g/to_replace/d | :w`

## File Operations  
| Command | Description |
| --- | --- |
|`ZQ` | Force Quit  |
|`ZZ` | Save and Quit  |
|`,w` | Write (save) file  |
|`:sort` | sort file  |
|`:e file`| Edit (open) file |
|`e src/**/file.txt`| Fuzzy find and open file |

## Window Operations  
| Command | Description |
| --- | --- |
|`:sp`| Split Horizontally |
|`:50sp`| Split Horizontally with size 50 |
|`:vs`| Split Verically |
|`:50vs`| Split Verically with size 50 |
|`<CTRL>wn`| Open new window |
|`<CTRL>wj` | Move to below window  |
|`<CTRL>wk` | Move to above window  | 
|`<CTRL>wh` | Move to left window  |
|`<CTRL>wl` | Move to right window  |
|`resize 10`| Resize window to 10 rows |
|`vertical resize 10`| Resize window to 10 columns | 

## Tab Operations
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

## File Tree
| Command | Description |
| --- | --- |
|`,pv` | Opens file tree to the left|  

## Vim - Movements
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

## Debugger (VimSpector)
Every command starts with 'd' (meaning debug), the following letters hint to action performed  

| Command | Description |
| --- | --- |
|`,dd` | Start Debugger  |
|`,de` | Exit Debugger  |
|`,d_` | Restart Debugger  |
|`,dj` | Step over  |
|`,dl` | Step into  |
|`,dk` | Step out  |
|`,drc` | Run to Cursor  |
|`,dbp` | Toggle Breakpoint  |
|`,di` | Inspect Variable  |
|`,<ENTER>`| Change value in variables|
|`<DEL>`|Delete watch|

To add variable to watch: go to watch window, go into insert mode and type the name of the variable and hit enter

## Vim Fugative
| Command | Description |
| --- | --- |
|`:G`| Open vim fugative|
|`g?`| Help |
|`s`| Stage file|
|`u` | Unstage file|
|`=` | Toggle inline diff|
|`dv`| Toggle vertical diff, to quit dq|
|`X`| Delete change on unstaged file|
|`cc`| commit|
|`:Gvdiffsplit`| vertical diff from previous commit |
|`:Gvdiffsplit main` | vertical diff split from branch|
| `:Gvdiffsplit!` | when in file to merge|
|`]c`| in merge to jump to next |
|`d2o`| accept from left window |
|`:d3o` | accept from right window|
| `:Gvdiffsplit!` | when in file to merge|

## Copying and pasting
Copy paste yank outside of vim
```
 "*y
 "*p
 ```

## Other
| Command | Description |
| --- | --- |
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
|`set spell spelllang=en_us`| Spell check strings |
|`set nospell`| Disable spell check|

buffers:
- shift q to exit

:Gitsigns
- blame_line  (see who edited line last)
- preview_hunk (see changes on a line)
