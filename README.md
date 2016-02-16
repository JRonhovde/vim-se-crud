
# vim-sycamore-crud
Easy conversion from mysql_result() to CRUD->get()

Version 1.0 - Feb 16 2016    
## Installation/Setup

If you don't have a preferred installation method, I recommend
installing [pathogen.vim](https://github.com/tpope/vim-pathogen), and
then simply copy and paste:

    cd ~/.vim/bundle
    git clone git://github.com/JRonhovde/vim-sycamore-crud
    
If not using the Pathogen plugin manager, just create a directory called `plugin` in your `~/.vim/` folder and place the `.vim` file from this repo there: 

    cd ~/.vim
    mkdir plugin

Include a visual mode remap for the SCrud command:

    vnoremap <leader>crud <esc>:SCrud<CR>   

`<leader>` is a vim meta-character that can be bound to most keyboard keys. Most systems have it bound to backslash(`\`).

## Usage
 - Convert existing mysql_query into a CRUD->fetch() method.
 - Convert 'for' loop to 'foreach' over the array of CRUD objects.
 - Make a visual selection starting on the 'foreach' line and include all mysql_result() lines you with to modify.
 - Execute `:SCrud` or `<leader>crud`(Vim will automatically prepend `'<,'>` to these commands)
 - You can also pass the name of the CRUD object as an argument: `'<,'>SCrud objectName` or `'<,'>SCrud $objectName` 


If you encounter any problems, try updating the plugin from git:    

    cd ~/.vim/bundle/vim-sycamore-crud
    git fetch -p    
    git merge origin/master    

If the problem persists, it can be brought to my attention by creating an issue on [GitHub](https://github.com/JRonhovde/vim-sycamore-crud)
