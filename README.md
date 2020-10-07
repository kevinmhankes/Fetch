# Fetch List

NOTE: Xcode 12 introduced an issue with Carthage builds that has yet to be resolved. In the meantime, please use the Carthage workaround script provided

EDIT: Previous workaround only worked for the Xcode 12 GM. I have provided an updated script that should work with Xcode 12.0.1

For more information on the Carthage build problems, please see the [Carthage Github repository issue](https://github.com/Carthage/Carthage/issues/3019)

Usage:
```
./wcarthage update --platform iOS --cache-builds
```

## Getting Started
Step 1 - Install [Homebrew](https://brew.sh/):

```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"```
```

or update an existing install:

```
brew update
```

Step 2 - Upgrade Homebrew packages:

```
brew upgrade
```

Step 3 - Install [Carthage](https://github.com/Carthage/Carthage):

```
brew install carthage
```

Step 4 - In the root folder of the project fetch dependencies:

```
carthage update --platform iOS
```

Step 5 - Open the project in Xcode
