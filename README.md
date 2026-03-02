# flutter_app

Flutter application for estimating and reporting demolition waste.

The app is in a very early stage as of writing this.

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

In case that doesn't work, or you use a different editor, you can manually apply formatting with `dart format .` in the root directory before pushing code to repository.

## Learn Flutter

Mess around with this repository, create your own Flutter playground, watch videos.

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## Workflow

In order to make a new contribution to the repository, follow these steps:

### Step 1: Assign a task to yourself

Pick an available task from the [project's Kanban boards](https://github.com/orgs/project-kiertotalous/projects/1), assign yourself to it, and move it under "In Progress" column. You should always pick a task from "Current sprint" column, but in case it's empty and you want to put in more hours, use "Backlog" column.

### Step 2: Create a new branch

Pushing straight to main branch is forbidden! The following terminal commands create a new branch for you to work on.

```shell
git checkout main
git pull
git checkout -b <branch-name>
```

Name the branch to something descriptive of the task it is supposed to accomplish. I recommend using [conventional commits](https://www.conventionalcommits.org/en/v1.0.0/#summary) as the prefix. For example, if my branch fixes a bug in the reporting module, I might name the branch as `fix-report-13` with the suffix 13 indicating it fixes issue #13.

### Step 3: Commit and push your changes

The following terminal commands push your changes to the remote branch on GitHub.

```shell
git add .
git commit -m "fix: display value of cement report"
git push -u origin fix-report-13
```

Branches can contain multiple commits, and in fact it's highly encouraged. After finishing a _thing_, which might be a style touch-up or fixing a small bug, it's a good idea to commit your changes as long as the software is in a stabile state. It's then easy return to a previous commit in case you accidentally lots of spaghetti code you and don't even know what's going on anymore.

### Step 4: Create a pull request

Navigate to [Pull requests](https://github.com/project-kiertotalous/flutter-app/pulls) and create a pull request for your branch. Provide a short description about what your branch contributes. After the description, add `closes #13` or whatever issue number your branch handles; GitHub will automatically move the linked issue to "Done" column of Kanban boards once the branch is merged to main.

Also move your task in Kanban boards to "In review" (this might be possible to automate).

### Step 5: Review a pull request

Your pull request should not be merged to main before someone approves your branch by giving it a review. In the meantime, review someone else's pull request! The team's hierarchy is flat, so anybody can and should contribute. The point of reviews is not to criticize someone else's code, but obvious typos or redundancies should be pointed out -- it's in everyone's interest to protect the repository from subpar code.

In order to give a proper approval, it's encouraged to pull the branch and making sure it builds and passes test. This avoids the issue of "but it works on my computer". The main branch should never contain broken code!
