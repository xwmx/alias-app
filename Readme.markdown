             ___
      ____ _/ (_)___ ______      ____ _____  ____
     / __ `/ / / __ `/ ___/_____/ __ `/ __ \/ __ \
    / /_/ / / / /_/ (__  )_____/ /_/ / /_/ / /_/ /
    \__,_/_/_/\__,_/____/      \__,_/ .___/ .___/
                                   /_/   /_/


# alias-app

Create an OS X "alias" application that simply opens another OS X application.

## Usage

    alias-app Example.app ExampleAlias.app

## Description

Creates an OS X application bundle that simply opens another OS X
application. The icon used by the original application is also used for
the alias application. In effect, this creates an application alias that
is recognized in Spotlight and the rest of the system as an application.

### Example Use Case

Homebrew installs applications to `/usr/local`, which is not indexed by
Spotlight. The `brew linkapps` command creates symbolic links in
`/Applications` (or `~/Applications` when passed the `--local` flag),
but Spotlight doesn't index symbolic links.

In order to create an application bundle that is indexed by Spotlight
and that opens an instance of MacVim installed with Homebrew, we can use
the following command:

    alias-app /usr/local/Cellar/macvim/7.4-73_1/MacVim.app /Applications/MacVim.app

`/Applications/MacVim.app` can now be used to open the homebrew-install MacVim.

## Homebrew Commands

Since this is particularly useful for linking homebrew-installed
applications, included in the `homebrew` directory are commands for
aliasing applications installed by both homebrew and homebrew cask. To
use them, symlink them from a location in your `$PATH` (eg, `~/bin/`)
and call them using either `brew aliasapps` or `brew cask aliasapps`
(for homebrew and homebrew cask, respectively) after installing new applications.

*Note: both script assume that your both homebrew and homebrew cask are
symlinking applications in the local `~/Applications` directory. While
this is the default for homebrew cask, homebrew requires using the `--local`
flag when linking apps, ie, using the following command: `brew linkapps --local`*

Neither of the homebrew commands are required by `alias-app` itself, and
the `alias-app` command can be used completely independently of them.

