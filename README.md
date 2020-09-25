# Fetch List

## Getting Started
Step 1 - Install [Homebrew](https://brew.sh/):

...
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
...

or update an existing install:

...
brew update
...

Step 2 - Upgrade Homebrew packages:

...
brew upgrade
...

Step 3 - Install [Carthage](https://github.com/Carthage/Carthage):

...
brew install carthage
...

Step 4 - In the root folder of the project fetch dependencies:

...
carthage update --platform iOS
...

Step 5 - Open the project in Xcode
