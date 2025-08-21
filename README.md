# dotfiles

This directory contains dotfiles for various applications and shell configurations.

## Requirements

Ensure you have the following installed on your system:

**On Arch Linux:**
```
pacman -S git stow
```

**On macOS:**
```
brew install git stow
```

## Installation
To install the dotfiles, clone the repository and use GNU Stow to symlink the files into your home directory:

```
$ git clone git@github.com:RE-mpire/.dotfiles.git
$ cd dotfiles
$ stow .
```
