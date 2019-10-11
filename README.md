# easy mac scrript

Alias script which makes Mac user's development productive.

# Installation

```
$ ./installer
```

## adm

git add . => git commit

or

```
$ adm I did this commit because of shitty bugs.
```

the command above triggers:

```
$ git add .
$ git commit -m "I did this commit because of shitty bugs."
```

## cached

this is equivalent to `git diff --cached`

## cx

cx can make any files executable. It is equivalent to `chmod +x [file]`

## kp

Kill the process running on the specific port

```
$ kp [port]
```

By default the port is 80

## tml

reload the tmux config

## .tmux.conf

Also for better experience in tmux, here is example of my configs

```
configs/.tmux.conf
```

## .vimrc


