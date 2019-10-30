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

## adp

This is equivalent to:

```
git add .
git commit [-m ...]
git push origin HEAD
```
## cached

this is equivalent to `git diff --cached`

## cx

cx can make any files executable. It is equivalent to `chmod +x [file]`

## gazo

gazo is picture displaying script (iTerm's imgcat alias) for iTerm console app

## gssh

```
$gcloud compute ssh $@
```

## kp

Kill the process running on the specific port

```
$ kp [port]
```

By default the port is 80


## rian

```
$ react-native run-android
```

## rios

```
$ react-native run-ios
```

## tml

reload the tmux config

## .tmux.conf

Also for better experience in tmux, here is example of my configs

```
configs/.tmux.conf
```

## .vimrc


