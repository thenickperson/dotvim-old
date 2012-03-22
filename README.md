Nicolas McCurdy's Assorted Vim Awesomeness
==========================================

Originally Cody Krieger's [Super Awesome Vim Files (tm)](/codykriger/dotvim), modified to Nicolas McCurdy's liking.
Based off of a slimmed down [Janus](/carlhuda/janus) and managed with [Pathogen](/tpope/vim-pathogen).
See below for a list of plugins, customizations and color schemes.

Installing
==========

## If on Mac OS X

Install MacVim if you want it (you should)!!

```
brew install macvim # you better be using homebrew *shakes fist*
```

Otherwise, you're set.

## If on another OS

- Have some flavour of Ruby installed
- Install gvim with your favorite package manager (optional)
- Install rake (```[sudo] gem install rake```)

## Then...

```
curl https://raw.github.com/thenickperson/dotvim/master/bootstrap.sh -o - | sh
```

In most cases, that'll do it!

## Install Exuberant Ctags

Go ahead and install [Exuberant Ctags](http://ctags.sourceforge.net/) for your OS.
This will let the taglist plugin look through your source code for tags (so you can
jump between functions and classes and stuff in handy ways).

## Nerdy awesome font things

You should install this really awesome programmer's font called [Tamsyn](http://www.fial.com/~scott/tamsyn-font/).
It's monospaced, bitmapped (shouldn't be antialiased), and is readable at really tiny font sizes.
NOTE: If you're on Linux, especially on an Ubuntu or Debian based distro, you may need to enable bitmapped font support.

## Ignoring documentation content in submodules

Run this bad boy in your ~/.vim folder:

```
git submodule -q foreach 'echo "git config submodule.$path.ignore untracked"'
```

Copy the lines it outputs, and paste them into your terminal. No more 
annoyingness in `git status`!

Plugins & Customizations
========================

## Nick's Modifications
- Use tabs for line indents instead of spaces (grr!)
- Disable text wrapping
- Use Tamsyn, my favorite bitmapped programmer's font
- Use the molokai color scheme (an awesome, dark color scheme that looks similar in both gvim and terminal vim)
- Add a diff command for unsaved changes to the current file
- Add some more plugins (such as powerline for an awesomer status bar and taglist's sidebar for quickly browsing source code)
- Add some more useful shortcuts (";" maps to ":" for commands, ";;" typed quickly will leave insert mode)
- Add some more tweaked syntax things for web development (because HTML 5 tags are awesome)
- Other minor tweaks (check out the commented vimrc!)

## Plugins

```
align          # for auto-aligning assignment statements, etc.
command-t      # textmate-like fuzzy file quick-open thingy. mapped to <super>t and <leader>t
easymotions    # improved motions
endwise        # auto-insert end keyword in ruby
fugitive       # uber handy git tools for vim
gist           # create github gists right from within vim!
git            # syntax highlighting for git files and some other cool stuff
indent-object  # represents code at the same indent level as an object
nerdcommenter  # awesome automagical commenting plugin, mapped to <leader>/
nerdtree       # project drawer! hide/show mapped to <leader>n
powerline      # extreme awesome looking and handy status bar (with color coding for different modes)
puppet         # duh, puppet
rails          # if you're not using this with rails, you're doing it wrong (tm)
snipmate       # textmate-like snippets
supertab       # SUPERTAB!!!!!
surround       # quoting/parenthesizing made simple
taglist        # show tags (files, classes, functions, methods, etc.) for files you're working with in a handy sidebar
unimpaired     # handy bracket mappings
zencoding      # awesome html fanciness, look it up
```

## Syntaxes

```
coffee-script
css (improved)
cucumber
haml
html5 (improved)
javascript
markdown
mustache
rspec
ruby (updated)
scala
textile
```

## Customizations

- Leader set to comma (,), not backslash (\\)
- Enter commands with ; instead of : (both work)
- ;; to quickly exit insert mode (esc still works)
- \<leader\>l to toggle taglist
- Custom :Fdiff command for viewing diffs of unwritten changes to files
- Status bar on (with Powerline awesomeness!)
- Ruler on (col/row display in status bar)
- Default to real tabs for indenting
- Remembers last location in a given file
- Automagical, syntax-aware auto-indent
- \<leader\>e autocompletion to the current dir to edit a file
- \<leader\>te autocompletion to the current dir to edit a file in a new
  tab
- ctrl-up and ctrl-down to "bubble" lines up and down in normal and
  visual modes
- F1 remapped to :nohl to turn off search highlighting when you're done
  searching
- ~/.vim/backup directory for holding .swp files
- ctrl-k for deleting lines (dd command)
- \<leader\>tn to switch to the next tab, \<leader\>tp for previous tab

That's most of it. The rest of the customizations are mainly GUI tweaks,
etc. Take a look at the vimrc/gvimrc files for more info. They're pretty
decently commented.

Color Schemes
=============

```
solarized
color-sampler-pack
molokai (default)
irblack
vividchalk
```

Command-T
=========

If you take a look at the first four or so lines of the vimrc, you'll 
notice that I've told Pathogen to disable loading Command-T on non-Mac 
OS X systems. This is because you'll end up with the following error 
unless you perform some trickery:

```
Vim: Caught deadly signal SEGV...
```

That means your vim/gvim was compiled with Ruby, but ```setup.sh```
compiled Command-T with a **different version** of Ruby. To fix this, you'll
need to find the version of Ruby your vim/gvim was compiled against
(```[vim|gvim] --version``` and sift through the output), install that,
rubygems, and rake, and then do one of these:

```
cd ~/.vim/bundle/command-t
/path/to/your/rake/binary make
```

Then run vim/gvim again, and you should be okay! If not...forget about 
Command-T.
