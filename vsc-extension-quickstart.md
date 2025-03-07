# Welcome to your VS Code Extension

## What's in the folder
* This folder contains all of the files necessary for your extension.
* `package.json` - this is the manifest file in which you declare your language support and define
the location of the grammar file that has been copied into your extension.
* `syntaxes/rexx.tmLanguage` - this is the Text mate grammar file that is used for tokenization.
* `syntaxes/language-configuration.json` - this the language configuration, defining the tokens that are used for
comments and brackets.

## Get up and running straight away
* Make sure the language configuration settings in `language-configuration.json` are accurate.
* Press `F5` to open a new window with your extension loaded (this happens through `.vscode/launch.json`).
* Create a new file with a file name suffix matching your language.
* Verify that syntax highlighting works and that the language configuration settings are working.

## Make changes
* You can relaunch the extension from the debug toolbar after making changes to the files listed above.
* You can also reload (`Ctrl+R` or `Cmd+R` on Mac) the VS Code window with your extension to load your changes.

## Add more language features
* To add features such as intellisense, hovers and validators check out the VS Code extenders documentation at
https://code.visualstudio.com/docs

## Install your extension
To start using your extension with Visual Studio Code 

1. Locate the  the `<user home>/.vscode/extensions` folder, e.g. `C:\Users\You\.vscode\extensions\`.
2. Inside that folder, create a folder for your extension. The folder name for your extension needs to start with your publisher name from your `package.json`, e.g. `zocterminal.zoc-rexx-highlighting-1.0.4`.
3. Copy the extension files to that folder (package.json, package-icon, readme, changelog, license and the syntaxes folder with the rexx.tm.json file). Alterately see the `makefile` in `make-syntaxes', it has an `nmake deploy` option.
4. Restart VS-Code and you should immediately see the entry in the extension pane.

To share your extension with the world, read on https://code.visualstudio.com/docs about [publishing](https://code.visualstudio.com/api/working-with-extensions/publishing-extension) an extension.
