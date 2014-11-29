# appalias

Create an OS X application that simply opens another OS X application.

## Usage

    appalias Example.app ExampleAlias.app

## Description

Creates an OS X application bundle that simply opens another OS X
application. The icon used by the original application is also used for
the alias application.

### Example Use Case

Homebrew installs applications to `/usr/local`, which is not indexed by
Spotlight. The `brew linkapps` command creates symbolic links in
`/Applications` (or `~/Applications` when passed the `--local` flag),
but Spotlight doesn't index symbolic links.

In order to create an application bundle that is indexed by Spotlight
and that opens an instance of MacVim installed with Homebrew, we can use
the following command:

    appalias /usr/local/Cellar/macvim/7.4-73_1/MacVim.app /Applications/MacVim.app

`/Applications/MacVim.app` can now be used to open the homebrew-install MacVim.


