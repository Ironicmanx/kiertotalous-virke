# flutter_app

Flutter application for estimating and reporting demolition waste.

The app is in active commercial development

## Setup

Clone this repository with one of the methods below:
HTTPS: `https://github.com/project-kiertotalous/flutter-app.git`
SSH: `git@github.com:project-kiertotalous/flutter-app.git`
Github CLI: `gh repo clone project-kiertotalous/flutter-app`

### rps

Install [rps](https://pub.dev/packages/rps) to enable scripts (not mandatory, but helpful):
`dart pub global activate rps`

In case you run into warning similar to the one below, you need to add rps to your path manually by following the instructions. Exact method depends on your operating system. Ubuntu (Linux) example below:

```bash
Warning: Pub installs executables into $HOME/.pub-cache/bin, which is not on your path.
You can fix that by adding this to your shell's config file (.bashrc, .bash_profile, .zshrc etc.):

  export PATH="$PATH":"$HOME/.pub-cache/bin"
```

After that, and restarting with `bash` command, or perhaps the whole computer in Windows case, rps should be available for use.

To view all the scripts, run `rps ls`

### Activate calculation submodule

Run `git submodule update --init --recursive`

Or `rps init`

## Generate calculation classes

Run:

```shell
cd calculation
dart pub get
dart run build_runner build
cd ..
```

Or `rps gen`

## Install Flutter

Once everything is correctly installed, running `flutter doctor` in terminal should return something like this:

```
Doctor summary (to see all details, run flutter doctor -v):
[✓] Flutter (Channel stable, 3.27.3, on Ubuntu 22.04.5 LTS 6.8.0-52-generic, locale
    en_CA.UTF-8)
[✓] Android toolchain - develop for Android devices (Android SDK version 33.0.0)
[✓] Chrome - develop for the web
[✓] Linux toolchain - develop for Linux desktop
[!] Android Studio (not installed)
[✓] VS Code (version 1.96.4)
[✓] Connected device (2 available)
[✓] Network resources

! Doctor found issues in 1 category.
```

Android Studio is not (yet) needed, so don't bother with it.

## Clone this repository

If you have access to this page, you can clone the repository. If git is not yet familiar, it is highly encouraged to spend some time on learning it.

## Formatting settings

We use [dart default formatting](https://dart.dev/tools/dart-format) across the repository and its submodules. Your editor may have its own opinions about that, but they should be taken care of one way or another.

In case you're a VSCode enjoyer, dart formatting can be applied any time you save the file you're working on.

In VSCode, press `ctrl+shift+P` and open `Preferences: Open User Settings (JSON)`. In there, apply the "[dart]" settings like so:

```JSON
# start of JSON file
{
  ...
  "[dart]": {
    "editor.defaultFormatter": "Dart-Code.dart-code",
    "editor.formatOnSave": true,
    "editor.formatOnType": true,
    "editor.rulers": [80],
    "editor.selectionHighlight": false,
    "editor.suggest.snippetsPreventQuickSuggestions": false,
    "editor.suggestSelection": "first",
    "editor.tabCompletion": "onlySnippets",
    "editor.wordBasedSuggestions": "off"
  },
  ...
}
```
