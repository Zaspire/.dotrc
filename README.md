# .dotrc
A personal collection of dotfiles.

##Dependencies
Ubuntu

```
xclip emacs cmake
```

OS X

```
homebrew
go mercurial emacs editorconfig cmake autoconf automake pkg-config git gdb node python
```

```
git submodule update --init --recursive
cd ycmd
PATH=/usr/bin:/bin:/usr/sbin:/usr/local/bin # should use python not from homebrew
python3 ./build.py --all

python3 -m venv ~/.emacs.d/VE3
~/.emacs.d/VE3/bin/pip3 install -r requirements.txt
```