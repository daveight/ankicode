# How to bundle Linux app

- - -

1. Download ankicode empty app archive: wget https://github.com/daveight/ankicode/releases/download/1.1.0/ankicode-1.1.0-linux.tar.xz
2. Unarchive it: tar -xvf ankicode-1.1.0-linux.tar.xz
3. cd AnkiCode
4. mkdir libs && cd libs

## Install Java
1. wget https://download.java.net/java/GA/jdk11/9/GPL/openjdk-11.0.2_linux-x64_bin.tar.gz (full list is here: https://jdk.java.net/archive/)
2. tar xvf openjdk-11.0.2_linux-x64_bin.tar.gz -C libs/java
3. rm openjdk-11.0.2_linux-x64_bin.tar.gz

## Install JavaScript
1. install NVM (https://github.com/nvm-sh/nvm)
2. nvm install v14.17.0
3. cp -r ~/.nvm/versions/node/v14.17.0 libs/js

## Install Python
1. Install Pyenv (https://github.com/pyenv/pyenv-installer)
2. pyenv install -v 3.7.3
3. cp -r ~/.pyenv/versions/3.7.3 libs/python

## Install CPP
1. Download appropriate LLVM version (https://releases.llvm.org/download.html)
2. wget https://github.com/llvm/llvm-project/releases/download/llvmorg-10.0.0/clang+llvm-10.0.0-x86_64-linux-sles11.3.tar.xz (For SuSe)
3. tar xfv clang+llvm-10.0.0-x86_64-linux-sles11.3.tar.xz -C libs/cpp
4. rm clang+llvm-10.0.0-x86_64-linux-sles11.3.tar.xz
5. cp <ankicode_src_folder>/pylib/testing/framework/cpp/cpp_lib .

## Verify the application
1. ./AnkiCode
2. Load or create a deck - verify that code executes without errors.
2. Create archive: tar cfj AnkiCode-<version>-<Linux Distro>.tar.xz
